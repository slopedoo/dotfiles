#!/bin/bash

SMTP=smtp.domain.com
PORT=587
USERNAME=username
PW=password
FILES=/home/sigurd/ext8/ebooks

if [ ${#FILES/*[@]} -gt 0 ];
then
	for FILE in $FILES/toadd/*; do
		echo "Sending $FILE" >> $FILES/log.txt
		calibre-smtp --attachment "$FILE" --relay $SMTP --port $PORT --username $USERNAME --password "$PW" --encryption-method TLS --subject "Kindle books" "from@email.como" "kindle@@kindle.com" "Kindle books update from server" >> $FILES/log.txt
	done
else
	echo "No files to send." >> $FILES/log.txt
fi
