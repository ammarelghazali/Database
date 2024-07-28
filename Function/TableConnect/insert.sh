#! /bin/bash

source ./Validation/CheckIntType.sh
source ./Validation/CheckStringType.sh
user_input(){
read "Enter your value to $1 with type $2:" value
return $value

}

Insert_fun(){
read -p "Enter your Table Name:" TableName
cd ./Databases/$1
while read c1 c2
do
	echo "$c1"
	if [[ "$c1" == "Column_number:" ]]
	then	
		continue
	else	
		echo "$c2"	
		#read -p "Enter your value to ${c1} with type ${c2}:" value
		value=user_input "$c1" "$c2"
		if [[ "$c2" == "int" ]]
		then 
			var=$(CheckIntType_fun "$value")
			if [[ "$var" == "1" ]]
			then
				printf "$value " >> "${TableName}"
			else
				echo "TRY, AGAIN!!! The value doesn't contain only numbers"
			fi	
		#elif [[ $c2 == "string" ]]
	        else
		       var=$(CheckStringType_fun "$value")
	       		if [[ "$var" == "1" ]]
                        then
                                printf "$value " >> "${TableName}"
                        else
                                echo "TRY, AGAIN!!! The value doesn't contain only chracters"
                        fi	       
		fi	
	fi			
done < "${TableName}.metadata"
	
echo " " >> "${TableName}"
}
