# Sensor / transmitter:

from microbit import *
import radio
radio.config(group=5)
radio.on()

while True:
    if button_a.was_pressed():
        display.scroll(display.read_light_level())
    if display.read_light_level() > 50:
        radio.send('lights on')
    else:
        radio.send('lights off')
    sleep(10000)
  
# Alarm / receiver:

from microbit import *
import music
import radio
radio.config(group=5)
radio.on()

while True:
    message = radio.receive()
    if message:
        if message == 'lights off':
            display.clear()
        elif message == 'lights on':
            display.show(Image.ANGRY)
            music.play(music.BADDY)
