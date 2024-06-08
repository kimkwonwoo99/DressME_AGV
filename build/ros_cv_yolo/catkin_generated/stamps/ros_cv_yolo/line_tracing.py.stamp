import rospy
from sensor_msgs.msg import CompressedImage
from geometry_msgs.msg import Twist
import cv2
import numpy as np
import time
import threading

# 전역 변수 선언
current_direction = 'STOP'  # 초기 방향을 STOP으로 설정
cmd_vel_pub = None  # cmd_vel 메시지 발행을 위한 Publisher

def control_agv():
    global current_direction, cmd_vel_pub
    rate = rospy.Rate(10)  # 10Hz에서 메시지를 발행

    while not rospy.is_shutdown():
        twist = Twist()
        if current_direction == "LEFT":
            twist.angular.z = 0.5  # 왼쪽으로 회전
            twist.linear.x = 0.5   # 앞으로 이동
        elif current_direction == "RIGHT":
            twist.angular.z = -0.5  # 오른쪽으로 회전
            twist.linear.x = 0.5    # 앞으로 이동
        elif current_direction == "FORWARD":
            twist.linear.x = 1.0    # 앞으로 이동
        elif current_direction == "RETREAT":
            twist.linear.x = -0.5   # 뒤로 이동
        elif current_direction == "STOP":
            twist.linear.x = 0      # 정지
            twist.angular.z = 0

        cmd_vel_pub.publish(twist)
        rate.sleep()

def image_callback(ros_image):
    global current_direction

    try:
        np_arr = np.fromstring(ros_image.data, np.uint8)
        image_np = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
    except Exception as e:
        rospy.logerr("Could not decode image: %s", e)
        return

    height, width, _ = image_np.shape
    yellow_roi_height = int(height / 4)
    yellow_roi_top = height - yellow_roi_height
    yellow_roi = image_np[yellow_roi_top:, :]
    
    cv2.line(yellow_roi, (width // 2, 0), (width // 2, yellow_roi_height), (255, 0, 0), 2)
    
    lower_yellow = np.array([20, 100, 100], dtype=np.uint8)
    upper_yellow = np.array([30, 255, 255], dtype=np.uint8)
    yellow_mask = cv2.inRange(cv2.cvtColor(yellow_roi, cv2.COLOR_BGR2HSV), lower_yellow, upper_yellow)
    
    cv2.imshow("yellow_mask", yellow_mask)
    cv2.waitKey(1)

    contours_yellow, _ = cv2.findContours(yellow_mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    
    if len(contours_yellow) >= 1:
        max_contour = max(contours_yellow, key=cv2.contourArea)
        cv2.drawContours(yellow_roi, [max_contour], -1, (0, 255, 0), 2)
        
        M = cv2.moments(max_contour)
        if M["m00"] != 0:
            cx = int(M["m10"] / M["m00"])
            center_line = width // 2
            if cx < center_line - 110:
                current_direction = "LEFT"
            elif cx > center_line + 110:
                current_direction = "RIGHT"
            else:
                current_direction = "FORWARD"
    else:
        current_direction = "RETREAT"

def main():
    global cmd_vel_pub
    rospy.init_node('image_subscriber', anonymous=True)
    image_topic = "camera/image/compressed"
    cmd_vel_topic = "cmd_vel"
    rospy.Subscriber(image_topic, CompressedImage, image_callback)
    cmd_vel_pub = rospy.Publisher(cmd_vel_topic, Twist, queue_size=10)

    # 스레드 시작
    control_thread = threading.Thread(target=control_agv)
    control_thread.start()

    rospy.spin()

if __name__ == '__main__':
    main()