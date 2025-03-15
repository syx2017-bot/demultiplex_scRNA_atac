#!/bin/bash

#SBATCH --job-name=cellsnp
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=48:00:00
#SBATCH --account=slurm_account
#SBATCH --partition=slurm_partition
#SBATCH --error=/home/log_file/cellsnp_error.log
#SBATCH --mem=80G
#SBATCH --export=ALL
#SBATCH --output=/home/log_file/vcf_error.log


# cd $SLURM_SUBMIT_DIR

module load Bioinformatics
module load samtools

#index the bam file
samtools index /data/atac_sample.bam

cellSNP -s /data/atac_sample.bam -b /barcode/barcodes.tsv.gz -O /out/atac/pileup -R sample.vcf -p 20 --minMAF 0.1 --minCOUNT 20 --UMItag None

