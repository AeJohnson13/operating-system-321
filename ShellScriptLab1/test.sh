 ls >> "temp.txt"
  lineCount=-1
  while IFS= read -r line
  do 
    ((++lineCount)) 
   done < $"temp.txt"

   echo $lineCount

   rm "temp.txt"
