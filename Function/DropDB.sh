#! /bin/bash

DropDB_fun(){
array=( $(ls ./Databases/))
echo "Tables names --> ${array[@]}" 
read -p "Enter your DB Name You Want to Drop:" DBName

if [[ (${array[@]} =~ $DBName) ]]
 then
        echo "$(rm -d -f  ./Databases/${DBName})"
	echo  "New DB LIST --> $(ls -F  ./Databases)"
      
 else
        echo "DB is not exist,Try again"
	
 fi      
}


