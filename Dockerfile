FROM ubuntu:latest

# This is a dockerfile meant to be suitable for CI tests for the Twelf
# logical framework (http://twelf.org) Mainly this means making sure
# the SML compiler mlton is installed.

RUN apt-get update && apt install -y git make gcc libgmp-dev wget time
RUN mkdir -p /home/work/binary-package

WORKDIR /home/work/binary-package
RUN wget https://sourceforge.net/projects/mlton/files/mlton/20210117/mlton-20210117-1.amd64-linux-glibc2.31.tgz && \
    tar xvzf mlton-20210117-1.amd64-linux-glibc2.31.tgz && \
    cd /home/work/binary-package/mlton-20210117-1.amd64-linux-glibc2.31 && make install

# Twelf tests use svnversion to query current svn revision.
# Use git hash instead.
COPY git-based-svnversion.sh /usr/local/bin/svnversion
