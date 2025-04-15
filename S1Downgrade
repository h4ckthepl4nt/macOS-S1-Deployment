#!/bin/sh

cp '/Library/Application Support/AirWatch/Data/Munki/Managed Installs/Cache/Sentinel-Release-23-3-2-7123_macos_v23_3_2_7123-23.3.2.7123.pkg' '/Users/USERNAME/Downloads'

#password=$(security find-generic-password -a "USERNAME" -w) 

echo $password | sudo -S /Library/Sentinel/sentinel-agent.bundle/Contents/MacOS/sentinelctl upgrade-pkg --allow-downgrade /Users/USERNAME/Downloads/Sentinel-Release-23-3-2-7123_macos_v23_3_2_7123-23.3.2.7123.pkg
rm /Users/USERNAME/Downloads/Sentinel-Release-23-3-2-7123_macos_v23_3_2_7123-23.3.2.7123.pkg
