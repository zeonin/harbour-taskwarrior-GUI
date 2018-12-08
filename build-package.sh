#!/usr/bin/env bash

# $1: Sailfish OS version
SAILFISH_VERSION=${1:-3.0.0.8}

# Error immediately
set -e

# Perform some inception. If this script is called with the environment variable $DOCKER_BUILDER not
# set to true, invoke this script inside a builder docker container. Otherwise, it runs 

if [[ $DOCKER_BUILDER == "true" ]]; then
    # Copy the source to a build directory
    cp -r /src ~/build

    # Change to the project directory
    cd ~/build

    # Set up dependencies
    sb2 -t SailfishOS-${SAILFISH_VERSION}-armv7hl -m sdk-install -R zypper --non-interactive in cmake libuuid-devel gnutls-devel

    # Build application
    mb2 -t SailfishOS-${SAILFISH_VERSION}-armv7hl build

    su -c "cp -r /home/nemo/build/RPMS /src"

    su -c "chown -R ${USER_ID}:${GROUP_ID} /src/RPMS"
else
    # Get the user id and groups
    user_id=$(id -u)
    group_id=$(id -g)

    # Re invoke this script inside the docker builder container
    docker run -it --rm -e USER_ID=${user_id} -e GROUP_ID=${group_id} -e DOCKER_BUILDER=true -v $(pwd):/src coderus/sailfishos-platform-sdk /bin/bash /src/build-package.sh ${SAILFISH_VERSION}
fi

