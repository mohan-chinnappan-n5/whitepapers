ffmpeg -loop 1 -i $2 -i $1 -c:a aac -b:a 192k -c:v libx264 -shortest -vf "scale=1280:720,format=yuv420p" $1.mp4
