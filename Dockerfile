FROM ubuntu:latest

RUN apt-get update && apt install -y git make gcc libgmp-dev wget
RUN mkdir -p /home/work/binary-package

WORKDIR /home/work/binary-package
RUN wget https://sourceforge.net/projects/mlton/files/mlton/20210117/mlton-20210117-1.amd64-linux-glibc2.31.tgz && \
    tar xvzf mlton-20210117-1.amd64-linux-glibc2.31.tgz && \
    cd /home/work/binary-package/mlton-20210117-1.amd64-linux-glibc2.31 && make install

    # ln -s /home/work/binary-package/mlton-20210117-1.amd64-linux-glibc2.31/bin/mlton /usr/local/bin/mlton && \
    # ln -s /home/work/binary-package/mlton-20210117-1.amd64-linux-glibc2.31/lib/mlton /usr/local/lib/mlton

# # In case we want to build a fresher mlton we could do:
# WORKDIR /home/work
# RUN git clone https://github.com/MLton/mlton
# RUN cd mlton && make all
