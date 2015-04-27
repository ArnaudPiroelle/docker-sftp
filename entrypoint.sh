#!/bin/bash

if [ -z "$SSH_USER" ]; then
	echo "No ssh user defined. Exiting."
    exit 1	
fi

if [ -z "$SSH_PASSWORD" ]; then
	echo "No ssh password defined. Exiting."
    exit 1	
fi


mkdir /var/run/sshd

if [ $(getent passwd $SSH_USER | wc -l) -eq 0 ]; then
	useradd --shell /sbin/nologin --no-create-home -G sftpusers $SSH_USER
fi

echo "$SSH_USER:$SSH_PASSWORD" | chpasswd

rsyslogd
update-locale

exec "$@"