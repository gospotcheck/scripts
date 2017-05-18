#!/bin/bash
# Install the Gecko WebDriver https://github.com/mozilla/geckodriver
#
# Add at least the following environment variables to your project configuration
# (otherwise the defaults below will be used).
# * GECKODRIVER_VERSION
# * GECKODRIVER_HOST
# * GECKODRIVER_TARGET
#
# Include in your builds via
# \curl -sSL https://github.com/nickgsc/scripts/tree/master/packages/geckodriver.sh | bash -s
GECKODRIVER_VERSION=${GECKODRIVER_VERSION:="0.16.1"}
GECKODRIVER_HOST=${GECKODRIVER_HOST:="https://s3.amazonaws.com/gospotcheck-ci"}
CACHE_DIR="${HOME}/cache"
TARGET_DIR=${GECKODRIVER_TARGET:="/usr/local/bin"}
FILENAME="geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz"

# fail the script on the first failing command.
set -e
CACHED_DOWNLOAD="${CACHE_DIR}/${FILENAME}"

mkdir -p "${CACHE_DIR}"
wget --continue --output-document "${CACHED_DOWNLOAD}" "${GECKODRIVER_HOST}/geckodriver/${FILENAME}"
sudo tar -xzvf "${CACHED_DOWNLOAD}" --directory "${TARGET_DIR}"
