

# Energy Light Meter

**Advanced** | MakeCode, Python  
**Buttons, LED display, Light sensor**  
**13 Climate, Input/output, Sensors, Variables**

## Step 1: Make it

### What is it?
The first of three projects to find out about energy use in your home or school by measuring how much light you use.

This light meter will help you measure how light levels vary around you when lights are turned on and off and find the best location to place the light timer in the next project.

### What you'll learn
- How to take readings from the micro:bit's sensors and store them in a variable so that you can repeatedly view the same reading even after conditions have changed  
- Find locations for recording reliable environmental data

### How to use it
With the lights turned off, place your micro:bit where you want to take the light reading, and press button A.  
Move the micro:bit so you can see its display easily, and press button B to see the light level reading. This will be a number between 0 (dark) and 255 (the most intense light the micro:bit can measure).  
You can press B again if you're not sure of the reading.  
Turn the lights on and make another measurement by pressing A again, then press button B to read the number.  
Find a place where there is a big difference between the readings when the lights are off and on. Away from a window where daylight might come in, and closer to the electric light source would be best. A cupboard would be ideal, if it has electric lighting.  
Take a few readings and find the average of the readings when the light is turned on. You'll need this number for the next project, the Energy light timer.

### How it works
The program uses a variable called `reading` to store the light level. It sets this at the start and whenever you press button A.  
Storing the light sensor reading in a variable, rather than just showing it straight away, is a good idea because it means you can view the reading over and over again when you note it down.  
Using a variable also means you can take a light reading in a place where it might be difficult to see the display and view the light measurement in a more convenient place.

### What you need
- micro:bit (or MakeCode simulator)  
- MakeCode or Python editor  
- Battery pack (recommended)

## Step 2: Code it

<img width="738" height="354" alt="image" src="https://github.com/user-attachments/assets/d96fc4cc-f1a5-4553-8c13-59448a353ece" />
<img width="246" height="277" alt="image" src="https://github.com/user-attachments/assets/20cb93cf-5377-4001-b5b4-28d94408bd16" />




## Step 3: Improve it

- Modify the code to calculate an average reading for you.  
- Add a second micro:bit and radio functionality to allow remote reading of light levels.  
- If you have access to a light meter that measures light levels in other units, compare the micro:bit's readings with it.  
- Use the light meter readings to make a timer to record how long lights are left on.

````
from microbit import *

display.show('M')
reading = display.read_light_level()
sleep(100)

while True:
    if button_a.was_pressed():
        # take a light measurement and store it
        reading = display.read_light_level()
        display.show(Image.DIAMOND_SMALL)
        sleep(400)
        display.show(Image.DIAMOND)
        sleep(400+500)
        display.show('M')

    elif button_b.was_pressed():
        # display the stored light measurement
        display.clear()
        display.scroll(reading)
        sleep(500)
        display.show('M')
