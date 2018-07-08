FROM ubuntu:16.04

#RUN apk add --update --no-cache \
	#git \
	#lighttpd-mod_auth \
	#python \
	#&& rm -rf /var/cache/apk/*
ARG USER1=jeff
ARG UID1=2000
ARG GID1=2000

RUN apt update && apt install -y git bash gcc automake autoconf libgtk2.0-dev make xdotool
RUN git clone https://github.com/rickyrockrat/parcellite.git
WORKDIR parcellite
RUN apt install -y intltool
RUN groupadd -g $GID1 $USER1
RUN useradd -m $USER1 -g $GID1 -u $UID1
COPY preferences.c src/
COPY main.c src/
RUN ./autogen.sh && \
	./configure && \
	make && \
	make install
#RUN rm -rf /parcellite && \
	#	apt remove -y git gcc automake autoconf libgtk2.0-dev make intltool && \
	#apt clean


USER $UID1:$GID1
WORKDIR /home/$USER1
RUN mkdir -p ~/.config/parcellite ~/.local/share/parcellite
CMD ["/usr/local/bin/parcellite"]
