#!/bin/bash

# countline.sh
# Alex Johnson
# 1/23/2025 

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

# countline
# if given a series of paramters will call countFileLines on the files and itself recursively on the given directories, 
# else it will call istelf recursivley on all "regular files" within the present directory.
# if any file cannot be read will print the error message to 'error.txt'
if (( "$#">0 )) 
then
  for arguments in "$@" 
  do
    if [ -d "$arguments" -a -r "$arguments" ]; then
       # found a directory call recursively 
       ((totalCount+=$(bash $0 "$arguments"/*)))
    elif [ -r "$arguments" ]; then  
      filename="$arguments" 
      countFileLines
      ((totalCount+="$lineCount"))
		else 
		  cat $arguments 2>> 'error.txt' 
    fi 
  done
	else
  	((totalCount+=$(bash $0 $(find . -maxdepth 1  -type f))))
	fi

echo $totalCount

