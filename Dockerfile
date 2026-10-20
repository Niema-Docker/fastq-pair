# Minimal Docker image for fastq-pair using Alpine base
FROM alpine:latest

# install fastq-pair
RUN apk update && \
    apk add --no-cache bash cmake g++ make musl-dev && \
    wget -qO- "https://github.com/linsalrob/fastq-pair/archive/refs/tags/v1.0.tar.gz" | tar -zx && \
    cd fastq-pair-* && \
    cmake . && \
    make && \
    make install && \
    cd .. && \
    rm -rf fastq-pair-*
