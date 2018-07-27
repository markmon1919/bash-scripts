#!/bin/bash

echo -e "\n+----------+----------+"
echo -e "String Match Automation \n  by Mark Mon Monteros"
echo -e "+----------+----------+\n"

declare mainSource=(`cat ~/Desktop/mainSource.csv | awk '{print$1}'`)
declare getFileRow1=(`cat ~/Desktop/file.csv | awk '{print$1}'`)
declare getFileRow2=(`cat ~/Desktop/file.csv | awk '{print$2}'`)
echo "${mainSource[0]} ${getFileRow1[0]}" > ~/Desktop/output.csv

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
