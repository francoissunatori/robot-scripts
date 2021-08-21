cd ~/vention_ros
git checkout robot-simulation && git pull && git checkout -b robot-simulation-$1
cd ~/vention_assembler/client
git checkout robot-simulation && git pull && git checkout -b robot-simulation-$1
cd ~/vention_assembler/client/vse
git checkout robot-simulation && git pull && git checkout -b robot-simulation-$1
cd ~/mm-execution-engine
git checkout robot-simulation && git pull && git checkout -b robot-simulation-$1
cd ~/robot-components
git checkout robot-simulation && git pull && git checkout -b robot-simulation-$1
cd ~/machine-app-components
git checkout robot-simulation && git pull && git checkout -b robot-simulation-$1

