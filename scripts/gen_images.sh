#!/bin/bash

# Navigate to the images directory
cd images || exit

# Start the JSON array
echo "[" > images.json

# Loop through each image file in the directory
# Assuming image files are jpg, png, gif. Add or remove extensions as needed.
shopt -s nullglob # Ensures the loop doesn't process if no files are found
for image in *.jpg *.png *.gif; do
    # Add the image file name to the array, followed by a comma
    echo "\"$image\"," >> images.json
done

# Use `sed` to remove the last comma from the file to ensure valid JSON
# This works by matching the last occurrence of a comma and replacing it with nothing
sed '$ s/,$//' images.json > temp.json && mv temp.json images.json

# Close the JSON array
echo "]" >> images.json

# Navigate back to the original directory
cd ..

echo "images.json has been updated."

