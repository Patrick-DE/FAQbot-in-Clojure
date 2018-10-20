(ns clojure-rest.handler
  (:import com.mchange.v2.c3p0.ComboPooledDataSource) ;PLAIN JAVA CLASS
  (:use ring.util.response)
  (:use ring.middleware.session)
  ;REST-SERVICE
  (:use compojure.core)
  (:require [compojure.handler :as handler]
            [compojure.route :as route]
            [ring.middleware.json :as middleware]
	    [ring.middleware.session]
            [clojure.java.jdbc :as sql]
  )
  ;EMAIL CLIENT
  (:use postal.core)
  (:use clojure.java.io)
  (:require [clojure-mail.core :refer :all]
          [clojure-mail.gmail :as gmail]
          [clojure-mail.message :refer (read-message)]
          [clojure-mail.events :as events]
          [clojure-rest.db]
          [clojure-rest.email]
          [clojure-rest.reminder]
  )
;Reminder
   (:require [clojurewerkz.quartzite.scheduler :as qs]
            [clojurewerkz.quartzite.triggers :as t]
            [clojurewerkz.quartzite.jobs :as jobs]
            [clojurewerkz.quartzite.jobs :refer [defjob]]
            [clojurewerkz.quartzite.schedule.cron :refer [schedule cron-schedule]])

)



