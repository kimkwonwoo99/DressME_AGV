;; Auto-generated. Do not edit!


(when (boundp 'chatbot_pkg::chatbot)
  (if (not (find-package "CHATBOT_PKG"))
    (make-package "CHATBOT_PKG"))
  (shadow 'chatbot (find-package "CHATBOT_PKG")))
(unless (find-package "CHATBOT_PKG::CHATBOT")
  (make-package "CHATBOT_PKG::CHATBOT"))
(unless (find-package "CHATBOT_PKG::CHATBOTREQUEST")
  (make-package "CHATBOT_PKG::CHATBOTREQUEST"))
(unless (find-package "CHATBOT_PKG::CHATBOTRESPONSE")
  (make-package "CHATBOT_PKG::CHATBOTRESPONSE"))

(in-package "ROS")





(defclass chatbot_pkg::chatbotRequest
  :super ros::object
  :slots (_question _answer ))

(defmethod chatbot_pkg::chatbotRequest
  (:init
   (&key
    ((:question __question) "")
    ((:answer __answer) "")
    )
   (send-super :init)
   (setq _question (string __question))
   (setq _answer (string __answer))
   self)
  (:question
   (&optional __question)
   (if __question (setq _question __question)) _question)
  (:answer
   (&optional __answer)
   (if __answer (setq _answer __answer)) _answer)
  (:serialization-length
   ()
   (+
    ;; string _question
    4 (length _question)
    ;; string _answer
    4 (length _answer)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _question
       (write-long (length _question) s) (princ _question s)
     ;; string _answer
       (write-long (length _answer) s) (princ _answer s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _question
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _question (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _answer
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _answer (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass chatbot_pkg::chatbotResponse
  :super ros::object
  :slots ())

(defmethod chatbot_pkg::chatbotResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass chatbot_pkg::chatbot
  :super ros::object
  :slots ())

(setf (get chatbot_pkg::chatbot :md5sum-) "a27d8629aeefd2b315942fe4a74ab143")
(setf (get chatbot_pkg::chatbot :datatype-) "chatbot_pkg/chatbot")
(setf (get chatbot_pkg::chatbot :request) chatbot_pkg::chatbotRequest)
(setf (get chatbot_pkg::chatbot :response) chatbot_pkg::chatbotResponse)

(defmethod chatbot_pkg::chatbotRequest
  (:response () (instance chatbot_pkg::chatbotResponse :init)))

(setf (get chatbot_pkg::chatbotRequest :md5sum-) "a27d8629aeefd2b315942fe4a74ab143")
(setf (get chatbot_pkg::chatbotRequest :datatype-) "chatbot_pkg/chatbotRequest")
(setf (get chatbot_pkg::chatbotRequest :definition-)
      "string question
string answer
---
")

(setf (get chatbot_pkg::chatbotResponse :md5sum-) "a27d8629aeefd2b315942fe4a74ab143")
(setf (get chatbot_pkg::chatbotResponse :datatype-) "chatbot_pkg/chatbotResponse")
(setf (get chatbot_pkg::chatbotResponse :definition-)
      "string question
string answer
---
")



(provide :chatbot_pkg/chatbot "a27d8629aeefd2b315942fe4a74ab143")


