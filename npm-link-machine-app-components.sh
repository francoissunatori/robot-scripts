#! /bin/bash

cd ~/Documents/machine-app-components && npm i && npm link
cd ~/Documents/vention_assembler/client && npm link @ventionco/machine-app-components
