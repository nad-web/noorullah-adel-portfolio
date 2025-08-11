

# 🔦 Light Alarm

**Level:** Advanced  
**Languages:** MakeCode, Python  
**Hardware:** LED display, Light sensor, Radio, Sound  
**Topics:** Communication, Energy, Iteration, Light, Relational operators, Selection, Sensors

---

## 🛠️ Step 1: Make It

### What is it?

<img width="853" height="495" alt="image" src="https://github.com/user-attachments/assets/9b9069df-4dae-45b4-b95f-d5acf8630700" />


A radio-controlled remote alarm that alerts you when someone turns on the lights — or opens a drawer or bag.

---

## 🧠 How It Works

This project uses the micro:bit’s LED display as a light sensor to measure ambient light.

- Every **10 seconds**, the **sensor micro:bit** sends a radio message:
  - `'lights on'` if light level is **greater than 50**
  - `'lights off'` if light level is **less than 50**

> You can adjust the threshold value depending on your environment.

- Press **Button A** to display the current light level on the LED display — useful for calibration.
- The **alarm micro:bit** reacts to incoming messages:
  - `'lights off'` → clears the LED display
  - `'lights on'` → shows an angry face and plays the **BADDY** alarm sound

> Ensure both micro:bits are set to the **same radio group** (0–255).

---

## 🧰 What You Need

- 2 micro:bits (at least one with a battery pack)  
- Something precious to protect  
- Optional: headphones, buzzers, or powered speakers for sound output

---

## 💻 Step 2: Code It

### Sensor / Transmitter

> codeblock

<img width="826" height="379" alt="image" src="https://github.com/user-attachments/assets/5a9abc4f-8beb-4b5d-bac6-f34f0c5c7454" />


### Alarm / Receiver

> codeblock

<img width="819" height="412" alt="image" src="https://github.com/user-attachments/assets/2a31a4af-7162-4837-ac28-dea30aa8cf0f" />


---

## 🚀 Step 3: Improve It

- Combine with the **Tilt Alarm** project to detect movement **or** light changes.
- Reverse the logic: trigger the alarm when **lights go off**.
- Monitor energy use:
  - Use a variable to track how long lights stay on.
  - Trigger an alarm if lights are on **too long**.

---
