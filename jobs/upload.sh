#!/bin/bash

#SBATCH --job-name=upload               # Job name
#SBATCH --output=logs/upload_%j.out     # Standard output log (%j inserts JobID)
#SBATCH --partition=general             # Use a general compute partition
#SBATCH --nodes=1                       # Run on a single node
#SBATCH --cpus-per-task=4               # Use multiple cores for parallel workers
#SBATCH --mem=8G                        # Memory requirement
#SBATCH --time=11:30:00                 # Max wall time (adjust based on internet speed)

module load rclone

LOCAL_DATA="/home/bam20007/research/assembly-action-recognition/data"
REMOTE_DEST="sharepoint:General/Research_Data_Backup/assembly-action-recognition"

echo "Starting upload of assembly-action-recognition data to SharePoint at $(date)..."

rclone copy "$LOCAL_DATA" "$REMOTE_DEST" \
    --update \
    --transfers 4 \
    --checkers 8 \
    --progress \
    --verbose

echo "Job finished at: $(date)"