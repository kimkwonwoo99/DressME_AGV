; Auto-generated. Do not edit!


(cl:in-package video_pkg-msg)


;//! \htmlinclude CompressedImage.msg.html

(cl:defclass <CompressedImage> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (width
    :reader width
    :initarg :width
    :type cl:integer
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:integer
    :initform 0)
   (format
    :reader format
    :initarg :format
    :type cl:string
    :initform ""))
)

(cl:defclass CompressedImage (<CompressedImage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CompressedImage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CompressedImage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name video_pkg-msg:<CompressedImage> is deprecated: use video_pkg-msg:CompressedImage instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <CompressedImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader video_pkg-msg:data-val is deprecated.  Use video_pkg-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <CompressedImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader video_pkg-msg:width-val is deprecated.  Use video_pkg-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <CompressedImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader video_pkg-msg:height-val is deprecated.  Use video_pkg-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'format-val :lambda-list '(m))
(cl:defmethod format-val ((m <CompressedImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader video_pkg-msg:format-val is deprecated.  Use video_pkg-msg:format instead.")
  (format m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CompressedImage>) ostream)
  "Serializes a message object of type '<CompressedImage>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'data))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'format))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'format))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CompressedImage>) istream)
  "Deserializes a message object of type '<CompressedImage>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'format) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'format) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CompressedImage>)))
  "Returns string type for a message object of type '<CompressedImage>"
  "video_pkg/CompressedImage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CompressedImage)))
  "Returns string type for a message object of type 'CompressedImage"
  "video_pkg/CompressedImage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CompressedImage>)))
  "Returns md5sum for a message object of type '<CompressedImage>"
  "30dde7683502af43aca6cf366dc86787")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CompressedImage)))
  "Returns md5sum for a message object of type 'CompressedImage"
  "30dde7683502af43aca6cf366dc86787")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CompressedImage>)))
  "Returns full string definition for message of type '<CompressedImage>"
  (cl:format cl:nil "uint8[] data~%uint32 width~%uint32 height~%string format~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CompressedImage)))
  "Returns full string definition for message of type 'CompressedImage"
  (cl:format cl:nil "uint8[] data~%uint32 width~%uint32 height~%string format~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CompressedImage>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4
     4
     4 (cl:length (cl:slot-value msg 'format))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CompressedImage>))
  "Converts a ROS message object to a list"
  (cl:list 'CompressedImage
    (cl:cons ':data (data msg))
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':format (format msg))
))
