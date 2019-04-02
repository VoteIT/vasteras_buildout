#!/bin/bash
#Ment to be run as root after buildout is done. Will obtain cert and install on nginx debian

cd /etc/nginx
ln -s /home/voteit/srv/vasteras_buildout/etc/nginx.conf ./sites-available/vasteras.conf
cd sites-enabled
ln -s ../sites-available/vasteras.conf

service nginx stop
certbot certonly --standalone -d vasteras.voteit.se
service nginx start
