/*
 * Project 2: Real-Time Signal Processing System - Task 1: Implementing the Moving-Average Filter
 * Board: Arduino Nano 33 BLE Rev2 (nRF52840 + BMI270) 
*/

#include <Arduino_BMI270_BMM150.h>

// Define the moving-average filter window size
const int WINDOW_SIZE = 10;

// Circular buffer array for the Z-axis
float zBuffer[WINDOW_SIZE];

// Function prototype
float updateMovingAverage(float newSample, float buffer[], int size);

void setup() {
  Serial.begin(9600);
  while (!Serial) {
    // Wait for the serial monitor to open
    delay(10);
  }

  // Initialize IMU sensor
  if (!IMU.begin()) {
    Serial.println("Failed to initialize IMU! Check hardware or wiring.");
    while (1) {
      // Halt execution if initialization fails
      delay(1000);
    }
  }

  Serial.println("Task 1: Moving-Average Filter Initialized");
  Serial.println("Raw_Z, Filtered_Z");
}
