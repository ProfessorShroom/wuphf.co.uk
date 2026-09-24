#!/bin/bash

# Get the directory where the script is located (scripts/), then go up
# one level to the repo root so TARGET_DIR resolves to the real assets/img.
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

TARGET_DIR="$BASE_DIR/assets/img"

# Check if exiftool is installed
if ! command -v exiftool &> /dev/null; then
    echo "ExifTool is not installed. Install it first:"
    echo "sudo apt install libimage-exiftool-perl"
    exit 1
fi

echo "Removing metadata from images in: $TARGET_DIR"
echo

# Remove metadata recursively
exiftool -all= -overwrite_original -r "$TARGET_DIR"

echo
echo "Done."
