# Demo of using Docker multi-stage builds with Zeit pkg to build small node-based images

This repository contains a simple demo that shows how to use [Docker multi-stage builds](https://docs.docker.com/engine/userguide/eng-image/multistage-build/) and [Zeit pkg](https://github.com/zeit/pkg) to build small Node.js-based docker images.  
The app itself is a simple [Express.js](http://expressjs.com/) server with basic "Hello world!" repsonse on root path.  
Video explaining the details can be found [on Youtube](https://www.youtube.com/watch?v=KYqn-k1-YbQ).

## Requirements

The only requirement is Docker 17.05 or later.

## Building

1. Clone the repo
2. Execute `docker build -t docker-pkg-demo .`

## Running

1. Execute `docker run -it --rm -p 3000:3000 docker-pkg-demo`
2. Navigate to `http://localhost:3000` in your browser

## What does it do?

The build of the app is executed using new Docker multi-stage build feature.  
During the first build step:
  - `node:latest` image is used as a base,
  - app first installs all node dependencies using yarn,
  - app is then packaged into single binary using pkg.

During the second build step:
  - `alpine:latest` image is used as a base,
  - libs required for node.js to work on alpine are pre-installed,
  - binary from step 1 is copied into current build and is set as command to execute

For more details see comments in `Dockerfile` in this repo.

## License

[MIT](https://opensource.org/licenses/MIT)
