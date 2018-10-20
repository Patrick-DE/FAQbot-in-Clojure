(require '[clojure.java.jdbc :as j])
;DECLERATE DB-CONFIG
;; :subname "/tmp/documents"


(def defaultAnswer "Es konnte leider keine passende Antwort zu deiner Frage ermittelt werden.
 Achte auf korrekte Rechtschreibung und Tippfehler und versuche es erneut.")

(def pathToSTDAnswers "/home/jonas/clojure-rest/src/clojure_rest/stdAnswers.txt")

(def db-config
  {:classname "com.mysql.jdbc.Driver"
  :subprotocol "mysql"
   :subname "//cloud.eisenschmidt.family:46306/efp"
   :user "efp"
   :password "efp2018"
  }
)

;DEFINE DB CONNECTIONPOOL
(defn pool
  [config]
  (let [cpds (doto (ComboPooledDataSource.)
      (.setDriverClass (:classname config))
      (.setJdbcUrl (str "jdbc:" (:subprotocol config) ":" (:subname config)))
      (.setUser (:user config))
      (.setPassword (:password config))
      (.setMaxPoolSize 6)
      (.setMinPoolSize 1)
      (.setInitialPoolSize 1)
       )
       ]
  {:datasource cpds}
  )
)

(def pooled-db (delay (pool db-config)))

(defn db-connection [] @pooled-db)

(defn apply-schema-migration []
  (sql/with-connection (db-connection)
    (sql/drop-table :AJAXCHAT)
    (sql/drop-table :ANSWERS)
    (sql/drop-table :KEYANSWER)
    (sql/drop-table :KEYWORDS)
    (sql/drop-table :USERS)
    (sql/create-table :AJAXCHAT
                        [:cid "int" "primary key"]
                        [:uid "int" "NOT NULL"]
                        [:aid "int" "NOT NULL"]
                        [:question :varchar "NOT NULL"]
                        [:date :timestamp "NOT NULL" "DEFAULT CURRENT_TIMESTAMP"]
    )
    (sql/create-table :ANSWERS
                        [:aid "int" "primary key"]
                        [:answer :varchar "NOT NULL"]
    )
    (sql/create-table :KEYANSWER
                        [:kaid "int" "primary key"]
                        [:kid "int" "NOT NULL"]
                        [:aid "int" "NOT NULL"]
    )
    (sql/create-table :KEYWORDS
                        [:kid "int" "primary key"]
                        [:keyword :varchar "NOT NULL"]
    )
    (sql/create-table :USERS
                        [:uid "int" "primary key"]
                        [:oauthid "int" "NOT NULL"]
                        [:creation :timestamp "NOT NULL" "DEFAULT CURRENT_TIMESTAMP"]
                        [:hsid "int" "NOT NULL"]
                        [:roles :varchar "NOT NULL"]
                        [:email :varchar "NOT NULL"]
                        [:hash :varchar "NOT NULL"]
    )
   (sql/create-table :REMINDERS
                        [:rid "int" "primary key"]
                        [:message :varchar "NOT NULL"]
				  [:crontime :varchar "NOT NULL"]
				  [:subject :varchar "NOT NULL"]
    )
  )
)



(sql/with-connection (db-connection)
(prn "Checking default answers")
  (sql/with-query-results results
      ["SELECT COUNT(*) as counter FROM ANSWERS WHERE answer = ?" defaultAnswer]
      (def exists (get (first results) :counter))
  )
  (cond
        (= exists 0)  (sql/delete-rows :ANSWERS ["aid=?" "1"])			
        :else (prn "default answer exists")
   )
  (cond
        (= exists 0)   (sql/insert-record :ANSWERS (hash-map :aid "1" :answer defaultAnswer))			
        :else (str "")
   )
  (cond
        (= exists 0)  (prn "inserted answer")		
        :else (str "")
   )
)

;INSERT ANSWERS from text file
;seperate answer and keyword keywords with "----". 
;seperate answer with keywords and answer with keywords with ";;;;",

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

(defn insertAnswerIfNotExists [answer keywords]
  (sql/with-connection (db-connection)
    (sql/with-query-results results
      ["SELECT COUNT(*) as counter FROM ANSWERS WHERE answer = ?" answer]
      (def exists (get (first results) :counter))
    )
  )
  (cond
        (= exists 0)   (sql/insert-record :ANSWERS (hash-map :answer answer))			
        :else (prn "answer exists")
   )
  (def mykeywords (clojure.string/split keywords #","))
  (cond
        (= exists 0)  (doseq [x mykeywords]
        					(sql/with-connection (db-connection)
          						(sql/insert-record :KEYWORDS (hash-map :keyword x))
        					)
  					 )							
        :else (str answer)
   )
   (cond
        (= exists 0)  (let [aid (get-answerID answer)]
        				(doseq [y mykeywords]
          					(let [kid (get-keywordID y)]
            					(sql/with-connection (db-connection)
              						(sql/insert-record :KEYANSWER (hash-map :kid kid :aid aid))
            					)
          					)
        				)
   				)
        :else (str answer)
   )

)

(def stdAnswersAll (clojure.string/split (slurp pathToSTDAnswers :encoding "ISO-8859-1") #";;;;"))
(defn insertThoseAnswers []
  (doseq [y stdAnswersAll]
		(let [answerAndTrigger  (clojure.string/split y #"----")]
			;(insertAnswerIfNotExists (first answerAndTrigger) (clojure.string/replace (second answerAndTrigger) #"(^[öÖäÄüÜßa-zA-Z0-9]*$)" ""))
		)
  )
)


;Shema Migration
(defn db-schema-automigrate []
  (sql/with-connection (db-connection)
    (sql/with-query-results results
      ["select count(*)as exist from information_schema.tables where table_name='AJAXCHAT'"]
      (let [count (get (first results) :exist)]
        (cond
          (zero? count) (apply-schema-migration)
          :else (insertThoseAnswers)
        )
      )
    )
  )
)







