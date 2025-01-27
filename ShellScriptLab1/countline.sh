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
function countTheFiles
{ 
  totalCount=0
  for files in "$@" 
  do
    filename="$files" 
    countFileLines
    ((totalCount+="$lineCount"))
    done
  else
    echo "empty paramter list" 
  

fi



#wrapper for total Count function

if (( $#!=0 ));
then 


  ## passed paramters, need to determine file vs directory
else 
  
  countTheFiles

fi 
echo $totalCount
