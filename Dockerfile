FROM alpine:edge

MAINTAINER gizmoh1683

ENV DEBIAN_FRONTEND noninteractive

RUN apk update && apk add \
    usbutils \
    flac-dev \
    faad2  \
    libmad \
    alsa-lib-dev \
    wget \
    git \
    g++ make libvorbis fdk-aac-dev mpg123-dev

#WORKDIR /opt
RUN git clone https://github.com/ralph-irving/squeezelite.git
WORKDIR squeezelite
# RUN ./configure
RUN make
# RUN wget https://github.com/Hypfer/squeezelite-downloads/raw/master/squeezelite-x86-64

#COPY squeezelite/squeezelite /opt/
#WORKDIR /opt
RUN chmod a+x squeezelite-x86-64

CMD /squeezelite-x86-64 -o $SOUNDDEVICE -s $SERVER -n $CLIENTNAME -m $CLIENTMAC
