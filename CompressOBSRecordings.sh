#!/usr/bin/bash

for webm_f in *.mp4
do
  ffmpeg -i $webm_f\
    -vcodec libx264\
	-crf 24\
    "${webm_f%.*}"_compressed.mp4
done
mkdir -p compressed
mv *_compressed.mp4 compressed -v
echo "Done!"