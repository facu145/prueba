#!/bin/bash

mkdir -p /home/linux/rad
cd /home/linux/rad
echo 'echo "hello world"' > mi_script.sh
chmod +x mi_script.sh

tmp_crontab=$(mktemp)

crontab -l > "$tmp_crontab"

echo "0 9 * * * /home/linux/rad/mi_script.sh" >> "$tmp_crontab"
echo "30 20 * * * /home/linux/rad/mi_script.sh" >> "$tmp_crontab"
echo "0 18 * * 0 /home/linux/rad/mi_script.sh" >> "$tmp_crontab"

crontab "$tmp_crontab"

rm "$tmp_crontab"

echo "Crontab entries created successfully."
