#!/bin/bash


echo -e "\n+-----------+-----------+"
echo -e " String Match Automation \n   by Mark Mon Monteros"
echo -e "+-----------+-----------+\n"


declare mainSource=(`cat ~/Desktop/mainSource.csv | tr " " "_" | awk '{print$1}'`)      #Main Source File
declare getFile1Col1=(`cat ~/Desktop/file.csv | tr " " "_" | awk '{print$1}'`)          #File Match Column-1
declare getFile1Col2=(`cat ~/Desktop/file.csv | tr " " "_" | awk '{print$2}'`)          #File Match Column-2
echo "${mainSource[0]}, ${getFile1Col2[0]}" > ~/Desktop/draft.csv

for (( i=1; i<${#mainSource[*]}; i++ )); do
        count=i;
        if [[ i -eq $count ]]; then
                for (( j=1; j<${#getFile1Col2[*]}; j++ )); do
                        if [[ ${mainSource[$count]} == ${getFile1Col2[j]} ]]; then
                                echo "${mainSource[i]}, ${getFile1Col1[j]}" >> ~/Desktop/draft.csv
                        fi
                done
        fi
        count+=1;
done

cat ~/Desktop/draft.csv | tr "_" " " > ~/Desktop/output.csv
rm ~/Desktop/draft.csv
cat ~/Desktop/output.csv
start ~/Desktop/output.csv
