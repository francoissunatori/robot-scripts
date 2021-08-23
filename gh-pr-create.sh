#! /bin/bash

cd ~/Documents/vention_ros
gh pr create --base robot-simulation --reviewer peterkaniostos --reviewer aeciolevy --reviewer bethany-vention
cd ~/Documents/vention_assembler/client --reviewer peterkaniostos --reviewer aeciolevy --reviewer bethany-vention
gh pr create --base robot-simulation --reviewer peterkaniostos --reviewer aeciolevy --reviewer bethany-vention
cd ~/Documents/vention_assembler/client/vse
gh pr create --base robot-simulation --reviewer peterkaniostos --reviewer aeciolevy --reviewer bethany-vention
cd ~/Documents/mm-execution-engine
gh pr create --base robot-simulation --reviewer peterkaniostos --reviewer aeciolevy --reviewer bethany-vention
cd ~/Documents/robot-components
gh pr create --base robot-simulation --reviewer peterkaniostos --reviewer aeciolevy --reviewer bethany-vention
cd ~/Documents/machine-app-components
gh pr create --base robot-simulation --reviewer peterkaniostos --reviewer aeciolevy --reviewer bethany-vention

