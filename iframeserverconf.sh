#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install nginx -y
sudo apt install unzip -y
systemctl start nginx
systemctl enable nginx
wget https://www.html5webtemplates.co.uk/wp-content/uploads/2020/05/simplestyle_banner.zip
sudo unzip -o simplestyle_banner.zip
####incert the targeted line of code#####
sudo sed -i '97 i   <br><br>' simplestyle_banner/index.html
sudo sed -i '98 i   <iframe width="1250" height="500" src="http://www.iframexyz.com"></iframe>' simplestyle_banner/index.html

####Now proceed to deploy#####
sudo mv simplestyle_banner/* /var/www/html/
sudo rm -rf /var/www/html/index.nginx-debian.html
#########configure available sites#############
sudo mv /home/souradeep/iframegit/site.conf /etc/nginx/sites-available/
sudo rm -rf /etc/nginx/sites-available/default
sudo rm -rf index.nginx-debian.html
sleep 15
systemctl reload nginx
systemctl status nginx
