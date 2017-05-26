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
    git \
    build-essential libmad0-dev libvorbis-dev libvo-aacenc-dev libfaad-dev libmpg123-dev

#RUN git clone https://github.com/ralph-irving/squeezelite.git
#WORKDIR squeezelite
# RUN ./configure
#RUN make
# RUN wget https://github.com/Hypfer/squeezelite-downloads/raw/master/squeezelite-x86-64
RUN wget https://downloads.sourceforge.net/project/lmsclients/squeezelite/linux/squeezelite-1.8.6-830-ubuntu-lts-x86_64.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Flmsclients%2Ffiles%2Fsqueezelite%2Flinux%2F&ts=1495800073&use_mirror=netcologne
RUN gunzip squeezelite-1.8.6-830-ubuntu-lts-x86_64.tar.gz

RUN chmod a+x squeezelite

CMD /squeezelite -o $SOUNDDEVICE -s $SERVER -n $CLIENTNAME -m $CLIENTMAC
