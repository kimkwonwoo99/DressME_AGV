import rospy
from sensor_msgs.msg import CompressedImage
from geometry_msgs.msg import Twist, Vector3
import cv2
import numpy as np
from cv_bridge import CvBridge

def check_grad(arr1, arr2):
    # 가중치를 정의합니다.
    weights = np.array([1, 2, 3, 4, 5, 6])

    # 두 배열에 가중치를 적용한 값들을 계산합니다.
    weighted_sum1 = np.sum(weights * arr1)
    weighted_sum2 = np.sum(weights * arr2)

    # 두 가중합을 비교하여 움직임 제어 메시지를 발행합니다.
    if weighted_sum1 > weighted_sum2 * 1.2:
        cmd_vel_pub.publish(Twist(linear=Vector3(x=0.1), angular=Vector3(z=0.1)))  # 좌회전
    elif weighted_sum1 * 1.2 < weighted_sum2:
        cmd_vel_pub.publish(Twist(linear=Vector3(x=0.1), angular=Vector3(z=-0.1)))  # 우회전
    else:
        cmd_vel_pub.publish(Twist(linear=Vector3(x=0.1), angular=Vector3(z=0)))  # 직진

def find_yellow_center(roi):
    # 이미지를 HSV 색 공간으로 변환합니다.
    hsv = cv2.cvtColor(roi, cv2.COLOR_BGR2HSV)

    # 노란색의 HSV 범위를 정의합니다.
    lower_yellow = np.array([20, 100, 100])
    upper_yellow = np.array([30, 255, 255])
    
    # 노란색에 해당하는 부분을 이진화합니다.
    yellow_mask = cv2.inRange(hsv, lower_yellow, upper_yellow)
    result_array = np.zeros((1, 6), dtype=np.uint8)

    contours, _ = cv2.findContours(yellow_mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    if contours:
        # Find the yellow regions and mark them in the result arrays
        for contour in contours:
            x, y, w, h = cv2.boundingRect(contour)
            # Determine the column corresponding to the center of the region
            center_col = int((x + w // 2) / (roi.shape[1] // 6))
            result_array[0, center_col] = 1
    return result_array

def image_callback(ros_image):
    global bridge
    try:
        np_arr = np.fromstring(ros_image.data, np.uint8)
        image_np = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
    except Exception as e:
        print(e)
        return

    height, width, _ = image_np.shape
    roi_height = int(height / 6)
    roi1 = image_np[height - roi_height:height, :]
    roi2 = image_np[height - roi_height * 3:height - roi_height*2, :]

    arr1 = find_yellow_center(roi1)
    arr2 = find_yellow_center(roi2)

    check_grad(arr1, arr2)

    # OpenCV 창에 이미지 표시
    cv2.imshow("Image", roi1)
    cv2.imshow("Image2", roi2)
    cv2.imshow("Image3", image_np)
    cv2.waitKey(1)  # 키 입력을 기다림

def main():
    global cmd_vel_pub
    rospy.init_node('image_subscriber', anonymous=True)
    image_topic = "camera/image/compressed"
    cmd_vel_topic = "cmd_vel"
    rospy.Subscriber(image_topic, CompressedImage, image_callback)
    cmd_vel_pub = rospy.Publisher(cmd_vel_topic, Twist, queue_size=10)
    rospy.spin()

if __name__ == '__main__':
    bridge = CvBridge()
    main()
