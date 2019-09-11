#!/usr/bin/env hy3
(import json)
(import argparse)
(import [storage [Storage]])

(defmain [&rest _]
  (setv parser (argparse.ArgumentParser))
  (.add-argument parser "-blob" :type string :default None
    :help "The blob to work on")
  (.add-argument parser "-set" :type string :default None
    :help "Set data")
  (.add-argument parser "-get" :dest "get" :action "store_const"
    :const True :default False
    :help "Get data")
  (setv args (parser.parse-args))

  (setv storage (Storage args.blob))

  (unless args.blob (print "Created blob:" storage.blob))

  (when args.set (storage.set args.set))
  (when args.get (print (json.dumps (storage.get)))))
