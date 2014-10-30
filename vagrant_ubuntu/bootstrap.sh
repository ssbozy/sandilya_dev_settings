#!/usr/bin/env bash

# Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# Install ubuntu packages
sudo apt-get install -y ipython
sudo apt-get install -y supervisor
sudo apt-get install -y nginx

# Install python related packages
sudo apt-get install -y python-pip
sudo apt-get install -y python-dev
sudo apt-get install -y build-essential
sudo apt-get install -y python-numpy
sudo apt-get install -y python-scipy

# Install python packages
sudo pip install simplejson
sudo pip install tornado
sudo pip install flask
sudo pip install pymongo