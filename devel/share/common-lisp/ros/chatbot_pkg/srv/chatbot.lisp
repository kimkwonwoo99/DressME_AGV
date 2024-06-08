; Auto-generated. Do not edit!


(cl:in-package chatbot_pkg-srv)


;//! \htmlinclude chatbot-request.msg.html

(cl:defclass <chatbot-request> (roslisp-msg-protocol:ros-message)
  ((question
    :reader question
    :initarg :question
    :type cl:string
    :initform "")
   (answer
    :reader answer
    :initarg :answer
    :type cl:string
    :initform ""))
)

(cl:defclass chatbot-request (<chatbot-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <chatbot-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'chatbot-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name chatbot_pkg-srv:<chatbot-request> is deprecated: use chatbot_pkg-srv:chatbot-request instead.")))

(cl:ensure-generic-function 'question-val :lambda-list '(m))
(cl:defmethod question-val ((m <chatbot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chatbot_pkg-srv:question-val is deprecated.  Use chatbot_pkg-srv:question instead.")
  (question m))

(cl:ensure-generic-function 'answer-val :lambda-list '(m))
(cl:defmethod answer-val ((m <chatbot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chatbot_pkg-srv:answer-val is deprecated.  Use chatbot_pkg-srv:answer instead.")
  (answer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <chatbot-request>) ostream)
  "Serializes a message object of type '<chatbot-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'question))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'question))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'answer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'answer))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <chatbot-request>) istream)
  "Deserializes a message object of type '<chatbot-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'question) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'question) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'answer) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'answer) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<chatbot-request>)))
  "Returns string type for a service object of type '<chatbot-request>"
  "chatbot_pkg/chatbotRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'chatbot-request)))
  "Returns string type for a service object of type 'chatbot-request"
  "chatbot_pkg/chatbotRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<chatbot-request>)))
  "Returns md5sum for a message object of type '<chatbot-request>"
  "a27d8629aeefd2b315942fe4a74ab143")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'chatbot-request)))
  "Returns md5sum for a message object of type 'chatbot-request"
  "a27d8629aeefd2b315942fe4a74ab143")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<chatbot-request>)))
  "Returns full string definition for message of type '<chatbot-request>"
  (cl:format cl:nil "string question~%string answer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'chatbot-request)))
  "Returns full string definition for message of type 'chatbot-request"
  (cl:format cl:nil "string question~%string answer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <chatbot-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'question))
     4 (cl:length (cl:slot-value msg 'answer))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <chatbot-request>))
  "Converts a ROS message object to a list"
  (cl:list 'chatbot-request
    (cl:cons ':question (question msg))
    (cl:cons ':answer (answer msg))
))
;//! \htmlinclude chatbot-response.msg.html

(cl:defclass <chatbot-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass chatbot-response (<chatbot-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <chatbot-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'chatbot-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name chatbot_pkg-srv:<chatbot-response> is deprecated: use chatbot_pkg-srv:chatbot-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <chatbot-response>) ostream)
  "Serializes a message object of type '<chatbot-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <chatbot-response>) istream)
  "Deserializes a message object of type '<chatbot-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<chatbot-response>)))
  "Returns string type for a service object of type '<chatbot-response>"
  "chatbot_pkg/chatbotResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'chatbot-response)))
  "Returns string type for a service object of type 'chatbot-response"
  "chatbot_pkg/chatbotResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<chatbot-response>)))
  "Returns md5sum for a message object of type '<chatbot-response>"
  "a27d8629aeefd2b315942fe4a74ab143")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'chatbot-response)))
  "Returns md5sum for a message object of type 'chatbot-response"
  "a27d8629aeefd2b315942fe4a74ab143")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<chatbot-response>)))
  "Returns full string definition for message of type '<chatbot-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'chatbot-response)))
  "Returns full string definition for message of type 'chatbot-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <chatbot-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <chatbot-response>))
  "Converts a ROS message object to a list"
  (cl:list 'chatbot-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'chatbot)))
  'chatbot-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'chatbot)))
  'chatbot-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'chatbot)))
  "Returns string type for a service object of type '<chatbot>"
  "chatbot_pkg/chatbot")