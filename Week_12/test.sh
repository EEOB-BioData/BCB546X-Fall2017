#!/bin/bash
    set -e
    set -u
    set -o pipefail
# specify the input samples file, where the third
# column is the path to each sample FASTQ file
sample_info=samples.txt
# create a Bash array from the third column of $sample_info
sample_files=($(cut -f 3 "$sample_info"))
for fastq_file in ${sample_files[@]}
do
    # strip .fastq from each FASTQ file, and add suffix
    # "-stats.txt" to create an output filename for each FASTQ file
    results_file="$(basename $fastq_file .fastq)-stats.txt"
    # run fastq_stat on a file, writing results to the filename we've 
    # indicated above
    echo fastq_stat $fastq_file > zmays-snps/stats/$results_file
done
