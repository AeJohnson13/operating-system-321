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
  for files in "$inputFiles" 
  do
    filename="$files" 
    countFileLines
    ((totalCount+="$lineCount"))
  done
  echo "empty paramter list" 
} 



#wrapper for total Count function

if (( $#!=0 ));
then 
  for arguments in "$@" 
  do 
  if [ -d $arguments ]; then
    echo "$arguments is a directory"
  else
    echo "$arguments is a file" 
  fi 
  done

  ## passed paramters, need to determine file vs directory
else 
  inputFiles=*
  countTheFiles

fi 
echo $totalCount
