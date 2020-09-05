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

HH_count=0
HT_count=0
TH_count=0
TT_count=0

for (( i=0;i<n;i++ ))
do
        coin_flip_result1=$(( RANDOM%2 ))
        coin_flip_result2=$(( RANDOM%2 ))
        if [[ $coin_flip_result1 -eq 0 && $coin_flip_result2 -eq 0 ]]
        then
                (( HH_count++ ))
        elif [[ $coin_flip_result1 -eq 0 && $coin_flip_result2 -eq 1 ]]
        then
                (( HT_count++ ))
        elif [[ $coin_flip_result1 -eq 1 && $coin_flip_result2 -eq 0 ]]
        then
                (( TH_count++ ))
        else
                (( TT_count++ ))
        fi
done

dictCombinationCount[HH]=$HH_count
dictCombinationCount[HT]=$HT_count
dictCombinationCount[TH]=$TH_count
dictCombinationCount[TT]=$TT_count

dictCombinationPercentage[HH]=$(( $HH_count*100/$n ))
dictCombinationPercentage[HT]=$(( $HT_count*100/$n ))
dictCombinationPercentage[TH]=$(( $TH_count*100/$n ))
dictCombinationPercentage[TT]=$(( $TT_count*100/$n ))

echo "Combination Singlet: " ${!dictCombinationCount[@]}
echo "Count H and T : " ${dictCombinationCount[@]}
echo "Percentage :" ${dictCombinationPercentage[@]}
