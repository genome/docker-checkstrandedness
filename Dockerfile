FROM python:slim
LABEL \
    description="Check Strandedness tool for RNA-seq workflow"

RUN apt-get update -y && apt-get install -y \
    build-essential \
    bzip2 \
    cmake \
    git \
    libnss-sss \
    libtbb2 \
    libtbb-dev \
    ncurses-dev \
    nodejs \
    tzdata \
    unzip \
    wget \
    zlib1g \
    zlib1g-dev

RUN git clone https://github.com/betsig/how_are_we_stranded_here.git \
    && pip3 install git+https://github.com/betsig/how_are_we_stranded_here.git

ENTRYPOINT ["/bin/bash"]

