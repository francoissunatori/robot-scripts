#! /bin/bash

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
cd ~/Documents/scripts

gnome-terminal --tab --title="rails" --command="bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/vention_rails_docker && ./docker/run.sh start_run_with_host_assembler ~/Documents/vention_assembler/client/dist/ 6g;'"

if [ "$mm_execution_engine" = "local" ]
then
  cd ~/Documents/vention_assembler/client
  printf 'EXECUTION_ENGINE_HOST=http://localhost:3100' >> .env
  cd ~/Documents/scripts

  gnome-terminal --tab --title="execution-engine" --command="bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/mm-execution-engine && npm run simulate-cad;'"
fi

gnome-terminal --tab --title="robot-packages" --command="bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/scripts && bash npm-link-robot-packages.sh && bash npm-build-robot-packages.sh;'"

if [ "$vention_ros" = "local" ]
then
  cd ~/Documents/vention_assembler/client
  printf '\nVENTION_ROS_ENV=development' >> .env
  cd ~/Documents/scripts

  gnome-terminal --tab --title="ros" --command="bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/vention_ros/melodic && bash run-dev.sh;'"
fi

gnome-terminal --tab --title="assembler" --command="bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/vention_assembler/client && npm run dev;'"
