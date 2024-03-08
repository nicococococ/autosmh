#!/bin/bash
stty erase ^H
echo '#!/usr/bin/env bash'>>/smhauto.sh
echo 'screen -dmS smhauto'>>/smhauto.sh
echo 'screen -x -S smhauto -p 0 -X stuff $'cd /linux''>>/smhauto.sh
echo 'screen -x -S smhauto -p 0 -X stuff $'\n''>>/smhauto.sh
echo 'screen -x -S smhauto -p 0 -X stuff "h9-miner-spacemesh-linux-amd64 -gpuServer -license yes"'>>/smhauto.sh
echo 'screen -x -S smhauto -p 0 -X stuff $'\n''>>/smhauto.sh
