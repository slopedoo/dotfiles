#!/bin/bash

DIR="/home/sigurd/ext8/ebooks/toadd"
COUNT=`ls -l /home/sigurd/ext8/ebooks/toadd/*.epub 2>/dev/null | wc -l`
if [ $COUNT != 0 ];
then
	for FILE in $DIR/*.epub; do
		echo "Converting $FILE to .mobi format." >> /home/sigurd/ext8/ebooks/log.txt
		ebook-convert "$FILE" "${FILE%%.*}.mobi" >> /home/sigurd/ext8/ebooks/log.txt
		rm -v "$FILE" >> /home/sigurd/ext8/ebooks/log.txt
	done
else
	echo "No epub files to convert/delete" >> /home/sigurd/ext8/ebooks/log.txt
fi
