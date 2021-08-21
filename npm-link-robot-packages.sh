cd ../robot-components && \
npm i && \
npm link && \
cd ../machine-app-components && \
npm i && \
npm link && \
cd ../robot-motion-simulation-apis && \
npm i && \
npm link && \
cd ../vention_assembler/client && \
npm link @ventionco/robot-motion-simulation-apis && \
npm link @ventionco/machine-app-components && \
cd ./vse && \
npm link @ventionco/robot-components
