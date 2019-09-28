#!/bin/sh

echo $FLAG > /flag

export FLAG=not_flag
FLAG=not_flag

pm2-runtime /root/processes.yml
