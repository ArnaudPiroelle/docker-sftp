#!/bin/bash

if [ -z "$SSH_PASSWORD" ]; then
	echo "No ssh password defined. Exiting."
    exit 1	
fi

mkdir /var/run/sshd

echo "root:$SSH_PASSWORD" | chpasswd

usermod -a -G sftpusers root

rsyslogd
update-locale

exec "$@"