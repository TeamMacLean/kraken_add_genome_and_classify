#!/bin/bash

# script to run kraken2 taxonomic classification of raw reads
# usage: bash run_kraken.sh dbname R1.fastq R2.fastq outputlogfilename out_classified.fastq out_unclassified.fastq


source kraken-2.1.1
source gcc-6.4.0

db=$1
R1=$2
R2=$3
output=$4
classified=$5
unclassified=$6

kraken2 --db $db --threads 6 --paired --gzip-compressed --output $output --classified-out ${classified}#.fastq --unclassified-out ${unclassified}#.fastq --minimum-base-quality 20 $R1 $R2
