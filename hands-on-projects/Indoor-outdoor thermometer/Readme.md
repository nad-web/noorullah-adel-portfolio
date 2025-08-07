# Indoor-outdoor Thermometer

**Level**: Intermediate  
**Platforms**: MakeCode, Python  
**Components**: Buttons, LED display, Radio, Temperature sensor  
**Concepts**: Communication, Input/output, Radio waves, Temperature, Variables

[python][1]
---

## Step 1: Make it

### What is it?
Use two micro:bits so you can monitor outdoor temperatures remotely.

### How it works
This project uses two different programs, one for the outdoor micro:bit which senses the temperature and transmits it on radio group 23.

- The outdoor micro:bit uses its temperature sensor to measure how hot or cold it is.
- It uses radio to send this temperature reading to the indoor micro:bit.
- When the indoor micro:bit receives a temperature reading from outside, it stores it in a variable called `outdoorTemp`.
- When you press input button A on the indoor micro:bit, it shows its own current temperature reading on its LED display output.
- When you press button B, it shows the temperature reading from outside that it has stored in the `outdoorTemp` variable.

### What you need
- Two micro:bits  
- MakeCode or Python editor  
- Battery pack  
- A waterproof container, such as a plastic box

---

## Step 2: Code it

### Outdoor sensor and transmitter
*(Code Block)*
<img width="756" height="200" alt="image" src="https://github.com/user-attachments/assets/7e8123ba-7ff0-4362-908f-627152918eff" />


### Indoor sensor and receiver
*(Code Block)*
<img width="815" height="313" alt="image" src="https://github.com/user-attachments/assets/7cf8d0c1-c5d3-4aa4-aede-06f427213353" />

---

## Step 3: Improve it

- Make the batteries last longer by having the outdoor micro:bit turn its radio off when it’s not in use and sending temperature readings less often.
- Use variables to track the highest and lowest temperatures recorded.
- Calibrate the readings against another thermometer to see if you need to adjust the micro:bit’s temperature.

[1] 
