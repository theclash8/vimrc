
FROM alpine:latest

MAINTAINER Luca Rossi <luca@acido.be>

RUN apk add --virtual build-deps --update \
        autoconf \
        automake \
        cmake \
        ncurses ncurses-dev ncurses-libs ncurses-terminfo \
        gcc \
        g++ \
        libtool \
        libuv \
        linux-headers \
        lua5.3-dev \
        m4 \
        unzip \
        libintl \
        openssl \
        gettext-dev \
        make 


RUN apk add --update \
        curl \
        git \
        nodejs \
        python3 \
        py-pip \
        python3-dev \
        python3-dev \
        python3 &&\
        python3 -m ensurepip && \
        rm -r /usr/lib/python*/ensurepip && \
        pip3 install --upgrade pip setuptools && \
        rm -r /root/.cache

ENV CMAKE_EXTRA_FLAGS=-DENABLE_JEMALLOC=OFF
WORKDIR /tmp

RUN git clone https://github.com/neovim/libtermkey.git && \
  cd libtermkey && \
  make && \
  make install && \
  cd ../ && rm -rf libtermkey

RUN git clone https://github.com/neovim/libvterm.git && \
  cd libvterm && \
  make && \
  make install && \
  cd ../ && rm -rf libvterm

RUN git clone https://github.com/neovim/unibilium.git && \
  cd unibilium && \
  make && \
  make install && \
  cd ../ && rm -rf unibilium

RUN curl -L https://github.com/neovim/neovim/archive/nightly.tar.gz | tar xz && \
  cd neovim-nightly && \
  make && \
  make install && \
  cd ../ && rm -rf neovim-nightly

# # Install neovim python support
RUN pip3 install neovim

ADD vimrc.local /vimrc.local
ADD vimrc.d /vimrc.d
RUN mkdir -p ${HOME}/.vim/bundle && \
  git -C ${HOME}/.vim/bundle clone https://github.com/VundleVim/Vundle.vim && \
  nvim -E -s -u /vimrc.local +PluginInstall +qall 



ENTRYPOINT nvim -u /vimrc.local /data
