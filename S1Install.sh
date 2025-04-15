#!/bin/sh
S1INSTALL=/Applications/SentinelOne/
S1PKG=/Library/Application\ Support/AirWatch/Data/Munki/Managed\ Installs/Cache/Sentinel-Release-24-4-1-7830_macos_v24_4_1_7830-24.4.1.7830.pkg

#Check if S1 is already installed
if [ -d "$S1INSTALL" ]; then
	echo 'S1 Already Installed'
	exit 0
fi

#Check if the .pkg is available for install
if [ ! -f "$S1PKG" ]; then
	echo "S1 PKG Not yet available. Will try again in 4 hours."
	exit 1
else
	echo "S1 PKG is available and will be copied in 5 seconds..."
	sleep 5
	echo "Installing S1 now..."

	#Retreive generic user password from the keychain	(Recommend this method unless the password variable can be set another way)
	password=$(security find-generic-password -a "USERNAME" -w)

	#Copy payloads to local user directory
	/bin/echo "eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS1jaHJpc3RpYW5hY2FyZS5zZW50aW5lbG9uZS5uZXQiLCAic2l0ZV9rZXkiOiAiZ19lZjUyZjRkYTRhMzQxNWUxIn0=" > "/Library/Application Support/AirWatch/Data/Munki/Managed Installs/Cache/com.sentinelone.registration-token"
	echo $password | sudo -S cp '/Library/Application Support/AirWatch/Data/Munki/Managed Installs/Cache/com.sentinelone.registration-token' '/Users/USERNAME/Downloads'
	echo $password | sudo -S cp '/Library/Application Support/AirWatch/Data/Munki/Managed Installs/Cache/Sentinel-Release-24-4-1-7830_macos_v24_4_1_7830-24.4.1.7830.pkg' '/Users/USERNAME/Downloads/'

	#Install S1 Agent
	echo $password | sudo -S /usr/sbin/installer -pkg '/Users/USERNAME/Downloads/Sentinel-Release-24-4-1-7830_macos_v24_4_1_7830-24.4.1.7830.pkg' -target /

	#Clean up
	echo $password | sudo -S rm /Users/USERNAME/Downloads/com.sentinelone.registration-token
	echo $password | sudo -S rm /Users/USERNAME/Downloads/Sentinel-Release-24-4-1-7830_macos_v24_4_1_7830-24.4.1.7830.pkg
	echo "S1 is now installed"
    exit 0
fi
