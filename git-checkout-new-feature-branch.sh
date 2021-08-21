cd ~/Documents/vention_ros
git checkout robot-simulation && git pull && git checkout -b robot-simulation-$1
cd ~/Documents/vention_assembler/client
git checkout robot-simulation && git pull && git checkout -b robot-simulation-$1
cd ~/Documents/vention_assembler/client/vse
git checkout robot-simulation && git pull && git checkout -b robot-simulation-$1
cd ~/Documents/mm-execution-engine
git checkout robot-simulation && git pull && git checkout -b robot-simulation-$1
cd ~/Documents/robot-components
git checkout robot-simulation && git pull && git checkout -b robot-simulation-$1
cd ~/Documents/machine-app-components
git checkout robot-simulation && git pull && git checkout -b robot-simulation-$1

