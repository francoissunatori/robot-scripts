#! /bin/bash

cd ~/Documents/vention_ros
git checkout robot-simulation && git pull
cd ~/Documents/vention_assembler/client
git checkout robot-simulation && git pull
cd ~/Documents/vention_assembler/client/vse
git checkout robot-simulation && git pull
cd ~/Documents/mm-execution-engine
git checkout robot-simulation && git pull
cd ~/Documents/robot-components
git checkout robot-simulation && git pull
cd ~/Documents/machine-app-components
git checkout robot-simulation && git pull

