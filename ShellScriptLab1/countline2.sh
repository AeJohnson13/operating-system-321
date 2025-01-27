#!/bin/bash

# countline2.sh
# Alex Johnson
# 1/23/2025
# attempt 2 

totalCount=0 

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
echo "arriving at if"
if [$# -gt 0]; 
then 
  for arguments in "$@" 
  do
    if [ -d "$arguments" ]; then
       # found a directory call recursively 
       bash $0 "$arguments"/*
    else 
      filename="$arguments" 
      countFileLines
      ((totalCount+="$lineCount"))
    fi 
  done
else
  bash $0 * 
fi

echo $totalCount

