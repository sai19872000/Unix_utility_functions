#!/bin/bash

#split line in 5 parts
echo "Enter the file name without extention and press [Enter]:"
read file
csv=".csv"
split="split_"
file_name=$file$csv
split_file=$file$split
tail -n +2 $file_name | split -l 10000000 - $split_file
for file in $split_file*
do
    head -n 1 $file_name > tmp_file
    cat $file >> tmp_file
    mv -f tmp_file $file$csv
    rm $file
done
