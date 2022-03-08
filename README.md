# HackApp Web Interface

Vue web interface for HackApp. 

## Developer instructions

### To build dockerfile locally 

`docker build -t hack-app-web .`

### To run the dockerfile and open a bash prompt

Code will be in /src

`docker run -v $PWD/src/:/src -it node-test /bin/bash`