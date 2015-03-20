#!/bin/sh

upload2puush(){
	api_key="$1"
	filename="$2"

	response=$(curl "https://puush.me/api/up" -# -F "k=$api_key" -F "z=poop" -F "f=@$filename")
	
#	if [[ $response -eq -1 ]]; then
#		echo 'puu.sh upload failure'
#		return 1;
#	elif [[ $response -eq -2 ]]; then
#		echo 'puu.sh failure, no filename header'
#		return 1;
#	fi

	echo -n "$(echo $response | sed -E 's/^.+,(.+),.+,.+$/\1\n/')"

}

