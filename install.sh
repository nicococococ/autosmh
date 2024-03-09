#!/bin/bash
stty erase ^H
#sed -i "s/disablePlot: true/disablePlot: false/g" "/linux/config.yaml"
[ -d /linux/smhauto.sh ] && rm -rf /linux/smhauto.sh
touch /linux/smhauto.sh
echo "#!/usr/bin/env bash">>/linux/smhauto.sh
echo "screen -dmS smh">>/linux/smhauto.sh
echo "screen -x -S smh -p 0 -X stuff 'cd /linux'">>/linux/smhauto.sh
echo "screen -x -S smh -p 0 -X stuff '\n'">>/linux/smhauto.sh
echo "screen -x -S smh -p 0 -X stuff 'h9-miner-spacemesh-linux-amd64 -gpuServer -license yes'">>/linux/smhauto.sh
echo "screen -x -S smh -p 0 -X stuff '\n'">>/linux/smhauto.sh
sed -i "$i /linux/smhauto.sh" "/home/user/xinit.user.sh"
