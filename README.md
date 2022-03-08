# Vue CI Build Environment

Build/dev environment for Vue.js.

## Developer instructions

### To build dockerfile locally 

`docker build -t hack-app-web .`

### To run the dockerfile and open a bash prompt

Code in the ./src dir will be in /src with the example volume mount.

`docker run -v $PWD/src/:/src -it node-test /bin/bash`