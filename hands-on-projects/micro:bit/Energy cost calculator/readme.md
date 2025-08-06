# 💡 Energy Cost Calculator

**Level:** Advanced  
**Languages:** MakeCode, Python  
**Hardware:** Buttons, LED display, Light sensor  
**Topics:** Climate, Boolean logic, Division, Input/output, Measurement, Money, Multiplication, Sensors, Variables

---

## 🛠️ Step 1: Make It

### What is it?

This is the third of three projects designed to help you gather data about your energy use. You'll learn how to calculate the cost of energy and build a timer that measures how much electric lights cost to run.

This project is part of a series focused on problem-solving and prototyping activities that explore technology as a solution to the challenges of the **Global Goals for Sustainable Development**.

### What you'll learn

- How to use mathematics to convert units: watts to kilowatts and minutes to hours  
- How to calculate energy used in kilowatt hours (kWh) from power measured in watts (W) and time  
- How variables can store values for user configuration

---

## ⚙️ How to Use It

This project builds on the previous **Energy Light Timer** project. Instead of measuring time, it calculates and displays the **cost** of energy used by a light bulb.

### You’ll need 3 numbers:

1. **Light reading** when the light is switched on (from the Energy Light Meter project)
2. **Wattage** of your lightbulb (printed on the bulb)
3. **Cost per kWh** of your electricity (ask an adult or check your energy provider)

These values are stored in variables:

- `LIGHT`
- `WATTS`
- `COSTPERKWH`

Flash the program onto a micro:bit and attach a battery pack. Place the micro:bit near a light source. It will use the light sensor and timer to monitor the cost of electricity used over time.

### Usage Tips
- Press **Button B** to take cost readings.
- Press the **reset button** to reset the timer.
- Check it’s reset by pressing **Button B** again.

💡 This measures one lightbulb — imagine the cost across a whole building over a year!

---

## 🧠 How It Works

- The micro:bit uses its light sensor to detect when a light is on.
- Energy used is calculated as:

  ```
