(import json)
(import [urllib [request]])

(defclass Storage [object]
  [blob None]

  (with-decorator staticmethod
    (defn fetch [url &kwargs args]
      (setv r (request.Request url :headers {"Content-Type" "application/json"}
                                   #**args))
      (json.loads (.read (request.urlopen r)))))

  (defn --init-- [self &optional blob]
    (if blob
      (setv self.blob blob)
      (do
        (setv res (Storage.fetch "https://api.myjson.com/bins" :data (.encode "{}" "utf-8")))
        (setv self.blob (get res "uri")))))

  (defn get [self]
    (Storage.fetch self.blob))

  (defn set [self data]
    (Storage.fetch self.blob :data (.encode data "utf-8") :method "PUT")))
