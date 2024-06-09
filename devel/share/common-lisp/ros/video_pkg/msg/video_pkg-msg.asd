
(cl:in-package :asdf)

(defsystem "video_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CompressedImage" :depends-on ("_package_CompressedImage"))
    (:file "_package_CompressedImage" :depends-on ("_package"))
  ))