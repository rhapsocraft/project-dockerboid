#!/bin/bash

# Get the target directory from the first argument, default to current directory
SEARCH_DIR="${1:-.}"

# Check if the target is a directory
if [ ! -d "$SEARCH_DIR" ]; then
    echo "Error: '$SEARCH_DIR' is not a directory."
    exit 1
fi

echo "Starting recursive lowercase conversion in: $SEARCH_DIR"

# Use find to locate all files and directories.
# -depth processes children before parents, which is safer for renaming.
# We exclude hidden files and directories (like .git) to avoid corruption.
find "$SEARCH_DIR" -depth -not -path '*/.*' | while read -r path; do
    parent_dir=$(dirname "$path")
    base_name=$(basename "$path")
    
    # Skip the current directory "." or the search directory itself if it's just "."
    if [ "$base_name" == "." ]; then
        continue
    fi

    # Convert the base name to lowercase
    lowercase_name=$(echo "$base_name" | tr '[:upper:]' '[:lower:]')

    # Only proceed if the name is not already lowercase
    if [ "$base_name" != "$lowercase_name" ]; then
        new_path="$parent_dir/$lowercase_name"
        
        # Check if the target lowercase name already exists to avoid collisions
        if [ -e "$new_path" ]; then
            echo "Warning: Skipping '$path' -> '$new_path' because the destination already exists."
        else
            mv "$path" "$new_path"
            echo "Successfully renamed '$path' to '$new_path'"
        fi
    fi
done

echo "Conversion complete."
