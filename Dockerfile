FROM dceoy/kallisto

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

