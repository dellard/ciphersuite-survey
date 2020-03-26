#!/bin/sh

# Copyright 2020 Raytheon BBN Technologies Corp.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Choose the tag/hashtag/branch of openssl you want to build.
# At the time this was written, the best way to get all TLS1.3
# features and ciphersuites was to build the tip of master, but
# for reproducible experiments you SHOULD use a tag.
#
OPENSSL_BRANCH=master

check_os() {
    # Make sure we're on Ubuntu: this is not known to be portable
    #
    if ! which lsb_release > /dev/null; then
	echo "ERROR: $0 requires Ubuntu"
	exit 1
    elif [ $(lsb_release -is) != "Ubuntu" ]; then
	echo "ERROR: $0 requires Ubuntu"
	exit 1
    fi
}

build_openssl() {
    sudo apt install build-essential autoconf libtool
    if [ $? -ne 0 ]; then
	echo "ERROR: $0 could not install prereqs"
	exit 1
    fi

    git clone git://git.openssl.org/openssl.git
    if [ $? -ne 0 ]; then
	echo "ERROR: $0 could not clone openssl"
	exit 1
    fi

    # Make sure all dependencies are installed
    # (there are probably others, but these are
    # the ones I needed to add when I did this)
    #
    (cd openssl ; git checkout "${OPENSSL_BRANCH}" && ./config && make)
    if [ $? -ne 0 ]; then
	echo "ERROR: $0 could not build openssl $OPENSSL_BRANCH"
	exit 1
    fi
}

check_os

cd "$(readlink -f $(dirname $(/usr/bin/which ${0})))"

build_openssl

exit $?
