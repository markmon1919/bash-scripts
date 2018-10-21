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
echo -e " ${LIGHTRED}Supply Automation Tool${NC} \n   by ${LIGHTGREEN}Mark Mon Monteros"
echo -e "${YELLOW}+-----------+-----------+"
echo -e " ${CYAN}### Coded in Bash ###${NC}\n"
echo -e "\n"

# Filter the “IG and Resources Reqd From” column to: SFDC IPS, Oracle IPS, Workday IPS.  
# Remove all the “Contractors” from the “Personnel No” column.  
# If possible, delete all the columns from the attachment (Supply To Be Deleted) to the HC report.  
# Save file as .csv (Comma Delimited) for Data Loader upload.  
 
#Step 1 - convert first to Tab Delimited
#TOTAL RECORDS = 27,545

path=$(pwd)

#GET TXT FILE
tabdelimited=$(ls | grep -e .txt$ | grep -v ^Supply)

#GET HEAD
cat "$path"/"$tabdelimited" | sed -e 's/,\s/~/g' -e 's/,/~/g' | tr ' ' '~' | tr '\t' ',' | sed -e 's/^,/NULL,/' -e 's/,,/,NULL,/g' -e 's/,$/,NULL/' | sed -e 's/,,/,NULL,/g' | head -n 1 > "$path"/header.csv

#ARRANGE SHEET
cat "$path"/"$tabdelimited" | sed -e '1d' | sed -e 's/,\s/~/g' -e 's/,/~/g' | tr ' ' '~' | tr '\t' ',' | sed -e 's/^,/NULL,/' -e 's/,,/,NULL,/g' -e 's/,$/,NULL/' | sed -e 's/,,/,NULL,/g' | tr ',' ' ' > "$path"/draft.csv

#FILTER CONTRACTOR = -1,286/26,259
cat "$path"/draft.csv | awk '{if ($1 != "Contractor") print$0}' | tr ' ' ',' > "$path"/draft1.csv

#FILTER IG -- Column AS(#45) = 1,222 records
cat "$path"/draft1.csv | tr ',' ' ' | awk '{if ($45 == "SFDC~IPS" || $45 == "Oracle~IPS" || $45 == "Workday~IPS") print$0}' | tr ' ' ',' > "$path"/draft2.csv

#FILTER Resource Reqd From -- Column BA(#53) = 1,148 records
cat "$path"/draft2.csv | tr ',' ' ' | awk '{if ($53 == "Salesforce~IPS" || $53 == "Oracle~IPS" || $53 == "Workday~IPS") print$0}' | tr ' ' ',' > "$path"/draft3.csv

cat "$path"/header.csv >> "$path"/final.csv
cat "$path"/draft3.csv >> "$path"/final.csv
cat "$path"/final.csv | tr '~' ' ' | sed 's/NULL//g' > "$path"/final_2.csv

rm "$path"/draft.csv "$path"/draft1.csv "$path"/draft2.csv "$path"/draft3.csv "$path"/header.csv "$path"/final.csv
rm "$path"/"$tabdelimited"

#Delete Columns Source
declare DELCOL=(`cat "$path"/"Supply To Be Deleted.txt" | sed 's/\t/,/g' | tr ' ' '~' | tr ',' ' '`)
declare DELHEAD=(`cat "$path"/final_2.csv | head -n 1 | tr ' ' '~' | tr ',' ' '`)
touch "$path"/colnum

for (( i=0; i<${#DELCOL[*]}; i++ )); do
	for (( j=0; j<${#DELHEAD[*]}; j++ )); do
		position=$(( $j + 1 ))
		if [[ ${DELCOL[i]} == ${DELHEAD[j]} ]]; then
			echo $position >> colnum
		fi
	done
done

declare DEL=(`cat "$path"/colnum`)
echo ${DEL[*]} | tr ' ' ',' > "$path"/delcol
delcol=$(cat "$path"/delcol)
rm "$path"/colnum

cut -d, -f$delcol --complement "$path"/final_2.csv > "$path"/final_output.csv
rm "$path"/delcol "$path"/final_2.csv

#Saving file
echo -e "\nEnter output filename:"
read filename
mv "$path"/final_output.csv "$path"/"$filename".csv

echo -e "\n${ORANGE}Saving file as.. ${LIGHTBLUE}$path/$filename".csv${NC}
echo -e "\nDONE!!"