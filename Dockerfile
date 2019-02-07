FROM alpine:edge

MAINTAINER gizmoh1683

ENV DEBIAN_FRONTEND noninteractive
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update && apk add \
    usbutils \
    flac-dev \
    faad2  \
    libmad \
    alsa-lib-dev \
    wget \
    git \
    g++ make libvorbis faad2-dev libmad-dev libvorbis-dev fdk-aac mpg123-dev

#WORKDIR /opt
RUN git clone https://github.com/ralph-irving/squeezelite.git
WORKDIR squeezelite
# RUN ./configure
RUN make
# RUN wget https://github.com/Hypfer/squeezelite-downloads/raw/master/squeezelite-x86-64

#COPY squeezelite/squeezelite /opt/
#WORKDIR /opt
#RUN ls -la
RUN chmod a+x squeezelite

CMD /squeezelite -o $SOUNDDEVICE -s $SERVER -n $CLIENTNAME -m $CLIENTMAC
