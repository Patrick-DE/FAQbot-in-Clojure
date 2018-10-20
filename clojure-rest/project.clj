(defproject clojure-rest "0.1.0-SNAPSHOT"
  :description "REST based Chatbot for Moodle LTI"
  :url "http://cloud.eisenschmidt.family:46443"
  :min-lein-version "2.0.0"
  :dependencies [[org.clojure/clojure "1.8.0"]
                     [nginx-clojure "0.4.5"]
                     [compojure "1.1.1"]
                     [ring/ring-json "0.1.2"]
			     [c3p0/c3p0 "0.9.1.2"]
			    [org.clojure/java.jdbc "0.7.6" :test]
                     [org.clojure/java.jdbc "0.2.3"]
		     [org.clojure/data.json "0.2.6"]
		     [mysql/mysql-connector-java "5.1.18"]
		     [com.draines/postal "2.0.2"]
			[io.forward/clojure-mail "1.0.7"]
		     [clojurewerkz/quartzite "2.1.0"]]
  :plugins [[lein-ring "0.7.3"]]
  :repositories {"local" ~(str (.toURI (java.io.File. "maven_repository")))}
  :ring {:handler clojure-rest.handler/app}
  :main ^:skip-aot clojure-rest.core
  :target-path "target/%s" 
 :profiles
  {:dev {:dependencies [[javax.servlet/servlet-api "2.5"]
                        [ring/ring-mock "0.3.0"]]}}
)
