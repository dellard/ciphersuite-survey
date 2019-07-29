# ciphersuite-survey

Scripts to scan through web sites to check which
ciphersuites they support or will select to use
with popular browsers

## Set up

These scripts use OpenSSL to mimic the ciphersuite lists
sent by different browsers.  Depending on which version
of OpenSSL (or similar) you have installed on your system,
your version of OpenSSL might not support all of the necessary
ciphers.  In this case, the first step is to install a
more recent version.

For my own experiments, I use BoringSSL on Linux.
I currently use version 1.1.1b, but I update this
regularly.

Using BoringSSL on my system requires setting my
`LD_LIBRARY_PATH` to the path to where I
installed BoringSSL, and then setting `SSL`
to the path to the `openssl` executable.
I usually do this in `$HOME/BS/`; change the
commands below to reflect your own choices:

```
export LD_LIBRARY_PATH=$HOME/BS/openssl-1.1.1b
export SSL=$HOME/BS/openssl-1.1.1b/apps/openssl
```
