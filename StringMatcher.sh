#!/bin/bash


echo "  "
echo "+----------+----------+"
echo "String Match Automation 
   by Mark Monteros"
echo "+----------+----------+"
echo "  "

declare mainSource=(`cat ~/Desktop/mainSource.csv | awk '{print$1}'`)
declare getFileRow1=(`cat ~/Desktop/file.csv | awk '{print$1}'`)
declare getFileRow2=(`cat ~/Desktop/file.csv | awk '{print$2}'`)
echo "[Name] [RRD]" > ~/Desktop/output.csv

for (( i=1; i<${#mainSource[*]}; i++ )); do
	count=i;
	if [[ i -eq $count ]]; then		
		for (( j=1; j<${#getFileRow2[*]}; j++ )); do
			if [[ ${mainSource[$count]} == ${getFileRow2[j]} ]]; then
				echo "${mainSource[i]}" "${getFileRow1[j]}" >> ~/Desktop/output.csv
			fi
		done
	fi
	count+=1;
done

cat ~/Desktop/output.csv