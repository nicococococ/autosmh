#!/bin/bash
stty erase ^H
echo && echo -n -e '请输入h9-miner-spacemesh-linux-amd64的所在路径，示例：/linux:' && read PlotServerPath
#开启plot
sed -i 's/disablePlot: true/disablePlot: false/g' /$PlotServerPath/config.yaml
#生成bash
[ -d /$PlotServerPath/smhauto.sh ] && rm -rf /$PlotServerPath/smhauto.sh
touch /$PlotServerPath/smhauto.sh
echo '#!/usr/bin/env bash'>>/$PlotServerPath/smhauto.sh
echo 'screen -dmS smh'>>/$PlotServerPath/smhauto.sh
echo 'screen -x -S smh -p 0 -X stuff $'cd /linux''>>/$PlotServerPath/smhauto.sh
echo 'screen -x -S smh -p 0 -X stuff $'\n''>>/$PlotServerPath/smhauto.sh
echo 'screen -x -S smh -p 0 -X stuff "h9-miner-spacemesh-linux-amd64 -gpuServer -license yes"'>>/$PlotServerPath/smhauto.sh
echo 'screen -x -S smh -p 0 -X stuff $'\n''>>/$PlotServerPath/smhauto.sh
#添加到自启动
sed -i '$i /$PlotServerPath/smhauto.sh' /home/user/xinit.user.sh
echo -e "重启后，输入Screen -R smh 查看算力界面"
