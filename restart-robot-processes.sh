gnome-terminal --tab --title="rails" -- bash -ic "cd ~/Documents/vention_rails_docker && ./docker/run.sh start_run_with_host_assembler ~/Documents/vention_assembler/client/dist/ 6g"

gnome-terminal --tab --title="assembler" -- bash -ic "cd ~/Documents/vention_assembler/client && npm run dev"

gnome-terminal --tab --title="execution-engine" -- bash -ic "cd ~/Documents/mm-execution-engine && npm run simulate-cad"

gnome-terminal --tab --title="robot-packages" -- bash -ic "cd ~/Documents/scripts && bash npm-link-robot-packages.sh && bash npm-build-robot-packages.sh"

