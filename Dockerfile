# work from latest LTS ubuntu release
FROM ubuntu:18.04

# run update and install necessary tools
RUN apt-get update -y && apt-get install -y \
    apt-utils \
    autoconf \
    build-essential \
    cmake \
    curl \
    git \
    libhdf5-dev \
    libhdf5-serial-dev \
    libnss-sss \
    hdf5-helpers \
    hdf5-tools \
    less \
    python \
    python3-pip \
    python-dev \
    vim \
    wget \
    zlib1g-dev \
    && rm -r /var/lib/apt/lists/*

RUN wget -O kallisto-0.44.0.tar.gz https://github.com/pachterlab/kallisto/releases/download/v0.44.0/kallisto_linux-v0.44.0.tar.gz \
    && tar xvfz kallisto-0.44.0.tar.gz \
    && cp /kallisto_linux-v0.44.0/kallisto /usr/local/bin/kallisto \
    && rm -fr /kallisto_linux-v0.44.0/* \

ENV PATH /usr/local/bin/:$PATH

RUN git clone https://github.com/betsig/how_are_we_stranded_here.git \
    && pip3 install git+https://github.com/betsig/how_are_we_stranded_here.git

CMD ["/bin/bash"]
