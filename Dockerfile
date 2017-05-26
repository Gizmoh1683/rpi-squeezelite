FROM debian:jessie

MAINTAINER gizmoh1683

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    usbutils \
    libflac-dev \
    libfaad2  \
    libmad0 \
    libasound2-dev \
    libasound2 \
    libasound2-data \
    wget \
    git

RUN git clone https://github.com/ralph-irving/squeezelite.git
RUN cd squeezelite
# RUN ./configure
RUN ./make
RUN ./make install
# RUN wget https://github.com/Hypfer/squeezelite-downloads/raw/master/squeezelite-x86-64

# RUN chmod a+x squeezelite-x86-64

# CMD /squeezelite-x86-64 -o $SOUNDDEVICE -s $SERVER -n $CLIENTNAME -m $CLIENTMAC
