# aaPanel-nginx-fix

## Overview
This program is designed to quick fix some bugs on Nginx with aaPanel (not working or not starting on reboot). This enables systemcl status | start | stop | reload commands too.

## Prerequisites
Ensure that you have aaPanel installed and have using only the aaPanel nginx version. Please try to upgrade your system before using this script.

1. Update the system:
   ```bash
   sudo apt-get update
   sudo apt-get upgrade
   sudo reboot
   ```

2. Try to get Nginx version:
   ```bash
   nginx -v
   ```

3. Check Nginx status:
   ```bash
   sudo /etc/init.d/nginx status
   sudo systemctl status nginx
   ```

If nginx.service shows "Active: inactive (dead)" or you have some errors, you should use the following script.

## Installation
1. Download the script:
   ```bash
   wget https://raw.githubusercontent.com/broogly/aaPanel-nginx-fix/main/aaPanel-nginx-fix.sh
   ```

2. Set execute permission:
   ```bash
   sudo chmod +x aaPanel-nginx-fix.sh
   ```

## Usage
Execute the script with this simple command:
   ```bash
   sudo ./aaPanel-nginx-fix.sh
   ```

Try again theese tree commands to compare outputs:
   ```bash
   nginx -v
   sudo /etc/init.d/nginx status
   sudo systemctl status nginx
   ```

Check Nginx status:
   ```bash
   sudo systemctl status nginx
   ```

You can now start nginx with systemctl (already started by script):
   ```bash
   sudo systemctl start nginx
   ```

To stop nginx with systemctl:
   ```bash
   sudo systemctl stop nginx
   ```

To reload nginx with systemctl:
   ```bash
   sudo systemctl reload nginx
   ```

To enable nginx on boot with systemctl (already enabled by script):
   ```bash
   sudo systemctl enable nginx
   ```

To disable nginx on boot with systemctl:
   ```bash
   sudo systemctl disable nginx
   ```

I hope this script helped you fix your Nginx installation!

# Licencing

### MIT License

Copyright (c) 2024 Broogly

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

# Support the Developer

If you find this script helpful and it saves you time or effort, consider supporting the development by buying me a coffee. Your contribution helps in keeping this project active and improving.

[![Buy Me a Coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg)](https://www.buymeacoffee.com/broogly)

Scan the QR code to buy me a coffee:

<img src="https://github.com/broogly/aaPanel-nginx-fix/raw/main/bmc_qr.png" alt="Buy Me a Coffee QR Code" width="260">

Your support is greatly appreciated! Thank you for helping to fuel more useful tools and projects.
