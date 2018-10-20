(def host "mx2f14.netcup.net")
(def emailadresse "efp@eisenschmidt.family")
(def username "efp@eisenschmidt.family")
(def emailpasswort "e.f.p2018")
(def tlsEnable true)
(def port 25)

(def subject "Chatbot answer")
(def address "<Chatbot>")
(def name "Chatbot")

;prepare a question to fit the stored procedure input
(defn prepareMessage [message]
  (let [triggers
    (clojure.string/lower-case
      (clojure.string/join ""
        ["''",(clojure.string/replace
		;(clojure.string/replace message #" (^[öÖäÄüÜßa-zA-Z0-9 ]*$)" "")
          (clojure.string/replace message #"[.|,|?|-|'|\"|!|\;|(|)|$|§|%|&|/|=|´|`|*|#|:|_|<|>]" "")
        #" " "'',''"),"''"]
      )
    )]
  triggers)
)

(defn send-mail [message to subject]
  (send-message
    {:host host
      :user emailadresse
      :pass emailpasswort
      :tls tlsEnable
      ;:port port
    }
    {:from emailadresse
      :to to
      :subject subject
      :sender {:address "<Chatbot>" :name "Chatbot"}
      :body [{:type "text/html; charset=utf-8"
             :content message}]
    }
  )
)

(defn answerMessage [message to uid]
  (sql/with-connection (db-connection)
    (sql/with-query-results results
      [(clojure.string/join "" ["CALL GetAnswer('",(prepareMessage message),"')"])]
      (cond
        (empty? results) {:status 404}
        :else (send-mail(get (first results) :answer) to "Chatbot Antwort")
      )
	(prn "test")
	(prn (get (first results) :answer))
	(prn uid)
	(let [aid (get (first results) :aid)]
         (sql/with-connection (db-connection)
            (sql/insert-record :AJAXCHAT (hash-map :uid uid :question message :aid aid))
         )
      )
    )
  )
)

(def manager
  (let [s (get-session "imaps")
      gstore (store "imaps" s host emailadresse emailpasswort)
      folder (open-folder gstore "inbox" :readonly)
      im (events/new-idle-manager s)]
    (events/add-message-count-listener
      (fn [e]
		(let [matnr 
			(first (clojure.string/split
				(second (clojure.string/split
					(second(first
						(nth(first
              						(->> e :messages
                						(map read-message)
                						(map  :headers)
              						)
						) 6) 
					))
				#"ount\s" 
				))
			#"@" 
			))]
			(def sendTo matnr)
			(let [uid 
				(sql/with-connection (db-connection)
        				(sql/with-query-results results
          					["select uid from USERS where hsid=?" matnr]
          					(def uid (get (first results) :uid))
        				)
      			)]
			
			)
		)
		(prn uid) 
	    (answerMessage
            ;(prn 
			(get
              (first 
;(first
                (->> e :messages
                  (map read-message)
                  (map  :body)
                )
              )
;)
            :body)
;)
	(clojure.string/join [sendTo "@stud.hs-mannheim.de"])
          uid)
        )
      #(prn "removed" %)
    folder
    im)
  im)

)


