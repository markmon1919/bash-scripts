#!/bin/bash

echo -e "\n+-----------+-----------+"
echo -e " String Match Automation \n  by Mark Mon Monteros"
echo -e "+-----------+-----------+\n"

declare mainSource=(`cat ~/Desktop/mainSource.csv | awk '{print$1}'`)	#Main Source File
declare getFileCol1=(`cat ~/Desktop/file.csv | awk '{print$1}'`)		#File Match Column-1
declare getFileCol2=(`cat ~/Desktop/file.csv | awk '{print$2}'`)		#File Match Column-2
echo "${mainSource[0]} ${getFileCol1[0]}" > ~/Desktop/output.csv

for (( i=1; i<${#mainSource[*]}; i++ )); do
	count=i;
	if [[ i -eq $count ]]; then		
		for (( j=1; j<${#getFileCol2[*]}; j++ )); do
			if [[ ${mainSource[$count]} == ${getFileCol2[j]} ]]; then
				echo "${mainSource[i]}" "${getFileCol1[j]}" >> ~/Desktop/output.csv
			fi
		done
	fi
	count+=1;
done

cat ~/Desktop/output.csv
