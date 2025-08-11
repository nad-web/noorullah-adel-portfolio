# Indoor-outdoor Thermometer

**Intermediate** | MakeCode, Python  
**Buttons, LED display, Radio, Temperature sensor**  
**Communication, Input/output, Radio waves, Temperature, Variables**

## Step 1: Make it

### What is it?
Use two micro:bits so you can monitor outdoor temperatures remotely.

### How it works
This project uses two different programs, one for the outdoor micro:bit which senses the temperature and transmits it on radio group 23.

The outdoor micro:bit uses its temperature sensor to measure how hot or cold it is.  
It uses radio to send this temperature reading to the indoor micro:bit.  
When the indoor micro:bit receives a temperature reading from outside, it stores it in a variable called `outdoorTemp`.  
When you press input button A on the indoor micro:bit, it shows its own current temperature reading on its LED display output.  
When you press button B, it shows the temperature reading from outside that it has stored in the `outdoorTemp` variable.

### What you need
- Two micro:bits  
- MakeCode or Python editor  
- Battery pack  
- A waterproof container, such a plastic box

## Step 2: Code it

### Outdoor sensor and transmitter:
<img width="721" height="190" alt="image" src="https://github.com/user-attachments/assets/363885b5-056c-4bb0-90cd-cf4596f8165b" />



### Indoor sensor and receiver:

<img width="817" height="316" alt="image" src="https://github.com/user-attachments/assets/ead9560d-d779-4d67-b6bb-ac045937ad5b" />

## Step 3: Improve it

Make the batteries last longer by having the outdoor micro:bit turn its radio off when it’s not in use and sending temperature readings less often.  
Use variables to track the highest and lowest temperatures recorded.  
Calibrate the readings against another thermometer to see if you need to adjust the micro:bit’s temperature.

# Python Code 
```
Outdoor sensor and transmitter:

from microbit import *
import radio
radio.config(group=23)
radio.on()

while True:
    radio.send(str(temperature()))
    sleep(5000)


Indoor sensor and receiver:

from microbit import *
import radio
radio.config(group=23)
radio.on()
outdoorTemp = '-'

while True:
    message = radio.receive()
    if message:
        outdoorTemp = message
    if button_a.was_pressed():
        display.scroll(str(temperature()))
    if button_b.was_pressed():
        display.scroll(outdoorTemp)

        



