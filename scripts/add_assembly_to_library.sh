#!/bin/bash

# usage: bash scripts/add_assembly_to_library.sh dbname fasta-assembly
# example command: bash scripts/add_assembly_to_library.sh standard_pluspfp /tsl/data/dropbox/GCA_011764245.1_ASM1176424v1_genomic.fna

source kraken-2.1.1
source ncbi_blast-2.2.28



db=$1
assembly=$2

## add to existing db library
kraken2-build --add-to-library $assembly --db $db

## build the newly added library
mkdir -p $db/taxonomy
touch $db/taxonomy/names.dmp
touch $db/taxonomy/nodes.dmp
kraken2-build --threads 6 --db $db --build
