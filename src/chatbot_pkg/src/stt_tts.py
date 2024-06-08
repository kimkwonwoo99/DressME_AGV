from openai import OpenAI  # OpenAI 라이브러리를 가져옵니다.
import pyaudio  # 오디오 관련 라이브러리입니다.
import speech_recognition as sr  # 음성 인식 라이브러리입니다.
from google.cloud import texttospeech  # Google Text-to-Speech 라이브러리입니다.
import time  # 시간과 관련된 라이브러리입니다.
from gtts import gTTS  # Google Text-to-Speech 라이브러리에서 gTTS 모듈을 가져옵니다.
import pygame
from weather_test import proc_weather

# OpenAI 클라이언트를 초기화합니다.
client = OpenAI(
    api_key="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"
)

# 대화 히스토리를 초기화합니다.
messages = [
    {"role": "system", "content": "You are a kind helpful assistant."}
]

current_weather = proc_weather()

# 사용자의 음성을 텍스트로 변환하는 함수입니다.
def speech_to_text():
    r = sr.Recognizer()
    with sr.Microphone() as source:
        print("말하세요")
        audio = r.listen(source)
    try:
        text = r.recognize_google(audio, language='ko')
        print(f"질문 내용 : {text}")
        return text
    except sr.UnknownValueError:
        print("인식할 수 없는 소리입니다")
        return ""
    except sr.RequestError as e:
        print(f"Could not request results from Google Speech Recognition service; {e}")
        return ""

# OpenAI API를 사용하여 질문에 대한 답변을 생성하는 함수입니다.
def ask_question_v2(question):
    messages.append({"role": "user", "content": f"{question}"})
    completion = client.chat.completions.create(model="gpt-3.5-turbo", messages=messages)
    assistant_content = completion.choices[0].message.content.strip()
    messages.append({"role": "assistant", "content": f"{assistant_content}"})
    return assistant_content

# Rate limiting parameters
MAX_REQUESTS_PER_LOOP = 5  # 루프 당 요청 횟수를 제한합니다.
requests_made = 0  # 현재 루프에서 처리된 요청 횟수를 추적합니다.

# 메인 루프입니다.
while True:
    # 요청 횟수가 제한에 도달하면 대기합니다.
    if requests_made >= MAX_REQUESTS_PER_LOOP:
        print("한 루프에서 최대 요청 횟수에 도달했습니다. 추가 요청을 대기합니다...")
        time.sleep(60)  # 1분 동안 대기합니다.
        requests_made = 0  # 요청 횟수를 다시 초기화합니다.
    
    # 사용자의 음성을 텍스트로 변환합니다.
    question = speech_to_text()
    print(question)
    
    # 사용자가 "종료"라고 말하면 음성 대화를 종료합니다.
    if "종료" in question:
        print("음성 대화를 종료합니다.")
        break

    if "날씨" in question:
        print(current_weather)
        tts_ko_w = gTTS(current_weather, lang='ko')
        tts_ko_w.save('weather.mp3')
        pygame.mixer.init()
        pygame.mixer.music.load('weather.mp3')
        pygame.mixer.music.play()
        while pygame.mixer.music.get_busy():
            pygame.time.Clock().tick(10)
        break
        
        
    # 사용자에게 입력을 받아 질문이 맞는지 확인합니다.
    check = input("물어보신 문장이 맞다면, 1을 입력해주세요")
    if check == "1":
        print("GPT에게 질문합니다.")
        # 질문에 대한 답변을 생성합니다.
        answer = ask_question_v2(question)
        print(answer)
        
        # 답변을 음성으로 변환하여 재생합니다.
        tts_ko = gTTS(answer, lang='ko')
        tts_ko.save('answer.mp3')
        pygame.mixer.init()
        pygame.mixer.music.load('answer.mp3')
        pygame.mixer.music.play()
        while pygame.mixer.music.get_busy():
            pygame.time.Clock().tick(10)
        
    else:
        print("다시 한 번 말씀해주세요.")
    
    # 요청 횟수를 증가시킵니다.
    requests_made += 1
