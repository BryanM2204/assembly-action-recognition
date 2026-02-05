#!/bin/bash

#SBATCH --job-name=bike_repair_cleanup # Job name
#SBATCH --output=logs/cleanup_%j.out   # Standard output log (%j inserts JobID)
#SBATCH --partition=general             # Use a general compute partition
#SBATCH --nodes=1                       # Run on a single node
#SBATCH --cpus-per-task=4               # Use multiple cores for parallel workers
#SBATCH --mem=8G                        # Memory requirement
#SBATCH --time=11:30:00                 # Max wall time (adjust based on internet speed)

# Remove all exocentric camera videos (cam01, cam02, cam03, cam04) from downloaded takes
DATA_DIR="/home/bam20007/research/assembly-action-recognition/data/bike_repair/takes"

echo "Removing exocentric camera videos (cam01.mp4, cam02.mp4, cam03.mp4, cam04.mp4)..."

# Find and delete all cam*.mp4 and ego_preview.mp4 files
find "$DATA_DIR" -type f \( -name "cam*.mp4" -o -name "ego_preview.mp4" \) -delete

echo "Cleanup completed!"
echo "Remaining videos:"
find "$DATA_DIR" -type f -name "*.mp4" | head -20