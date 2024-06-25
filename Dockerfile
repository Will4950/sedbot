FROM ubuntu:22.04 AS base

#  Install Dependencies
RUN apt-get update  \
    && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y \
    build-essential ca-certificates cmake curl gdb git libcurl4-openssl-dev libdbus-1-3 \
    libgbm1 libgl1-mesa-glx libglib2.0-0 libglib2.0-dev libssl-dev \
    pkgconf tar unzip zip alsa alsa-utils alsa-oss pulseaudio pulseaudio-utils \
    libx11-xcb1 libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-shape0 libxcb-shm0 libxcb-xfixes0 libxcb-xtest0 libxfixes3 \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev libasound2 libasound2-plugins \
    gstreamer1.0-libav  gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl \
    gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio \
    gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-tools gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly  

WORKDIR /opt

FROM base AS deps

COPY zoomsdk/*.so /usr/lib/
RUN ln -s /usr/lib/libmeetingsdk.so /usr/lib/libmeetingsdk.so.1
COPY zoomsdk/qt_libs/Qt/lib/** /usr/lib/
COPY bin/carl /opt/bin/carl
ENTRYPOINT ["/opt/bin/carl"]

