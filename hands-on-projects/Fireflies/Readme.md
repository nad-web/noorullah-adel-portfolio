
# Fireflies

**Advanced** | MakeCode, Python  
**LED display, Radio**  
**Communication, Randomisation, Selection**

## Step 1: Make it

Turn a set of micro:bits into a magical glowing swarm of fireflies using radio communication.

### What you'll learn
- How to use radio communication between micro:bits to trigger events  
- That the micro:bit's LED display can be made brighter and dimmer  
- How to use random numbers and chance to mimic real-world behaviour

### What is it?
Fireflies are insects that use bioluminescence (light made in their bodies) to communicate with each other.

This project mimics the behaviour of real fireflies using the micro:bit's radio communication feature. The Python version was created by Nicholas H. Tollervey, and the MakeCode version is based on this.

Flash the program on at least three micro:bits in the same room. Press button A on any micro:bit and you should see a 'swarm' of micro:bits lighting up as they receive a radio message. It works best in a dark room with lots of micro:bits.

Once a micro:bit has received the radio message it has a one in ten chance of transmitting its own radio message and starting another wave of glowing lights in the other micro:bits.

When the lights eventually stop, press button A on any micro:bit to restart the 'swarm' of communication.

### How it works
The program uses radio communication to send a message `'flash'` when you press button A on one of the micro:bits.  
When each micro:bit receives the message, it waits a random amount of time between 50 and 350 milliseconds. It then makes the LED display flash bright then gradually dim to mimic the glow of a firefly.  
Next it generates a random number between 0 and 9. If the number is 0, it then sends its own `'flash'` radio message, triggering more micro:bit fireflies to glow. So it has a one in ten chance of triggering more glows in other micro:bits.  
You can use a mixture of old and new micro:bits, but they must all have either the MakeCode or Python versions of the program flashed on to them. (Radio communication works slightly differently in each programming language. MakeCode programs can't communicate over radio with Python ones and vice versa.)

### What you need
- At least 3 micro:bits, the more the better  
- Micro:bit battery packs (optional)

## Step 2: Code it
<img width="635" height="185" alt="image" src="https://github.com/user-attachments/assets/0b10558a-183b-4928-9f8e-19c80a327d5f" />
<img width="696" height="464" alt="image" src="https://github.com/user-attachments/assets/9acd7de6-ac1c-4f23-a941-7ca1e465dc16" />
<img width="374" height="696" alt="image" src="https://github.com/user-attachments/assets/8526359c-8538-4107-89b2-c56e8b8cc20b" />




## Step 3: Improve it

- Change the image that's displayed when the display flashes  
- Modify the code to make it more or less likely to trigger another flash event in other micro:bits. The range of random numbers could match the number of micro:bits you have: make it more likely if you have fewer micro:bits  
- Make smaller groups of fireflies using different radio group numbers. Only the micro:bits with the same group number will be able to communicate with each other  
- Experiment with changing the power of the radio signal  
  - Use the `radio set transmit power` block in MakeCode  
  - In Python use `radio.config(power=7)`  
  - Pick a number between 0 (weakest radio signal) and 7 (strongest)  
- What effect does changing the radio power have?
```
# A micro:bit Firefly.
# By Nicholas H.Tollervey. Released to the public domain.
import radio
import random
from microbit import display, Image, button_a, sleep

# Create the "flash" animation frames. Can you work out how it's done?
flash = [Image().invert()*(i/9) for i in range(9, -1, -1)]

# The radio won't work unless it's switched on.
radio.on()

# Event loop.
while True:
    # Button A sends a "flash" message.
    if button_a.was_pressed():
        radio.send('flash')  # a-ha
    # Read any incoming messages.
    incoming = radio.receive()
    if incoming == 'flash':
        # If there's an incoming "flash" message display
        # the firefly flash animation after a random short
        # pause.
        sleep(random.randint(50, 350))
        display.show(flash, delay=100, wait=False)
        # Randomly re-broadcast the flash message after a
        # slight delay.
        if random.randint(0, 9) == 0:
            sleep(500)
            radio.send('flash')  # a-ha
            


