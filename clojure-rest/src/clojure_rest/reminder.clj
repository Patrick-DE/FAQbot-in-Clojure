
(require '[clojurewerkz.quartzite.scheduler :as qs]
            '[clojurewerkz.quartzite.triggers :as t]
            '[clojurewerkz.quartzite.jobs :as jobs]
            '[clojurewerkz.quartzite.jobs :refer [defjob]]
            '[clojurewerkz.quartzite.schedule.cron :refer [schedule cron-schedule]])
(require '[clojurewerkz.quartzite.conversion :as qc])


;REMINDER


;seconds minutes hours day-of-month month weekday
(def cronSchedule0 "0 0 * ? 7 *")
(def reminderMessage0 "Test123!")

;TODO configure With DB

(defjob NoOpJob0
  [ctx]
  ;(prn (second (first (qc/from-job-data ctx))))
  (prn "sending mail to people")
  (sql/with-connection (db-connection)
    (sql/with-query-results results
        ["SELECT COUNT(*) as count FROM USERS"]
		(def counterVal (get (nth results 0) :count)
    )
    (sql/with-query-results results
        ["SELECT email FROM USERS"]
		(def users results)
		(prn users)
    )
    (loop [x 0]
      (when (< x counterVal)
        (send-mail (second (second (qc/from-job-data ctx))) (get (nth users x) :email) (second (first (qc/from-job-data ctx))))
        (recur (+ x 1)
       )
       )
      )
    )
  ) 
  (prn "mail sent")
)

(defn initReminder
  [reminderMessage reminderSubject cronSchedule & m]
  (let [s      (-> (qs/initialize) qs/start)
       job     (jobs/build
               (jobs/of-type NoOpJob0)
		    (jobs/using-job-data {"message" reminderMessage "subject" reminderSubject}))
       trigger (t/build
                  (t/with-identity (t/key (str reminderMessage cronSchedule)))
                  (t/start-now)
                  (t/with-schedule (schedule
                                     (cron-schedule cronSchedule))))]
(qs/schedule s job trigger))
(prn "reminder initialized"))

(defn deleteReminder
  [reminderMessage & m]
  (let [s  (-> (qs/initialize) qs/start)
        tk (t/key reminderMessage)]
    ;; deletes a single trigger
    (qs/delete-trigger s tk))
(prn "reminder removed"))

(defn initRemindersAfterReboot []
  (sql/with-connection (db-connection)
	(sql/with-query-results results
	["select count(*) as exist FROM REMINDERS"]
        (def count (get (first results) :exist))
	)
     (sql/with-query-results results
      ["SELECT * FROM REMINDERS"]
       (loop [x 0]
         (when (< x count)
		(let [currentEntry(nth results x)]
		(initReminder (get currentEntry :message) (get currentEntry :subject) (get currentEntry :crontime))
		)
           (recur (+ x 1)
           )
         )
       )
     )
  )
 
)
(prn "loading reminders From db")
(initRemindersAfterReboot)
(prn "finished loading reminders From db")
;(initReminder reminderMessage0 cronSchedule0)

