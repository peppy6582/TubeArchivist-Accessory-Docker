#!/bin/bash

# Set up directories if they don't exist
mkdir -p "$VIDEO_DIRECTORY" "$CHANNELS_DIRECTORY"

# Run the main Python script
exec python3 youtube-process.py
