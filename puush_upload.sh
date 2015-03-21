#!/bin/sh

upload2puush(){
	api_key="$1"
	filename="$2"

	response=$(curl "https://puush.me/api/up" -# -F "k=$api_key" -F "z=poop" -F "f=@$filename" | sed -s "s/,/ /g")
#	echo $response


	error_code=$(awk '{print $1;}' <<< $response)
	url=$(awk '{print $2;}' <<< $response)

	if [[ $error_code -eq 1 ]]; then
		echo 'puu.sh upload failure'
		return 1;
	elif [[ $error_code -eq 2 ]]; then
		echo 'puu.sh failure, no filename header'
		return 1;
	fi

	echo -n "$(echo $url)"

}

