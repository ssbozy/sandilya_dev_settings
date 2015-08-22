#!/usr/bin/env bash

# Repo update
sudo apt-get update

# Install Databases
# MONGODB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# Install ubuntu packages
sudo apt-get install -y ipython
sudo apt-get install -y supervisor


# Install python related packages
sudo apt-get install -y python-pip

# Install python packages
sudo pip install simplejson
sudo pip install pymongo
