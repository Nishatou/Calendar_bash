#!/bin/bash
#Hw 3 

#initailize variables 
month=$1 #first enter 
year=$2  #second enter
count=0

#check how many parameters 
for arg in "$@"
do 
    ((count++))
done

#check if the input is 2 parameters
if [ $count -ne 2 ]; #$ accual var
then echo "input : illegal input"
exit 1 #just only illegal case need to do exist
fi

#check month input
if (( $month < 1 || $month > 12 )); #bc math expression
then echo "month : illegal input"
exit 1 
fi

#check year input
if (( $year < 0 ));
then echo "year : illegal input"
exit 1 
fi

if (( $year < 100 ));
then ((year = $year + 2000))
fi

#output the select month and year
echo "`date --date="$month/01/$year" +"%b, %Y"`" #capital letter will print the full version of it
echo "Su Mo Tu We Th Fr Sa"


#set the fist day of the week 
firstDay=`date --date="$month/01/$year" +"%w"` #day of week (0..6); 0 is Sunday
space=0
#test 0n may,21 =6 = sat

#set firstDay starts on it accual day of the week
#by set the space before it
while [ $space -lt $firstDay ]; #less than firstDay (6) space will go 0-5 and will start firstDay at 6
do echo -n "   " # -n make output in the same line
((space++))
done

#set the lastday of the month 
#increment month to one greater 
((month++))
#set the last day of the month by subtract 1 to great month will get the last day of the month we want
lastDay=`date --date="$month/01/$year - 1 day" +"%d"`
#echo "$lastDay"


#print from 1 to lastDay
start=1
nine=9
while [ $start -le $lastDay ];  #loop: while start <= lastday print start in the same line
do echo -n "$start"

    #to print make them alligment to one another
     if [ $start -le $nine ]; #if start <= 9 echo two spaces
    then echo -n "  "
    else #start >9 echo one space
        echo -n " "
    fi
    
    #update both start and space by one for one print
((start++)) 
((space++))

    #in each line can have space from 1 to 7
    if [ $space -eq 7 ];
    then echo "  "   #print the new line
    space=0          #reset space to zero
    fi
    
    
done

