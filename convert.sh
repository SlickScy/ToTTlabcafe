#!/bin/bash

# Define directories (absolute paths)
ROOT_DIR="$(pwd)"
ENTRIES_DIR="$ROOT_DIR/entries/tex"
DOCS_DIR="$ROOT_DIR/docs/entries"
MK4HT_CFG="$(pwd)/make4htconfig.mk4"

# Find all .tex files
find "$ENTRIES_DIR" -type f -name "*.tex" | while read -r texfile; do
    # Get relative path (relative to entries/tex/)
    rel_path="${texfile#$ENTRIES_DIR/}"
    rel_dir=$(dirname "$rel_path")
    base_name=$(basename "$rel_path" .tex)

    # Prepare output directory
    output_dir="$DOCS_DIR/$rel_dir"
    mkdir -p "$output_dir"

    # Call make4ht with absolute paths
    make4ht -u -c $MK4HT_CFG -d "$output_dir" "$texfile"

    echo "Built: $texfile -> $output_dir/${base_name}.html"
done
