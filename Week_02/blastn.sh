#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=3:00:00
#SBATCH --mail-user=<netID>@iastate.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --error=blastn1.%J.err
#SBATCH --output=blastn1.%J.out

cd $SLURM_SUBMIT_DIR

module load ncbi-blast/2.4.0+

tblastx -db /shared/class/bcb590/546x/blast/Zea_mays_dna.fa -query /shared/class/bcb590/546x/blast/zm_pep.fa -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send slen evalue frames sgi staxid" -num_threads 8 -out zm_tblastx.out &

wait
