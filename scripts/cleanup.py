import json
import os
from pathlib import Path

def cleanup_ego_pose_annotations(uids_file, annotations_dir):
    """Remove annotation files for takes that were deleted."""
    
    # Load valid UIDs
    with open(uids_file, 'r') as f:
        valid_uids = set(line.strip() for line in f)
    
    print(f"Loaded {len(valid_uids)} valid UIDs")
    
    # Process each split (train, val, test)
    for split in ['train', 'val', 'test']:
        split_dir = os.path.join(annotations_dir, split)
        if not os.path.exists(split_dir):
            print(f"Directory not found: {split_dir}")
            continue
        
        # Find all JSON files recursively in this split
        json_files = list(Path(split_dir).rglob('*.json'))
        print(f"\n{split}: Found {len(json_files)} JSON files")
        
        if json_files and len(json_files) > 0:
            # Show example paths
            print(f"Example paths:")
            for example in json_files[:3]:
                print(f"  {example.relative_to(split_dir)}")
            
        removed_count = 0
        kept_count = 0
        
        for json_file in json_files:
            try:
                with open(json_file, 'r') as f:
                    data = json.load(f)
                
                if 'metadata' in data and 'take_uid' in data['metadata']:
                    take_uid = data['metadata']['take_uid']
                else:
                    take_uid = json_file.stem
                
                if take_uid not in valid_uids:
                    os.remove(json_file)
                    removed_count += 1
                    print(f"Removed: {json_file.relative_to(annotations_dir)} (UID: {take_uid})")
                else:
                    kept_count += 1
            except Exception as e:
                print(f"Error processing {json_file.name}: {e}")
        
        print(f"{split} summary: Kept {kept_count}, Removed {removed_count}")

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Clean up annotations for deleted takes")
    parser.add_argument("--uids_file", default="bike_repair_uids.txt", 
                       help="File containing valid take UIDs")
    parser.add_argument("--annotations_dir", 
                       default="data/bike_repair/annotations/ego_pose",
                       help="Path to ego_pose annotations directory")
    
    args = parser.parse_args()
    cleanup_ego_pose_annotations(args.uids_file, args.annotations_dir)