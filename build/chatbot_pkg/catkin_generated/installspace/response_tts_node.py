#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
from gtts import gTTS
import pygame
import requests
from datetime import datetime
import xmltodict
from openai import OpenAI

# OpenAI 클라이언트를 초기화합니다.
client = OpenAI(
    api_key="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"
)

# 대화 히스토리를 초기화합니다.
messages = [
    {"role": "system", "content": "You are a kind helpful assistant."}
]


def get_current_date_string():
    base_date = datetime.now().date()
    # print(base_date.strftime("%Y%m%d"))
    return base_date.strftime("%Y%m%d")

def get_current_hour_string():
    now = datetime.now()
    if now.minute<45: # base_time와 base_date 구하는 함수
        if now.hour==0:
            base_time = "2330"
        else:
            pre_hour = now.hour-1
            if pre_hour<10:
                base_time = "0" + str(pre_hour) + "30"
            else:
                base_time = str(pre_hour) + "30"
    else:
        if now.hour < 10:
            base_time = "0" + str(now.hour) + "30"
        else:
            base_time = str(now.hour) + "30"
    return base_time

keys = '7Qe+dnc4b8nHkj+xnSfgfQjMEZsQvunkn1Kf21Af0z8zjaPh3OfxKMvicAvqr7IH6419H1lytH8ZwQitpeoAZA=='
url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst'
params ={'ServiceKey' : keys, 
         'pageNo' : '1', 
         'numOfRows' : '1000', 
         'dataType' : 'XML', 
         'base_date' : get_current_date_string(), 
         'base_time' : get_current_hour_string(), 
         'nx' : 60, 
         'ny' : 127 }

def forecast():
    # 값 요청 (웹 브라우저 서버에서 요청 - url주소와 파라미터)
    res = requests.get(url, params = params)

    #XML -> 딕셔너리
    xml_data = res.text
    dict_data = xmltodict.parse(xml_data)

    #값 가져오기
    weather_data = dict()
    for item in dict_data['response']['body']['items']['item']:
        # 기온
        if item['category'] == 'T1H' and item['fcstTime'] == str(int(get_current_hour_string()) + 70):
            weather_data['tmp'] = item['fcstValue']
        # 습도
        if item['category'] == 'REH' and item['fcstTime'] == str(int(get_current_hour_string()) + 70):
            weather_data['hum'] = item['fcstValue']
        # 하늘상태: 맑음(1) 구름많은(3) 흐림(4)
        if item['category'] == 'SKY' and item['fcstTime'] == str(int(get_current_hour_string()) + 70):
            weather_data['sky'] = item['fcstValue']
        # 강수형태: 없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7)
        if item['category'] == 'PTY' and item['fcstTime'] == str(int(get_current_hour_string()) + 70):
            weather_data['sky2'] = item['fcstValue']

    return weather_data

def proc_weather():
    dict_sky = forecast()

    str_sky = "현재 서울의 "
    if dict_sky['sky'] != None or dict_sky['sky2'] != None:
        str_sky = str_sky + "날씨는 "
        if dict_sky['sky2'] == '0':
            if dict_sky['sky'] == '1':
                str_sky = str_sky + "맑습니다"
            elif dict_sky['sky'] == '3':
                str_sky = str_sky + "구름이 많습니다"
            elif dict_sky['sky'] == '4':
                str_sky = str_sky + "흐립니다"
        elif dict_sky['sky2'] == '1':
            str_sky = str_sky + "비가 내립니다"
        elif dict_sky['sky2'] == '2':
            str_sky = str_sky + "비와 눈이 내립니다"
        elif dict_sky['sky2'] == '3':
            str_sky = str_sky + "눈이 내립니다"
        elif dict_sky['sky2'] == '5':
            str_sky = str_sky + "빗방울이 떨어집니다"
        elif dict_sky['sky2'] == '6':
            str_sky = str_sky + "빗방울과 눈이 날립니다"
        elif dict_sky['sky2'] == '7':
            str_sky = str_sky + "눈이 날립니다"
        str_sky = str_sky + " "
    if dict_sky['tmp'] != None:
        str_sky = str_sky + "온도는 " + dict_sky['tmp'] + 'ºC이고, '
    if dict_sky['hum'] != None:
        str_sky = str_sky + "습도는 " + dict_sky['hum'] + '%입니다'

    return str_sky

# OpenAI API를 사용하여 질문에 대한 답변을 생성하는 함수입니다.
def ask_question_v2(question):
    messages.append({"role": "user", "content": f"{question}"})
    completion = client.chat.completions.create(model="gpt-3.5-turbo", messages=messages)
    assistant_content = completion.choices[0].message.content.strip()
    messages.append({"role": "assistant", "content": f"{assistant_content}"})
    return assistant_content

current_weather = proc_weather()

def response_callback(msg):
    response_text = ""

    if msg.data == "weather":
        #  실시간 날씨 정보 처리
        response_text = current_weather
    elif msg.data == "start":
        response_text = "네 무엇을 도와드릴까요"
    elif msg.data == "exit":
        response_text = "종료합니다"
    elif msg.data == "stop":
        response_text = "정지"
    elif msg.data == "livingroom":
        response_text = "거실로 이동하겠습니다"
    elif msg.data == "bathroom":
        response_text = "화장실로 이동하겠습니다"
    elif msg.data == "dressroom":
        response_text = "안방으로 이동하겠습니다"
    elif msg.data == "startpoint":
        response_text = "현관으로 이동하겠습니다"

    else:
        response_text = ask_question_v2(msg.data)
    # 음성으로 응답 재생
    if response_text:
        rospy.loginfo(f"응답: {response_text}")
        tts = gTTS(response_text, lang='ko')
        tts.save('answer.mp3')
        pygame.mixer.init()
        pygame.mixer.music.load('answer.mp3')
        pygame.mixer.music.play()
        while pygame.mixer.music.get_busy():
            rospy.sleep(1)  # 재생이 끝날 때까지 대기

def response_tts_node():
    rospy.init_node('response_tts_node', anonymous=True)
    rospy.Subscriber('user_request', String, response_callback)
    rospy.spin()

if __name__ == '__main__':
    try:
        response_tts_node()
    except rospy.ROSInterruptException:
        pass
