FROM dev
LABEL maintainer="Jinye Wu <github@jinyewu.org>"

USER root
# Update system and install base dependencies
RUN pacman -Syyu --noconfirm && \
    pacman -S --noconfirm \
    arrow

# Clean package cache
RUN pacman -Scc --noconfirm

USER user
WORKDIR /workspace

# Set shell to fish
SHELL ["/bin/fish", "-c"]
