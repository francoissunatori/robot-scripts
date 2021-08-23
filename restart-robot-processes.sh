#! /bin/bash

cd ~/Documents/scripts

# default values
mm_execution_engine=remote
robot_components=remote
robot_motion_simulation_apis=remote
machine_app_components=remote
vention_ros=remote

. ./config

echo "Restarting robot processes..."
echo "Using configs"
echo -e "\tmm_execution_engine: $mm_execution_engine"
echo -e "\trobot_components: $robot_components"
echo -e "\trobot_motion_simulation_apis: $robot_motion_simulation_apis"
echo -e "\tmachine_app_components: $machine_app_components"
echo -e "\tvention_ros: $vention_ros"

cd ~/Documents/vention_assembler/client
if [ -f .env ]
then
  rm .env
fi

cd ~/Documents/vention_assembler/client && npm i
cd ~/Documents/vention_assembler/client/vse && npm i
cd ~/Documents/robot-components && npm i
cd ~/Documents/robot-motion-simulation-apis && npm i
cd ~/Documents/machine-app-components && npm i

gnome-terminal --tab --title="rails" -- /bin/sh -c "bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/vention_rails_docker && ./docker/run.sh start_run_with_host_assembler ~/Documents/vention_assembler/client/dist/ 6g;'"

if [ "$mm_execution_engine" = "local" ]
then
  cd ~/Documents/vention_assembler/client
  printf 'EXECUTION_ENGINE_HOST=http://localhost:3100' >> .env

  gnome-terminal --tab --title="execution-engine" -- /bin/sh -c "bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/mm-execution-engine && npm run simulate-cad;'"
fi

if [ "$robot_components" = "local" ]
then
  gnome-terminal --tab --title="robot-components" -- /bin/sh -c "bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/scripts && bash npm-link-robot-components.sh && bash npm-build-robot-components.sh;'"
else
  . npm-unlink-robot-components.sh
fi

if [ "$robot_motion_simulation_apis" = "local" ]
then
  gnome-terminal --tab --title="robot-motion-simulation-apis" -- /bin/sh -c "bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/scripts && bash npm-link-robot-motion-simulation-apis.sh && bash npm-build-robot-motion-simulation-apis.sh;'"
else
  . npm-unlink-robot-motion-simulation-apis.sh
fi

if [ "$machine_app_components" = "local" ]
then
  gnome-terminal --tab --title="machine-app-components" -- /bin/sh -c "bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/scripts && bash npm-link-machine-app-components.sh && bash npm-build-machine-app-components.sh;'"
else
  . npm-unlink-machine-app-components.sh
fi

if [ "$vention_ros" = "local" ]
then
  cd ~/Documents/vention_assembler/client
  printf '\nVENTION_ROS_ENV=development' >> .env

  gnome-terminal --tab --title="ros" -- /bin/sh -c "bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/vention_ros/melodic && bash run-dev.sh;'"
fi

gnome-terminal --tab --title="assembler" -- /bin/sh -c "bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/vention_assembler/client && npm run dev;'"
