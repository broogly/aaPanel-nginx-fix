#!/bin/bash

# Vérifier et corriger les permissions des fichiers de configuration
echo "Vérification et correction des permissions des fichiers de configuration..."
chown root:root /etc/systemd/system/nginx.service
chmod 644 /etc/systemd/system/nginx.service

# Créer ou remplacer le fichier nginx.service avec le contenu fourni
echo "Création ou remplacement du fichier /etc/systemd/system/nginx.service..."
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

# Recharger les services systemd pour prendre en compte les modifications
echo "Rechargement des services systemd..."
systemctl daemon-reload

# Redémarrer le service NGINX
echo "Redémarrage du service NGINX..."
systemctl restart nginx

# Vérifier le statut du service NGINX
echo "Vérification du statut du service NGINX..."
systemctl status nginx

echo "Script de réparation terminé."

