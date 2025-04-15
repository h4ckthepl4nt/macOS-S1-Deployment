#!/bin/sh

#Verify PKG is available before proceeding
S1PKG=/Library/Application\ Support/AirWatch/Data/Munki/Managed\ Installs/Cache/Sentinel-Release-24-4-1-7830_macos_v24_4_1_7830-24.4.1.7830.pkg

#echo $S1PKG

if [ ! -f "$S1PKG" ]; then
	echo "S1 PKG Not yet available."
	exit 1
else
	echo "S1 PKG is available and will be copied."
fi

#password=$(security find-generic-password -a "USESRNAME" -w) 

s1version1=$(echo $password | sudo -S /Library/Sentinel/sentinel-agent.bundle/Contents/MacOS/sentinelctl version)
#echo $s1version

# Function to truncate text by removing the first 12 characters
truncate_text() {
  s1version2="$s1version1"
  echo "${s1version2:12}"
}
#truncate_text "$s1version2"
s1version3=$(truncate_text "$s1version2")

if [ "$s1version3" != "24.4.1.7830" ]; then
	echo "S1 Is Out of Date and will update in 5 seconds..."
	sleep 5

	#Copy S1 PKG to Download folder
	cp '/Library/Application Support/AirWatch/Data/Munki/Managed Installs/Cache/Sentinel-Release-24-4-1-7830_macos_v24_4_1_7830-24.4.1.7830.pkg' '/Users/USERNAME/Downloads'

	#Install s1 update
	echo $password | sudo -S /Library/Sentinel/sentinel-agent.bundle/Contents/MacOS/sentinelctl upgrade-pkg /Users/USERNAME/Downloads/Sentinel-Release-24-4-1-7830_macos_v24_4_1_7830-24.4.1.7830.pkg

	#Remove S1 PKG from the Download folder
	rm /Users/USERNAME/Downloads/Sentinel-Release-24-4-1-7830_macos_v24_4_1_7830-24.4.1.7830.pkg

	echo $password | sudo -S /Library/Sentinel/sentinel-agent.bundle/Contents/MacOS/sentinelctl version

else

	echo "S1 Is Up to Date and running v$s1version3"
	
	#Remove S1 PKG from the Download folder
	rm /Users/USERNAME/Downloads/Sentinel-Release-24-4-1-7830_macos_v24_4_1_7830-24.4.1.7830.pkg
	exit 0 
fi
