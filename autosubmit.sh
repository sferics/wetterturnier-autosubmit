#!/bin/bash
#only for debian/ubuntu systems
sudo apt install python2.7

#python3 support coming soon!
pip install configparser

#If you use a proxy you have to change this environment variable:
#export https_proxy=https://user:password@proxy-server:port

python2 autosubmit.py -f autosubmit.cfg
