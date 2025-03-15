#!/bin/bash

#SBATCH --job-name=cellsnp
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=48:00:00
#SBATCH --account=sigbio_project25
#SBATCH --partition=sigbio
#SBATCH --error=/home/yuxuans/log_file/cellsnp_error.log
#SBATCH --mem=80G
#SBATCH --mail-user=yuxuans@umich.edu
#SBATCH --export=ALL
#SBATCH --output=/home/yuxuans/log_file/vcf_error.log


# cd $SLURM_SUBMIT_DIR

module load Bioinformatics
module load samtools

#index the bam file
samtools index /scratch/sigbio_project_root/sigbio_project25/yuxuans/10x/bam/11008-LG-1_atac.bam

cellSNP -s /scratch/sigbio_project_root/sigbio_project25/yuxuans/10x/bam/11008-LG-1_atac.bam -b /scratch/sigbio_project_root/sigbio_project25/yuxuans/10x/barcode/filtered/11008-LG-1.tsv -O /scratch/sigbio_project_root/sigbio_project25/yuxuans/10x/vrieo_snp/out/11008/11008-LG-1/atac/pileup -R /scratch/sigbio_project_root/sigbio_project25/yuxuans/10x/vcf/output_filtered_new_11008.vcf -p 20 --minMAF 0.1 --minCOUNT 20 --UMItag None

