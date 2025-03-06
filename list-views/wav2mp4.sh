#!/bin/bash

# Usage info function
usage() {
    echo "Usage:"
    echo "  $0 wav-to-mp4 <input.wav> <background.jpg>"
    echo "  $0 mp4-to-webm <input.mp4>"
    echo
    echo "Commands:"
    echo "  wav-to-mp4     Convert WAV audio to MP4 video with a static image background."
    echo "  mp4-to-webm    Convert an MP4 video to WEBM format."
    echo
    echo "Examples:"
    echo "  $0 wav-to-mp4 audio.wav background.jpg"
    echo "  $0 mp4-to-webm video.mp4"
    exit 1
}

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: ffmpeg is not installed. Install it and try again."
    exit 1
fi

# Check if at least one argument is provided
if [ "$#" -lt 2 ]; then
    echo "Error: Missing arguments."
    usage
fi

# Get the command
COMMAND="$1"

# Convert WAV to MP4
if [ "$COMMAND" == "wav-to-mp4" ]; then
    if [ "$#" -ne 3 ]; then
        echo "Error: Missing arguments for wav-to-mp4."
        usage
    fi

    INPUT_WAV="$2"
    BACKGROUND_IMG="$3"
    OUTPUT_MP4="${INPUT_WAV%.*}.mp4"  # Replaces .wav with .mp4

    # Validate input files
    if [ ! -f "$INPUT_WAV" ]; then
        echo "Error: WAV file '$INPUT_WAV' not found."
        exit 1
    fi

    if [ ! -f "$BACKGROUND_IMG" ]; then
        echo "Error: Background image '$BACKGROUND_IMG' not found."
        exit 1
    fi

    # Convert WAV to MP4
    echo "🎬 Converting '$INPUT_WAV' to '$OUTPUT_MP4' with background '$BACKGROUND_IMG'..."
    ffmpeg -loop 1 -i "$BACKGROUND_IMG" -i "$INPUT_WAV" -c:a aac -b:a 192k -c:v libx264 -shortest -vf "scale=1280:720,format=yuv420p" "$OUTPUT_MP4"

    if [ $? -eq 0 ]; then
        echo "✅ Conversion successful: '$OUTPUT_MP4'"
    else
        echo "❌ Error during conversion."
        exit 1
    fi
fi

# Convert MP4 to WEBM
if [ "$COMMAND" == "mp4-to-webm" ]; then
    if [ "$#" -ne 2 ]; then
        echo "Error: Missing arguments for mp4-to-webm."
        usage
    fi

    INPUT_MP4="$2"
    OUTPUT_WEBM="${INPUT_MP4%.*}.webm"  # Replaces .mp4 with .webm

    # Validate input file
    if [ ! -f "$INPUT_MP4" ]; then
        echo "Error: MP4 file '$INPUT_MP4' not found."
        exit 1
    fi

    # Convert MP4 to WEBM
    echo "🎥 Converting '$INPUT_MP4' to '$OUTPUT_WEBM'..."
    ffmpeg -i "$INPUT_MP4" -c:v libvpx-vp9 -b:v 1M -c:a libopus "$OUTPUT_WEBM"

    if [ $? -eq 0 ]; then
        echo "✅ Conversion successful: '$OUTPUT_WEBM'"
    else
        echo "❌ Error during conversion."
        exit 1
    fi
fi

# If the command is invalid, show usage
echo "Error: Invalid command."
usage