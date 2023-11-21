FROM archlinux:latest AS sober_dev
LABEL maintainer "Sober7135 <soberwu@outlook.com>"

RUN pacman -Syu --needed --debug --noconfirm git base-devel

RUN pacman -Syu --needed --noconfirm make \
    cmake \
    bison \ 
    flex \ 
    neovim \ 
    gdb \ 
    gcc \
    wget \
    curl \ 
    valgrind \ 
    python \ 
    fish \
    go \
    && chsh -s /bin/fish 

# Create a non-root user to build packages with makepkg
RUN useradd -m builder \
    && echo "builder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builder

# Switch to the non-root user
USER builder
WORKDIR /home/builder

# install yay
RUN git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm 
RUN yay -Syu --noconfirm clang-git \
    llvm-libs-git  \ 
    llvm-git 

USER root
WORKDIR /root
RUN pacman -Scc --noconfirm
RUN rm -rf /home/builder