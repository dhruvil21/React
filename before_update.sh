#!/bin/bash
if [ -d "/home/test/testing" ]; then
cd /home/test/testing
mkdir hello
cd hello
touch ab
echo "Added"
else
exit 1
fi
