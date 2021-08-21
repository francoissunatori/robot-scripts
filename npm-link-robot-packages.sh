#! /bin/bash

cd ~/Documents/robot-components && \
npm i
if [ "$robot_components" = "local" ]
then
  npm link && \
  cd ~/Documents/vention_assembler/client/vse && \
  npm link @ventionco/robot-components
else
  cd ~/Documents/vention_assembler/client/vse && \
  npm unlink @visionco/robot-components
fi

cd ~/Documents/machine-app-components && \
npm i
if [ "$machine_app_components" = "local" ]
then
  npm link && \
  cd ~/Documents/vention_assembler/client && \
  npm link @ventionco/machine-app-components
else
  cd ~/Documents/vention_assembler/client && \
  npm unlink @visionco/machine-app-components
fi

cd ~/Documents/robot-motion-simulation-apis && \
npm i
if [ "$robot_motion_simulation_apis" = "local" ]
then
  npm link && \
  cd ~/Documents/vention_assembler/client && \
  npm link @ventionco/robot-motion-simulation-apis
else
  cd ~/Documents/vention_assembler/client && \
  npm unlink @visionco/robot-motion-simulation-apis
fi
