#!/bin/bash

#SBATCH --job-name=vireo
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=1:00:00
#SBATCH --account=slurm_account
#SBATCH --partition=slurm_partition
#SBATCH --error=/home/log_file/vireo_error.log
#SBATCH --mem=80G
#SBATCH --export=ALL
#SBATCH --output=/home/log_file/vireo_error.log


vireo -c /out/atac/pileup -d sample.vcf -o out/atac/out -N 4 -t GT
