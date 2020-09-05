#!/bin/bash -x

declare -A dictCombinationCount
declare -A dictCombinationPercentage

read -p "Enter the number of times do you want to flip coins: " n

H_count=0
T_count=0

for (( i=0;i<n;i++ ))
do
	coin_flip_result=$(( RANDOM%2 ))
	if [[ $coin_flip_result -eq 0 ]]
	then
		(( H_count++ ))
	else
		(( T_count++ ))
	fi
done

dictCombinationCount[H]=$H_count
dictCombinationCount[T]=$T_count

dictCombinationPercentage[H]=$(( $H_count*100/$n ))
dictCombinationPercentage[T]=$(( $T_count*100/$n ))

echo "Combination Singlet: " ${!dictCombinationCount[@]}
echo "Count H or T : " ${dictCombinationCount[@]}
echo "Percentage :" ${dictCombinationPercentage[@]}
