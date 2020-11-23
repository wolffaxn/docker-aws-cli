# docker-aws-cli

[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/wolffaxn/docker-aws-cli/master.svg)](https://github.com/wolffaxn/docker-aws-cli)

> Docker image with AWS CLI installed.

# Setup

You'll need `docker` on your machine, as well as the `git` command.

Start a shell and clone this repository.

```
git clone https://github.com/wolffaxn/docker-aws-cli.git
cd docker-aws-cli
```

Start docker if not already running.

```
docker-machine start default
eval $(docker-machine env)
```

# Build and run all images using the docker command

## Set environment variables

To enable BuildKit build set the DOCKER_BUILDKIT=1 environment variable when invoking the docker build command.

```
export DOCKER_BUILDKIT=1
```
## Build (using Makefile)

Run this command to build all docker images.

```
make
```

## Run (using docker command)

Now run the new image and show `go` version.

```
❯ docker run --rm -it wolffaxn/aws-cli:1.18.183 aws --version
aws-cli/1.18.183 Python/3.9.0 Linux/4.19.130-boot2docker botocore/1.19.23

```

## License

Released under the MIT License. See [license](LICENSE.md) for details.
