#!/bin/bash

# countline.sh
# Alex Johnson
# 1/23/2025


# count lines of document filename,
# returns line count in $? variable 
function countFileLines
{ 
  lineCount=0
  while IFS= read -r line
  do 
    ((++lineCount)) 
   done < "$filename"
 } 
# runs countFileLines on each arguement give to the script
totalCount=0
if (( $#!=0 )); 
then 
  for files in "$@" 
    do
    filename="$files" 
    countFileLines
    ((totalCount+="$lineCount"))
    done
else
  echo "empty paramter list" 
  

fi
echo $totalCount


