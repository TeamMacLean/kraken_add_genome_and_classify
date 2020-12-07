#!/bin/bash

# script to split the reads by taxid from kraken output file
# If the raw reads are paired end, the kraken output file will end at _1.fastq and _2.fastq

# usage: bash split_kraken_taxids.sh  classified_1.fastq
# usage: bash split_kraken_taxids.sh  classified_2.fastq


kraken_classified=$1
paired=".fastq"

if [[ $kraken_classified =~ _1.fq || $kraken_classified =~ _1.fastq ]]; then paired="_1.fastq"; fi
if [[ $kraken_classified =~ _2.fq || $kraken_classified =~ _2.fastq ]]; then paired="_2.fastq"; fi
while read line; do 
	if [[ $line =~ taxid ]]; then 
		id=$(echo $line | awk '{print $NF}' | sed 's/:/_/;s/|/_/');  
		echo $line >> ${id}${paired};  
	else 
		echo $line >> ${id}${paired};  
	fi; 

done < ${kraken_classified}

