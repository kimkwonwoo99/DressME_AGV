;; Auto-generated. Do not edit!


(when (boundp 'video_pkg::CompressedImage)
  (if (not (find-package "VIDEO_PKG"))
    (make-package "VIDEO_PKG"))
  (shadow 'CompressedImage (find-package "VIDEO_PKG")))
(unless (find-package "VIDEO_PKG::COMPRESSEDIMAGE")
  (make-package "VIDEO_PKG::COMPRESSEDIMAGE"))

(in-package "ROS")
;;//! \htmlinclude CompressedImage.msg.html


(defclass video_pkg::CompressedImage
  :super ros::object
  :slots (_data _width _height _format ))

(defmethod video_pkg::CompressedImage
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0 :element-type :char))
    ((:width __width) 0)
    ((:height __height) 0)
    ((:format __format) "")
    )
   (send-super :init)
   (setq _data __data)
   (setq _width (round __width))
   (setq _height (round __height))
   (setq _format (string __format))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:format
   (&optional __format)
   (if __format (setq _format __format)) _format)
  (:serialization-length
   ()
   (+
    ;; uint8[] _data
    (* 1    (length _data)) 4
    ;; uint32 _width
    4
    ;; uint32 _height
    4
    ;; string _format
    4 (length _format)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8[] _data
     (write-long (length _data) s)
     (princ _data s)
     ;; uint32 _width
       (write-long _width s)
     ;; uint32 _height
       (write-long _height s)
     ;; string _format
       (write-long (length _format) s) (princ _format s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8[] _data
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _data (make-array n :element-type :char))
     (replace _data buf :start2 ptr-) (incf ptr- n))
   ;; uint32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _format
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _format (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get video_pkg::CompressedImage :md5sum-) "30dde7683502af43aca6cf366dc86787")
(setf (get video_pkg::CompressedImage :datatype-) "video_pkg/CompressedImage")
(setf (get video_pkg::CompressedImage :definition-)
      "uint8[] data
uint32 width
uint32 height
string format
")



(provide :video_pkg/CompressedImage "30dde7683502af43aca6cf366dc86787")


