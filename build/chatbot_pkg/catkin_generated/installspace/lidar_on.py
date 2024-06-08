#!/usr/bin/env python3

import rospy
import RPi.GPIO as GPIO
import time

def main():
    # GPIO setup
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(20, GPIO.OUT)

    rospy.init_node('gpio_blinker', anonymous=True)
    rospy.on_shutdown(GPIO.cleanup)

    try:
        while not rospy.is_shutdown():
            GPIO.output(20, GPIO.HIGH)
            time.sleep(0.05)
    except KeyboardInterrupt:
        GPIO.cleanup()

if __name__ == '__main__':
    main()