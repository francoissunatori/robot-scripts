gnome-terminal --tab --title="rails" --command="bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/vention_rails_docker && ./docker/run.sh start_run_with_host_assembler ~/Documents/vention_assembler/client/dist/ 6g;'"

gnome-terminal --tab --title="assembler" --command="bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/vention_assembler/client && npm run dev;'"

gnome-terminal --tab --title="execution-engine" --command="bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/mm-execution-engine && npm run simulate-cad;'"

gnome-terminal --tab --title="robot-packages" --command="bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/scripts && bash npm-link-robot-packages.sh && bash npm-build-robot-packages.sh;'"

gnome-terminal --tab --title="ros" --command="bash -c 'endstart() { exec bash; }; trap endstart INT; cd ~/Documents/vention_ros/melodic && bash run-dev.sh;'"

