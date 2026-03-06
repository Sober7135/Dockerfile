FROM archlinux/archlinux
LABEL maintainer="Sober7135 <github@jinyewu.org>"

RUN echo "Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist

# Update system and install base dependencies
RUN pacman -Syyu --noconfirm && \
    pacman -S --noconfirm \
    base-devel \
    git \
    curl \
    wget \
    vim \
    neovim \
    sudo \
    openssh \
    ca-certificates

# Install development tools
RUN pacman -S --noconfirm \
    python \
    nodejs \
    npm \
    go \
    jq \
    tmux \
    htop \
    tree \
    unzip \
    zip \
    fish \
    ninja \
    clang \
    lldb \
    gdb \
    perf \
    cmake \
    less \
    go

# Install useful tools
RUN pacman -S --noconfirm \
    ast-grep \
    github-cli \
    fd \
    ripgrep

RUN sudo npm install -g @openai/codex
RUN sudo npm install -g opencode-ai

RUN useradd -m -u 1000 -s /bin/fish user &&  echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to user for installations
USER user
WORKDIR /home/user

# Generate Codex completion for fish
RUN mkdir -p ~/.config/fish/completions && codex completion fish > ~/.config/fish/completions/codex.fish
RUN echo "alias codex=\"codex --dangerously-bypass-approvals-and-sandbox\"" >> ~/.config/fish/config.fish

# Install Rust as user
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/home/user/.cargo/bin:${PATH}"

# Switch back to root for system packages
USER root

# Clean package cache
RUN pacman -Scc --noconfirm

# Switch back to user
USER user

# Set working directory
WORKDIR /workspace

# Set shell to fish
SHELL ["/bin/fish", "-c"]
