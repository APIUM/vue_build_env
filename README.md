# Vue CI Build Environment

Build/dev environment for Vue.js.

## Developer instructions

### To build dockerfile locally 

`docker build -t hack-app-web .`

### To run the dockerfile and open a bash prompt

Code in the ./src dir will be in /src with the example volume mount.

`docker run -v $PWD/src/:/src -it node-test /bin/bash`

### To pull this container 

1. Create a github personal access token
2. Login to the contianer repository

```
GHPAT=PASTE_TOKEN_HERE
echo $GHPAT | docker login ghcr.io -u USERNAME --password-stdin
```
3. Pull image
`docker pull ghcr.io/apium/vue_build_env:latest`