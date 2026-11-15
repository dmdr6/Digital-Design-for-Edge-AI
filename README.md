# TinyML–EmbeddedAI

A personal learning and engineering repository focused on **Tiny Machine Learning (TinyML)** and **Embedded AI**.  
This project documents a structured progression from digital hardware fundamentals and microcontroller sensor interfacing to real-time signal processing and machine learning data pipelines for resource-constrained devices.

---

## 🔧 MCU Projects (Arduino Nano 33 BLE Rev2)

Target board: **Arduino Nano 33 BLE Rev2** (nRF52840 + BMI270 IMU).

### Project 1 – IMU Motion Data Logger
Hands-on sensor interfacing and data acquisition with the onboard BMI270 IMU.

| Task | Description |
|------|-------------|
| **Task 1** | Basic sensor interfacing – read accelerometer (g) and gyroscope (dps) and stream CSV-formatted data over Serial |
| **Task 2** | Timestamping and controlled sampling frequency |
| **Task 3** | Sampling frequency validation and verification |

### Project 2 – Real-Time Signal Processing System
| Task | Description |
|------|-------------|
| **Task 1** | Implementation of a moving average filter for real-time noise reduction on sensor data |

---

## 💻 SystemVerilog Progress

Digital design fundamentals written in **SystemVerilog**, with both design modules and corresponding testbenches.

### Logic Gates
Complete set of basic gates with design + testbench:
- AND, OR, NOT
- NAND, NOR
- XOR, XNOR

### Combinational Blocks
- Half Adder & Full Adder
- 2-to-1 and 4-to-1 Multiplexers
- 4-bit Ripple Carry Adder
- Hexadecimal to 7-Segment Decoder

### Sequential Logic
- Flip-Flop with asynchronous reset

---

## 🧠 TinyML Engineering Roadmap

### Machine Learning → 01 – Sensor Data Collector
Python-based foundation for TinyML data pipelines:

- **`01_Sensor_Calibration.py`**  
  Generates realistic simulated sensor data with gain, offset, and Gaussian noise for calibration experiments.

- **`02_Explore_Sensor_Data.py`**  
  Statistical analysis (correlation, mean, std) and visualization of sensor characterization curves and noise distribution.

These scripts form the first stage of a typical TinyML workflow: **data collection → exploration → calibration → model training**.

---

## 🎯 Goals of This Repository

- Build solid foundations in embedded systems and digital design
- Master sensor interfacing and real-time signal processing on microcontrollers
- Develop a practical pathway toward deploying machine learning models on resource-constrained devices (TinyML)
- Document learning progress in a structured, reproducible way

---

## 🛠️ Tools & Technologies

- **Hardware**: Arduino Nano 33 BLE Rev2 (BMI270 IMU)
- **Languages**: C/C++ (Arduino), SystemVerilog, Python
- **Libraries**: Arduino_BMI270_BMM150, NumPy, Matplotlib
- **Focus areas**: Sensor data acquisition, digital design, signal processing, TinyML data pipelines

---

## 📌 Status

This is an active learning repository. Content is being expanded progressively toward full end-to-end TinyML applications (data collection → training → quantization → on-device inference).

---

*Built as part of a long-term journey into Embedded AI and TinyML.*
