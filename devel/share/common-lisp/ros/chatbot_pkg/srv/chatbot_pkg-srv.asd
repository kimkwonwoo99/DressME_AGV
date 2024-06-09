
(cl:in-package :asdf)

(defsystem "chatbot_pkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "chatbot" :depends-on ("_package_chatbot"))
    (:file "_package_chatbot" :depends-on ("_package"))
  ))