import json
import os
import argparse

def extract_bike_repair_uids(metadata_dir, output_path):
    takes_file = os.path.join(metadata_dir, 'takes.json')
    
    if not os.path.exists(takes_file):
        print(f"Error: {takes_file} not found.")
        return

    with open(takes_file, 'r') as f:
        takes_data = json.load(f)

    bike_repair_uids = [
        take['take_uid'] for take in takes_data 
        if take.get('scenario_name') == 'Bike Repair'
    ]

    with open(output_path, 'w') as f:
        for uid in bike_repair_uids:
            f.write(f"{uid}\n")

    print(f"Successfully extracted {len(bike_repair_uids)} UIDs for Bike Repair.")
    print(f"UID list saved to: {output_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Filter Ego-Exo4D UIDs by scenario.")
    parser.add_argument("--metadata_dir", required=True, help="Path to the downloaded metadata folder.")
    parser.add_argument("--output", default="bike_repair_uids.txt", help="Output text file for UIDs.")
    
    args = parser.parse_args()
    extract_bike_repair_uids(args.metadata_dir, args.output)