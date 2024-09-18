#!/bin/bash

# Create a symbolic link for NGINX
echo "Creating symbolic link for NGINX..."
sudo ln -sf /www/server/nginx/sbin/nginx /usr/local/bin/nginx

# Rename K01nginx_bak and S01nginx_bak files
for dir in /etc/rc*.d; do
  if [ -e "$dir/K01nginx_bak" ]; then
    sudo rm -f "$dir/K01nginx"
    sudo rename 's/K01nginx_bak/K01nginx/' "$dir/K01nginx_bak"
  fi
  if [ -e "$dir/S01nginx_bak" ]; then
    sudo rm -f "$dir/S01nginx"
    sudo rename 's/S01nginx_bak/S01nginx/' "$dir/S01nginx_bak"
  fi
done

# Add symbolic links for run levels 2, 3, 4, and 5
echo "Adding symbolic links for run levels 2, 3, 4, and 5..."
sudo ln -sf ../init.d/nginx /etc/rc2.d/S01nginx
sudo ln -sf ../init.d/nginx /etc/rc3.d/S01nginx
sudo ln -sf ../init.d/nginx /etc/rc4.d/S01nginx
sudo ln -sf ../init.d/nginx /etc/rc5.d/S01nginx

# Configure NGINX to start automatically at system startup
echo "Configuring NGINX to start automatically at system startup..."
sudo update-rc.d nginx defaults

# Check and correct permissions of configuration files
echo "Checking and correcting permissions of configuration files..."
chown root:root /etc/systemd/system/nginx.service
chmod 644 /etc/systemd/system/nginx.service

# Create or replace the nginx.service file with the provided content
echo "Creating or replacing the /etc/systemd/system/nginx.service file..."
cat <<EOL > /etc/systemd/system/nginx.service
[Unit]
Description=The NGINX HTTP and reverse proxy server
After=network.target

[Service]
Type=forking
ExecStart=/etc/init.d/nginx start
ExecReload=/etc/init.d/nginx -s reload
ExecStop=/etc/init.d/nginx stop -s quit
PIDFile=/www/server/nginx/logs/nginx.pid

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd services to apply changes
echo "Reloading systemd services..."
systemctl daemon-reload

# Enable NGINX service at startup
echo "Enabling NGINX service..."
systemctl enable nginx

# Start NGINX service
echo "Starting NGINX service..."
systemctl start nginx

echo "Repair script completed."
