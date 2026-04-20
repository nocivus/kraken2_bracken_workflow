#!/bin/bash

# Name of the directory containing the kraken classification database & the Bracken k-mers databases
k2_dataBase="k2_viral_20260226"

db="./database/$k2_dataBase"
read_dir="./reads"

# collect first file of each paired reading in ./reads
while IFS= read -r line; do
    samples_1+=("$line")
done < <(find "$read_dir" -name "*_1.fastq.gz")

# collect second file of each paired reading in ./reads
while IFS= read -r line; do
    samples_2+=("$line")
done < <(find "$read_dir" -name "*_2.fastq.gz")

# check if both lists have same number of files
if [ ${#samples_1[@]} -ne ${#samples_2[@]} ]; then
    echo "Error: File missing in paired readings?"
    exit 1
fi

# make directories for generated files
mkdir output/classified/
mkdir output/bracken/
mkdir output/krona/

# commands for every paired reading in ./reads directory
count=${#samples_1[@]}
for (( i=0; i<$count; i++ ));
do
    sample1=${samples_1[$i]}
    sample2=${samples_2[$i]}
    filename="$sample1"
    filename=${filename:8:11}
    
    kraken2 --db $db --threads 8 --classified-out output/classified/"$filename"_classified# --output output/"$filename"_output --report output/"$filename"_report --paired $sample1 $sample2 
    
    bracken -d $db -i ./output/"$filename"_report -r 100 -l S -t 10 -o output/bracken/"$filename".bracken -w output/bracken/"$filename".breport
    
    python kreport2krona.py -r output/bracken/"$filename".breport -o output/krona/"$filename".b.krona.txt --no-intermediate-ranks
    
    ktImportText output/krona/"$filename".b.krona.txt -o output/krona/"$filename".krona.html
    
done

