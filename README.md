# ciphersuite-survey

Scripts to scan through web sites to check which ciphersuites they
support or will select to use with popular browsers

## Set up

These scripts use OpenSSL to mimic the ciphersuite lists sent by
different browsers.  Depending on which version of OpenSSL (or similar)
you have installed on your system, your version of OpenSSL might not
support all of the necessary ciphers.  In this case, the first step is
to install a more recent version.

The script ./build-world.sh clones openssl from github, and builds the
most recent master (unless you specify another branch, tag, or hashtag
by editing build-world.sh) in a subdirectory of this directory.

Before running the survey scripts, you need to define the shell variable
SSL to the path of the openssl executable to use, and make sure that the
path of the directory containing the libssl.so that you want this
openssl to use is first in your LD_LIBRARY_PATH.  In the simplest case:

```
export LD_LIBRARY_PATH=$(pwd)/openssl
export SSL=$(pwd)/openssl/apps/openssl
```
