#!/bin/bash
set -e

echo "Starting SSH ..."
/usr/sbin/sshd

# Start java app
java -jar /app.jar