(defn uuid [] (str (java.util.UUID/randomUUID)))
(defn parse-int [s] (Integer/parseInt (re-find #"\A-?\d+" s)))

;EXECUTE ON RUN PROGRAMM
(prn "---------------")
(prn "CHECKING DB!")
(db-schema-automigrate)
(prn "---------------")



;INTERNAL FUNCTIONS
(defn get-answerID [answer]
  (sql/with-connection (db-connection)
    (sql/with-query-results results
      ["select aid from ANSWERS where answer = ?" answer]
      (cond
        (empty? results) {:status 404}
        :else (get (first results) :aid)
      )
    )
  )
)
(defn get-keywordID [keyword]
  (sql/with-connection (db-connection)
    (sql/with-query-results results
      ["select kid from KEYWORDS where keyword = ?" keyword]
      (cond
        (empty? results) {:status 404}
        :else (get (first results) :kid)
      )
    )
  )
)



;PERMISSIONS
(defn has-role [request checkrole]
  (let [sessionrole (get-in request[:session :roles])]
    (cond
      (= (compare sessionrole checkrole) 0) true
      :else false
    )
  )
)
(defn validate-session [request & role]
  (let [uid (get-in request[:session :uid])]
    (cond
      (some? uid)
      (do
        (cond
          (= (compare (first role) "Instructor") 0)
          (do
            (let [access (has-role request (first role))]
              (cond
                (= access true) 1
                :else 2
              )
            )
          )
          :else 1
        )
      )
      :else 0
    )
  )
)
(defn is-owner? [request uid]
  (let [suid (get-in request[:session :uid])]
    (prn suid uid)
    (cond
      (or (and (some? suid)(= uid suid)) (has-role request "Instructor")) true
      :else false
    )
  )
)


;SERVER PAGES
(defn verify [request mymap & args]
  (let [access (validate-session request (get mymap :role "user"))]
    (cond
      (= access 1) (do
         (cond (some? args)
            (eval (read-string (format "(%s %d)" (get mymap :rest) (Integer/parseInt(first args)) )))
            :else (eval (read-string (format "%s" (get mymap :rest))))
         )
      )
      (= access 2) (resource-response "denied.html" {:root "public"})
      (= access 0) (resource-response "missing.html" {:root "public"})
    )
  )
)

;CONTEXT = USERS
(defn delete-session [request]
  (-> (resource-response "logout.html" {:root "public"})
    (assoc :session nil)
  )
)
(defn get-user [request]
  (let [uid (get-in request[:session :uid])]
    (sql/with-connection (db-connection)
      (sql/with-query-results results
        ["select * from USERS WHERE uid = ?" uid]
        (let [roles (get (first results) :roles)]
          (let [email (get (first results) :email)]
            (-> (response (into [] results))
              (assoc :session (hash-map :uid uid :roles roles :email email))
            )
          )
        )
      )
    )
  )
)
(defn get-user-by-id [request uid]
  (cond
    (= (is-owner? request uid) true)
    (when true
      (prn "Access granted")
      (sql/with-connection (db-connection)
        (sql/with-query-results results
          ["select * from USERS WHERE uid = ?" uid]
          (response (into [] results))
        )
      )
    )
    :else (resource-response "denied.html" {:root "public"})
  )
)
(defn create-user [request]
  (let [uid (get-in request[:form-params "user_id"])]
    (prn "Creating user " uid)
    (let [hsid (get-in request[:form-params "lis_person_sourcedid"])]
      (let [roles (get-in request[:form-params "roles"])]
        (let [email (get-in request[:form-params "lis_person_contact_email_primary"])]
          (let [fullname (get-in request[:form-params "lis_person_name_full"])]
            (sql/with-connection (db-connection)
              (sql/insert-record :USERS (hash-map :uid uid :hsid hsid :roles roles :email email :fullname fullname))
            )
          )
        )
      )
    )
    (get-user uid)
  )
)
(defn auth-user [request]
  (let [uid (get-in request[:form-params "user_id"])]
    (sql/with-connection (db-connection)
      (sql/with-query-results results
        ["select count(*) as exist from USERS where uid=?" uid]
        (let [count (get (first results) :exist)]
          (cond
            (zero? count) (create-user request)
            :else (do
              (sql/with-query-results user
                ["select * from USERS WHERE uid = ?" uid]
                {:status 302
                 :headers {"Location" "/"}
                 :session (hash-map :uid uid :roles (get (first user) :roles) :email (get (first user) :email))}
              )
            )
          )
        )
      )
    )
  )
)



;CONTEXT = ANSWERS
(defn get-all-answers [request]
  (sql/with-connection (db-connection)
    (sql/with-query-results results
      ["select t1.aid, t1.answer, GROUP_CONCAT(t3.keyword) as keyword from ANSWERS AS t1 JOIN KEYANSWER AS t2 ON t1.aid = t2.aid JOIN KEYWORDS as t3 ON t2.kid = t3.kid GROUP BY t1.aid"]
      (response (into [] results))
    )
  )
)
(defn get-answer [aid]
  (sql/with-connection (db-connection)
    (sql/with-query-results results
      ["select t1.answer, t3.keyword from ANSWERS AS t1 JOIN KEYANSWER AS t2 ON t1.aid = t2.aid JOIN KEYWORDS as t3 ON t2.kid = t3.kid where t1.aid = ?" aid]
      (cond
        (empty? results) {:status 404}
        :else (response (first results))
      )
    )
  )
)
(defn create-new-answer [request]
  (let [myanswer (get-in request[:body "answer"])]
    (let [mykeywords (clojure.string/split (get-in request[:body "keywords"]) #",")]
      (prn "OK until here its working!")
      (prn myanswer mykeywords)
      (doseq [x mykeywords]
        (sql/with-connection (db-connection)
          (sql/insert-record :KEYWORDS (hash-map :keyword x))
        )
      )
      (sql/with-connection (db-connection)
        (sql/insert-record :ANSWERS (hash-map :answer myanswer))
      )
      (let [aid (get-answerID myanswer)]
        (doseq [y mykeywords]
          (let [kid (get-keywordID y)]
            (sql/with-connection (db-connection)
              (sql/insert-record :KEYANSWER (hash-map :kid kid :aid aid))
            )
          )
        )
      )
    )
  )
  (response {:STATUS "Successfully created answer"})
)

(defn update-answer [request aid]
  (let [body (get request :body)]
    (sql/with-connection (db-connection)
      ;Lese AID aus der bestehenden Zeile
      (let [answer (assoc body "aid" aid)]
        (sql/update-values :ANSWERS ["aid=?" aid] answer)
      )
    )
    (get-answer aid)
  )
)

(defn deleteKeywords [kid]
(sql/with-connection (db-connection)
     (sql/delete-rows :KEYANSWER ["kid=?" (get kid :kid)])
	(sql/delete-rows :KEYWORDS ["kid=?" (get kid :kid)])
  )
(prn (second kid))
(prn "removed")
)


(defn delete-answer [aid]
  (sql/with-connection (db-connection)
     (sql/delete-rows :ANSWERS ["aid=?" aid])
  )
  (sql/with-connection (db-connection)
    (sql/with-query-results results
        ["SELECT kid, (SELECT COUNT(*) FROM KEYANSWER WHERE aid = ?) as count FROM KEYANSWER WHERE aid = ?" aid aid]
	(prn "the results")
	(prn results)
	(def counterVal (get (nth results 0) :count))
(loop [x 0]
  (when (< x counterVal)
    (deleteKeywords (nth results x))
    (prn x)
    (recur (+ x 1))))
    )
  )
  {:status 200}
)

;CONTEXT = CHATS
(defn get-last-chats [request]
  (let [uid (get-in request[:session :uid])]
    (sql/with-connection (db-connection)
      (sql/with-query-results results
        ["select date, question, answer from AJAXCHAT AS t1 JOIN ANSWERS AS t2 ON t1.aid = t2.aid AND uid = ? ORDER BY date DESC LIMIT 0, 10" (int (read-string uid))]
        (response (into [] results))
      )
    )
  )
)
(defn get-last-chats-by-id [request uid]
  (cond
    ;(is-owner? request uid)
    (= (is-owner? request uid) true)
    (when true
      (sql/with-connection (db-connection)
        (sql/with-query-results results
          ["select date, question, answer from AJAXCHAT AS t1 JOIN ANSWERS AS t2 ON t1.aid = t2.aid AND uid = ? ORDER BY date DESC LIMIT 0, 10" (int (read-string uid))]
          (response (into [] results))
        )
      )
    )
    :else (resource-response "denied.html" {:root "public"})
  )
)


(defn create-new-chat [request body]
	(prn "called")
  (let [access (validate-session request)]
    (cond
      (= access 1)(do
        (let [triggers (second (first body))]
          (sql/with-connection (db-connection)
            (sql/with-query-results results
              [(clojure.string/join "" ["CALL GetAnswer('",(prepareMessage triggers),"')"])]
              (cond
                (empty? results) {:status 404}
                :else (def answer (first results))
              )
            )
          )
        )
        (let [uid (get-in request[:session :uid])]
          (let [question (second (first body))]
            (sql/with-connection (db-connection)
              (sql/insert-record :AJAXCHAT (hash-map :uid uid :question question :aid (get answer :aid)))
            )
          ) 
          (response {:status 200})

        )
      )
      (= access 2) (resource-response "denied.html" {:root "public"})
      (= access 0) (resource-response "missing.html" {:root "public"})
    )
  )
)
(defn get-chat [request uid cid]
  (sql/with-connection (db-connection)
    (sql/with-query-results results
      ["select cid, date, question, answer from AJAXCHAT AS t1 JOIN ANSWERS AS t2 ON t1.aid = t2.aid WHERE uid = ? AND cid = ?" uid cid]
      (response (into [] results))
    )
  )
)
;Reminder
(defn get-all-reminders [request]
  (sql/with-connection (db-connection)
    (sql/with-query-results results
      ["SELECT * FROM REMINDERS"]
      (response (into [] results))
    )
  )
)

(defn create-new-reminder [request]
  (sql/with-connection (db-connection)
    (sql/insert-record :REMINDERS (hash-map :message(get-in request[:body "message"]) :crontime (get-in request[:body "crontime"]) 
                                            :subject (get-in request[:body "subject"])))
  )
 (initReminder (get-in request[:body "message"]) (get-in request[:body "subject"]) (get-in request[:body "crontime"]))
(response {:STATUS "Successfully created answer"})
)

(defn delete-reminder [rid]
  (sql/with-connection (db-connection)
     (sql/with-query-results results
      ["SELECT * FROM REMINDERS WHERE rid=?" rid]
	(prn (get (first results) :crontime))
      (deleteReminder (str (get (first results) :message) (get (first results) :crontime)))
     (sql/delete-rows :REMINDERS ["rid=?" rid])
    )
  )
)



; CONTEXT = ROUTING
(defroutes app-routes
  (GET "/" request (verify request (hash-map :rest '(ring.util.response/resource-response "index.html" {:root "public"}))))
  (POST  "/" request (auth-user request))
    ;RESOURCES MAPPING (JS/CSS)
    (route/resources "/")
    ;rest API
    (context "/admin" request (defroutes admin-routes
      (GET "/" [] (verify request (hash-map :rest 
        '(ring.util.response/resource-response "admin.html" {:root "public"}) :role "Instructor" )))
      (context "/answers" [] (defroutes answers-routes
        (GET   "/" [] (verify request (hash-map :rest 
          'clojure-rest.handler/get-all-answers :role "Instructor")))
        (POST  "/" [] (verify request (hash-map :rest 
          'clojure-rest.handler/create-new-answer :role "Instructor")))
        (context "/:aid" [aid](defroutes answer-routes
          (GET   "/" [](verify request (hash-map :rest 
            'clojure-rest.handler/get-answer :role "Instructor") aid))
          (PUT   "/" [] (verify request (hash-map :rest 
            'clojure-rest.handler/update-answer :role "Instructor") aid))
          (DELETE"/" [] (verify request (hash-map :rest 
            'clojure-rest.handler/delete-answer :role "Instructor") aid))
        ))
      ))
    ))

	(context "/reminder" request (defroutes admin-routes
      (GET "/" [] (verify request (hash-map :rest 
        '(ring.util.response/resource-response "reminder.html" {:root "public"}) :role "Instructor" )))
      (context "/reminders" [] (defroutes answers-routes
        (GET   "/" [] (verify request (hash-map :rest 
          'clojure-rest.handler/get-all-reminders :role "Instructor")))
        (POST  "/" [] (verify request (hash-map :rest 
          'clojure-rest.handler/create-new-reminder :role "Instructor")))
        (context "/:rid" [rid](defroutes reminder-routes
          (DELETE"/" [] (verify request (hash-map :rest 
            'clojure-rest.handler/delete-reminder :role "Instructor") rid))
        ))
      ))
    ))


    (context "/user" request (defroutes user-routes
      (GET   "/" [] (get-user request))
      (GET   "/logout" [] (delete-session request))
      (GET   "/:uid" [uid] (get-user-by-id request uid))
    ))

    (context "/chats" request (defroutes chats-routes
      (GET   "/" [] (get-last-chats request))
      (POST  "/" {body :body} (create-new-chat request body))
      (context "/:uid" [uid] (defroutes chat-routes
        (GET   "/" [] (get-last-chats-by-id request uid))
        (GET   "/:cid" [cid] (get-chat request uid cid))
        ;(PUT   "/" {body :body} (update-chat cid body))
        ;(DELETE"/" [] (delete-chat cid))
      ))
    ))
   ; (ANY "*" [] (route/not-found (resource-response "error.html" {:root "public"})))
    (ANY "*" request (route/not-found (prn request)))
)


(def app
  ;->  threading macro used to chain middleware together #' is for autoreload after change!
  ;PATTERN Chain Of Responsibility '->'
  (-> (#'handler/api app-routes)
    (ring.middleware.session/wrap-session)
    (middleware/wrap-json-body)
    (middleware/wrap-json-response)
  )
)
