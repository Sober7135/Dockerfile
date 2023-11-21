FROM archlinux/archlinux
LABEL maintainer "Sober7135 <soberwu@outlook.com>"

RUN echo -e 'Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
RUN echo -e '[archlinuxcn]\n\
  Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch'\
  >> /etc/pacman.conf
RUN pacman-key --init \
  && pacman-key --populate archlinux 
RUN pacman -Syyu --noconfirm \
  && pacman -S --noconfirm archlinuxcn-keyring
RUN pacman -S  --noconfirm git \
  base-devel \ 
  wget \
  cmake \
  neovim \ 
  gdb \ 
  valgrind \ 
  python \ 
  fish 
# packages in Arch Linux CN
RUN pacman -S --noconfirm clang-git llvm-git
RUN pacman -Scc --noconfirm