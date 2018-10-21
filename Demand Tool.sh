#!/bin/bash

LIGHTRED='\033[1;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
LIGHTGREEN='\033[1;32m'
LIGHTPURPLE='\033[1;35m'
LIGHTBLUE='\033[1;34m'
ORANGE='\033[0;33m'
NC='\033[0m'

echo -e "${YELLOW}\n+-----------+-----------+"
echo -e " ${LIGHTRED}Demand Automation Tool${NC} \n   by ${LIGHTGREEN}Mark Mon Monteros"
echo -e "${YELLOW}+-----------+-----------+"
echo -e " ${CYAN}### Coded in Bash ###${NC}\n"

echo -e "${LIGHTPURPLE}Note: Before running script make sure all CSV filenames contain no whitespaces..${NC}"
#format is cut 30th line of CSV
echo -e "${LIGHTPURPLE}IMPORTANT: Execute this script only once!${NC}\n"

path=$(pwd)
declare CSVFILES=(`ls | grep -e .csv$ | grep -v "ATCP_keymatch_results_combined*"`)

touch "$path"/rrd
touch "$path"/addskills

#REMOVE HEAD
for i in ${CSVFILES[*]}; do
	sed -i '1,48d' $i
	sed -e "s/^,/NULL,/" -e "s/,,/,NULL,/g" -e "s/,$/,NULL/" -i $i
	sed -e 's/,,/,NULL,/g' -i $i
done

#START HERE
for i in ${CSVFILES[*]}; do
	cat "$path"/$i | grep -o R[0-9]*,NULL | cut -d , -f1 >> "$path"/rrd
	cat "$path"/$i | tr ' ' '~' | tr ',' ' ' | awk '{print$9}' | grep -v NULL | sed '/^\s*$/d' >> "$path"/addskills
done

declare RRD=(`cat "$path"/rrd`)
declare ADDSKILLS=(`cat "$path"/addskills`)

rm "$path"/rrd "$path"/addskills

#Create headless file
cat "$path"/"ATCP_keymatch_results_combined".csv | sed -e '1d' > "$path"/headless.csv

#Appends to AddSkills column
touch "$path"/append.csv
for (( i=0; i<${#RRD[*]}; i++ )); do
	cat "$path"/headless.csv | grep ${RRD[i]} | sed -e "\$a,${ADDSKILLS[i]}" | awk 'NR%2{printf "%s ",$0;next;}1' | tr '~' ' ' >> "$path"/append.csv
done

RRDLS=""
for (( i=0; i<${#RRD[*]}; i++ )); do
	if [[ i -lt `expr ${#RRD[*]} - 1` ]]; then
		RRD+="${RRD[i]}\|"
	elif [[ i -eq `expr ${#RRD[*]} - 1` ]]; then
		RRDLS+="${RRD[i]}"
	fi
done

cat "$path"/headless.csv | grep -v "$RRDLS" >> "$path"/append.csv
rm "$path"/headless.csv

echo -e "\nEnter output filename: "
read filename
echo -e "\n${ORANGE}Saving file as.. ${LIGHTBLUE}$path/$filename".csv${NC}
cat "$path"/"ATCP_keymatch_results_combined".csv | sed -n 1p | sed -e "\$a,Additional Skills (Nice to have this)" | awk 'NR%2{printf "%s ",$0;next;}1' >> "$path"/"$filename".csv
cat "$path"/append.csv >> "$path"/"$filename".csv
rm "$path"/append.csv

DELCSV=(`ls | grep -e .csv$ | grep -v "$filename\|ATCP_keymatch_results_combined*"`)
for i in ${DELCSV[*]}; do
	rm "$path"/$i
done

echo -e "\nDONE!!"
