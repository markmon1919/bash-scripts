#!/bin/bash


echo -e "\n+-----------+-----------+"
echo -e " String Match Automation \n   by Mark Mon Monteros"
echo -e "+-----------+-----------+"
echo -e " ### Coded in Bash ###\n"

declare matchFile=(`cat ~/Desktop/Supply\ and\ Demand\ Tool.csv | tr " " "_" | awk '{print$1}'`)                        #Match This File

roles="Application Support Engineer\|"
roles+="Project Control Services Practitioner\|"
roles+="Application Developer\|"
roles+="Application Lead\|"
roles+="Advanced Application Engineer\|"
roles+="Tester\|"
roles+="Application Designer\|"
roles+="Program/Project Manager\|"
roles+="Mobilization Lead"

###USING CUSTOM MAIN SOURCE CSV
#declare mainSourceCol1=(`cat ~/Desktop/customSource.csv | tr "," "$" | tr " " "_" | tr "$" " " | awk '{print$1}'`)     #Custom Source File Column-1
#declare mainSourceCol2=(`cat ~/Desktop/customSource.csv | tr "," "$" | tr " " "_" | tr "$" " " | awk '{print$2}'`)     #Custom Source File Column-2

###USING DEMAND-UPSERT CSV FILE
declare mainSourceCol1=(`cat ~/Desktop/demand-upsert05042018.csv | sed '/^\s*$/d' | awk -F "\"*,\"*" '{print$21 " " $22 " " $23 " " $24 " " $25 " " $26 " " $27}' | grep -o "R[0-9]*" | grep -v R$`)        #RRD Number Column
declare mainSourceCol2=(`cat ~/Desktop/demand-upsert05042018.csv | grep weeks | grep -o "$roles" | tr " " "_"`) #Assigned Role Column

#echo "${matchFile[0]},${mainSourceCol2[0]}" > ~/Desktop/draft.csv      #USING CUSTOM SOURCE

echo "${matchFile[0]},Assigned Role" > ~/Desktop/draft.csv              #USING DEMAND-UPSERT SOURCE

for (( i=1; i<${#matchFile[*]}; i++ )); do
        for (( j=0; j<${#mainSourceCol1[*]}; j++ )); do
                if [[ ${matchFile[i]} == ${mainSourceCol1[j]} ]]; then
                        echo "${matchFile[i]},${mainSourceCol2[j]}" >> ~/Desktop/draft.csv
                fi
        done
done

echo -e "\nEnter filename for output file: "
read fileName
echo -e "Saving file $fileName.csv...\n"

cat ~/Desktop/draft.csv | tr "_" " " > ~/Desktop/"$fileName".csv
rm ~/Desktop/draft.csv
cat ~/Desktop/"$fileName".csv
echo -e "\nOpening file $fileName.csv...\n"
start ~/Desktop/"$fileName".csv
