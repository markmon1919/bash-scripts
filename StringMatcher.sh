#!/bin/bash


echo -e "\n+-----------+-----------+"
echo -e " String Match Automation \n   by Mark Mon Monteros"
echo -e "+-----------+-----------+\n"

declare generateFile=(`cat ~/Desktop/Supply\ and\ Demand\ Tool.csv | tr " " "_" | awk '{print$1}'`)                     #Match This File
declare mainSourceCol1=(`cat ~/Desktop/mainSource.csv | tr "," "$" | tr " " "_" | tr "$" " " | awk '{print$1}'`)        #Main Source File Column-1
declare mainSourceCol2=(`cat ~/Desktop/mainSource.csv | tr "," "$" | tr " " "_" | tr "$" " " | awk '{print$2}'`)        #Main Source File Column-2
echo "${generateFile[0]}, ${mainSourceCol2[0]}" > ~/Desktop/draft.csv

for (( i=1; i<${#generateFile[*]}; i++ )); do
        count=i;
        if [[ i -eq $count ]]; then
                for (( j=1; j<${#mainSourceCol1[*]}; j++ )); do
                        if [[ ${generateFile[$count]} == ${mainSourceCol1[j]} ]]; then
                                echo "${generateFile[i]}, ${mainSourceCol2[j]}" >> ~/Desktop/draft.csv
                        fi
                done
        fi
        count+=1;
done

cat ~/Desktop/draft.csv | tr "_" " " > ~/Desktop/output.csv
rm ~/Desktop/draft.csv
cat ~/Desktop/output.csv
start ~/Desktop/output.csv
