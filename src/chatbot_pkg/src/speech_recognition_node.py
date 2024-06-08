#!/usr/bin/env python

import rospy
import speech_recognition as sr
from std_msgs.msg import String

class SpeechRecognizer:
    def __init__(self):
        self.is_active = False  # 음성 인식 상태를 나타내는 플래그
        self.pub = rospy.Publisher('user_request', String, queue_size=10)
        self.r = sr.Recognizer()

    def start_recognition(self):
        with sr.Microphone() as source:
            print("말하세요...")
            audio = self.r.listen(source)

        try:
            text = self.r.recognize_google(audio, language='ko')
            rospy.loginfo(f"인식된 음성: {text}")
            return text
        except sr.UnknownValueError:https://stackoverflow.com/questions/43378060/meaning-of-the-github-message-push-declined-due-to-email-privacy-restrictions
            rospy.logwarn("음성을 인식할 수 없습니다.")
            return ""
        except sr.RequestError as e:
            rospy.logerr(f"음성 인식 서비스 요청 오류: {e}")
            return ""

    def process_input(self, user_input):
        if "뽀삐" in user_input:
            rospy.loginfo("뽀삐를 인식했습니다. 이제 모든 음성에 반응합니다.")
            self.is_active = True
            self.pub.publish("start")
        elif "날씨" in user_input and self.is_active:
            self.pub.publish("weather")
        elif "종료" in user_input:
            rospy.loginfo("인식 종료")
            self.is_active = False
            self.pub.publish("exit")
        elif "정지" in user_input:
            rospy.loginfo("정지")
            self.pub.publish("stop")
        elif "거실" in user_input:
            rospy.loginfo("거실로 이동합니다")
            self.pub.publish("livingroom")
        elif "화장실" in user_input:
            rospy.loginfo("화장실로 이동합니다")
            self.pub.publish("bathroom")
        elif "안방" in user_input:
            rospy.loginfo("안방으로 이동합니다")
            self.pub.publish("dressroom")
        elif "현관" in user_input:
            rospy.loginfo("현관으로 이동합니다")
            self.pub.publish("startpoint")
        elif not ("날씨" in user_input or "종료" in user_input) and self.is_active:
            self.pub.publish(user_input)

    def run(self):
        rospy.init_node('speech_recognition_node', anonymous=True)
        rate = rospy.Rate(10)  # 10Hz

        while not rospy.is_shutdown():
            user_input = self.start_recognition()

            if user_input:
                self.process_input(user_input)

            rate.sleep()

if __name__ == '__main__':
    try:
        recognizer = SpeechRecognizer()
        recognizer.run()
    except rospy.ROSInterruptException:
        pass
