# Wi-Fi Jammer Tool

## Overview

Welcome to the Wi-Fi Jammer Tool! This powerful bash script simplifies the process of flashing the ESP8266 Deauther firmware, scanning for Wi-Fi networks, and performing deauthentication attacks. Perfect for educational and testing purposes, it supports both Debian-based and Arch-based Linux distributions.

## Features

- **Install Dependencies:** Automatically installs required tools and libraries.
- **Flash ESP8266:** Downloads and flashes the latest ESP8266 Deauther firmware.
- **Scan for Wi-Fi Networks:** Scans for nearby Wi-Fi networks and saves results.
- **Compare Scans:** Compares current and previous Wi-Fi network scans.
- **Start Deauth Attack:** Sends deauthentication packets to selected Wi-Fi networks.
- **Set Up Monitor Mode:** Configures the wireless interface for monitor mode.

## Prerequisites

- **Linux:** Debian-based (e.g., Ubuntu) or Arch-based (e.g., Manjaro)
- **Tools:** `wget`, `esptool`, `aircrack-ng`, `wireless-tools`

## Installation

Clone the Repository:

```bash
git clone [https://github.com/yourusername/wifi_jammer_tool.git](https://github.com/thebugbounter/WiFi-Deauthenticator/)
cd wifi_jammer_tool
```

Make the Script Executable:

```bash
chmod +x wifi_jammer.sh
```

## Usage

Run the Script:

```bash
sudo ./wifi_jammer.sh
```

Choose an Option:

1. Install Dependencies
2. Flash ESP8266 Deauther
3. Scan for Wi-Fi Networks
4. Compare Scans
5. Start Deauth Attack
6. Set Up Monitor Mode

### Flash ESP8266

The script will automatically download the latest firmware from ESP8266 Deauther and flash it to your ESP8266 device. Ensure the ESP8266 is connected and the correct serial port is specified.

### Scan for Wi-Fi Networks

Enter the wireless interface name when prompted. The script will scan for Wi-Fi networks and save the results to `scan_output.csv`.

### Compare Scans

Compares the current scan results with the previous scan and saves differences to `scan_diff.txt`. The previous scan is stored as `prev_scan.csv`.

### Start Deauth Attack

Sends deauthentication packets to the top 5 Wi-Fi networks found in the latest scan.

### Set Up Monitor Mode

Configures the specified

# 🌐 Wi-Fi Jammer Tool 🚀

## Overview

Welcome to the Wi-Fi Jammer Tool! This powerful bash script simplifies the process of flashing the ESP8266 Deauther firmware, scanning for Wi-Fi networks, and performing deauthentication attacks. Perfect for educational and testing purposes, it supports both Debian-based and Arch-based Linux distributions.

## ✨ Features

- **🛠️ Install Dependencies:** Automatically installs required tools and libraries.
- **💾 Flash ESP8266:** Downloads and flashes the latest ESP8266 Deauther firmware.
- **📡 Scan for Wi-Fi Networks:** Scans for nearby Wi-Fi networks and saves results.
- **🔍 Compare Scans:** Compares current and previous Wi-Fi network scans.
- **💥 Start Deauth Attack:** Sends deauthentication packets to selected Wi-Fi networks.
- **🔧 Set Up Monitor Mode:** Configures the wireless interface for monitor mode.

## 📋 Prerequisites

- **💻 Linux:** Debian-based (e.g., Ubuntu) or Arch-based (e.g., Manjaro)
- **🔧 Tools:** `wget`, `esptool`, `aircrack-ng`, `wireless-tools`

## 🚀 Installation

Clone the Repository:

```bash
git clone https://github.com/yourusername/wifi_jammer_tool.git
cd wifi_jammer_tool
```

Make the Script Executable:

```bash
chmod +x wifi_jammer.sh
```

## 📝 Usage

Run the Script:

```bash
sudo ./wifi_jammer.sh
```

Choose an Option:

1. 🛠️ Install Dependencies
2. 💾 Flash ESP8266 Deauther
3. 📡 Scan for Wi-Fi Networks
4. 🔍 Compare Scans
5. 💥 Start Deauth Attack
6. 🔧 Set Up Monitor Mode

### 💾 Flash ESP8266

The script will automatically download the latest firmware from ESP8266 Deauther and flash it to your ESP8266 device. Ensure the ESP8266 is connected and the correct serial port is specified.

### 📡 Scan for Wi-Fi Networks

Enter the wireless interface name when prompted. The script will scan for Wi-Fi networks and save the results to `scan_output.csv`.

### 🔍 Compare Scans

Compares the current scan results with the previous scan and saves differences to `scan_diff.txt`. The previous scan is stored as `prev_scan.csv`.

### 💥 Start Deauth Attack

Sends deauthentication packets to the top 5 Wi-Fi networks found in the latest scan.

### 🔧 Set Up Monitor Mode

Configures the specified wireless interface for monitor mode using `airmon-ng`.

## ⚠️ Notes

- Ensure that `esptool` and `aircrack-ng` are installed and accessible in your system.
- Use this tool responsibly and legally. Unauthorized network interference is illegal and unethical.

## 📦 Pre-built Deauther by Deauther.com

1. Get a .bin file for your board from [deauther.com](https://deauther.com).
2. Open [esp.huhn.me](https://esp.huhn.me) in Chrome, or another supported browser.
3. Connect your ESP8266 board via USB.
4. Click **Connect** and select the serial port of your ESP.
5. Select your Deauther .bin file.
6. Click **Program**.

### Wi-Fi Password

- **Name:** pwned 
- **Password:** deauther
- **IP:** 192.168.4.1

## 🤝 Contributing

For issues or improvements, please submit a pull request or open an issue on the GitHub repository.

## 📜 License

This project is licensed under the MIT License. See the LICENSE file for details.

Happy Hacking! 😃🔓
