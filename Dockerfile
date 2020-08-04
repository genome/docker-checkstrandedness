# work from latest LTS ubuntu release
FROM ubuntu:18.04

# run update and install necessary tools
RUN apt-get update -y && apt-get install -y \
    build-essential \
    cmake \
    zlib1g-dev \
    libhdf5-dev \
    libnss-sss \
    curl \
    autoconf \
    vim \
    less \
    wget

RUN apt-get update && apt-get install -y wget \
    && wget -O kallisto-0.44.0.tar.gz https://github.com/pachterlab/kallisto/releases/download/v0.44.0/kallisto_linux-v0.44.0.tar.gz \
    && tar xvfz kallisto-0.44.0.tar.gz \
    && cp /kallisto_linux-v0.44.0/kallisto /usr/local/bin/kallisto \
    && rm -fr /kallisto_linux-v0.44.0/* \
    && rm -r /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/kallisto"]

RUN apt-get update  && apt-get install -y \
		build-essential \
		cmake \
		python \
		python3-pip \
		python-dev \
		hdf5-tools \
		libhdf5-dev \
		hdf5-helpers \
		libhdf5-serial-dev \
		git \
		apt-utils

RUN git clone https://github.com/betsig/how_are_we_stranded_here.git \
    && pip3 install git+https://github.com/betsig/how_are_we_stranded_here.git

ENTRYPOINT ["/bin/bash"]
