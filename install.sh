#!/bin/bash
stty erase ^H
#开启plot
sed -i 's/disablePlot: true/disablePlot: false/g' /linux/config.yaml
#生成bash
[ -d /linux/smhauto.sh ] && rm -rf /linux/smhauto.sh
touch /linux/smhauto.sh
echo '#!/usr/bin/env bash'>>/linux/smhauto.sh
echo 'screen -dmS smh'>>/linux/smhauto.sh
echo 'screen -x -S smh -p 0 -X stuff $'cd /linux''>>/linux/smhauto.sh
echo 'screen -x -S smh -p 0 -X stuff $'\n''>>/linux/smhauto.sh
echo 'screen -x -S smh -p 0 -X stuff "h9-miner-spacemesh-linux-amd64 -gpuServer -license yes"'>>/linux/smhauto.sh
echo 'screen -x -S smh -p 0 -X stuff $'\n''>>/linux/smhauto.sh
#添加到自启动
sed -i '$i /$PlotServerPath/smhauto.sh' /home/user/xinit.user.sh
echo -e "重启后，输入Screen -R smh 查看算力界面"
