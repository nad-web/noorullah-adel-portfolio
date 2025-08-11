

# 🚨 PIR Movement Alarm

**Level:** Advanced  
**Languages:** MakeCode, Python  
**Hardware:** LED display, Pins, Radio  
**Topics:** Communication, Electricity, Electronics, Input/output, Product design, Radio waves, Sensors

---

## 🧠 How It Works

PIR (Passive Infrared) sensors are commonly used in burglar alarms and office lighting systems to detect movement. You can connect one to a micro:bit’s pins to trigger an alarm when movement is detected.

### 🔌 Wiring Instructions

- Connect the sensor’s **VCC** or **+3V** to the micro:bit’s **3V** pin  
- Connect the sensor’s **GND** to the micro:bit’s **GND**  
- Connect the sensor’s **Signal (S)** output to **Pin 0** on the micro:bit

### 📡 Communication Logic

- The **sensor micro:bit** sends a radio message every second:
  - `'movement'` if movement is detected
  - `'still'` if no movement is detected
- The **alarm micro:bit**:
  - Displays a stick figure on its LED display
  - Sounds an audible alarm when movement is detected

> You may need to adjust the sensor’s sensitivity and timing using a small screwdriver. Refer to your sensor’s documentation for details.

---

## 🧰 What You Need

- 2 micro:bits and battery packs  
- 1 PIR sensor (3V compatible)  
- 3 suitable leads to connect the sensor to the micro:bit  
- Small screwdriver (for sensor adjustment)  
- Optional: headphones, buzzer, or speaker + crocodile clips for sound output

---

## 💻 Step 2: Code It

> CodeBlocks

Sensor / transmitter:

<img width="822" height="482" alt="image" src="https://github.com/user-attachments/assets/5635e67c-397c-4036-90f5-50df915c3156" />


Alarm / receiver:

<img width="592" height="396" alt="image" src="https://github.com/user-attachments/assets/116a59b9-48fa-4307-907f-19c3801a2fca" />

---

## 🚀 Step 3: Improve It

- 💡 **Energy Efficiency**: Modify the sensor micro:bit to send messages **only when movement is detected**, reducing battery usage. Update the alarm code accordingly.
- 🏠 **Multi-Room Monitoring**: Add more sensor micro:bits in different rooms. Use unique radio messages like `'kitchen movement'`.
- 🔗 **Sensor Network**: Combine with other sensor projects (e.g., Light Alarm, Pressure Switch Alarm) to build a networked alarm system.

---
