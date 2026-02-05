#!/bin/bash

#SBATCH --job-name=bike_repair_download # Job name
#SBATCH --output=logs/download_%j.out   # Standard output log (%j inserts JobID)
#SBATCH --partition=general             # Use a general compute partition
#SBATCH --nodes=1                       # Run on a single node
#SBATCH --cpus-per-task=4               # Use multiple cores for parallel workers
#SBATCH --mem=8G                        # Memory requirement
#SBATCH --time=11:30:00                 # Max wall time (adjust based on internet speed)


module load python/3.10.5

source /home/bam20007/research/.venv/bin/activate

OUTPUT_DIR="/home/bam20007/research/assembly-action-recognition/data/bike_repair"
LOGS="/home/bam20007/research/assembly-action-recognition/jobs/logs"
mkdir -p $OUTPUT_DIR
mkdir -p $LOGS


echo "Starting Ego-Exo4D download for Bike Repair scenario..."

UIDS=$(cat /home/bam20007/research/assembly-action-recognition/bike_repair_uids.txt | tr '\n' ' ')

egoexo -o $OUTPUT_DIR \
--parts metadata annotations downscaled_takes/448 ego_pose_pseudo_gt \
       --views ego \
       --uids $UIDS \
       --yes

echo "Download process completed at $(date)"
                                              