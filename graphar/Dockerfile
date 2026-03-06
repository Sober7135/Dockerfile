FROM ubuntu:24.04

RUN apt-get update && 				\
    apt-get install -y --no-install-recommends 	\
      build-essential         			\
      cmake                   			\
      curl                    			\
      wget 					\
      git ca-certificates   		      	\
      lsb-release                               \
      clang clangd clang-format vim less fish clang-tidy

RUN wget https://apache.jfrog.io/artifactory/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb    \
    && apt-get install -y ./apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb                                                                        \
    && apt-get update                                                                                                                                                   \
    && apt-get install -y                                                                                                                                               \
        libarrow-dev                                                                                                                                                    \
        libarrow-dataset-dev                                                                                                                                            \
        libarrow-acero-dev                                                                                                                                              \
        libparquet-dev                                                                                                                                                  \
        libarrow-compute-dev                                                                                                                                            \
        libboost-graph-dev

RUN apt-get install -y --no-install-recommends 	\
    npm

# install github cli
RUN (type -p wget >/dev/null || (apt update && apt install wget -y)) \
	&& mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& apt update \
	&& apt install gh -y

RUN npm i -g opencode-ai
RUN npm i -g @openai/codex

RUN apt-get clean -y &&  				            \
    rm -rf /var/lib/apt/lists/* ./apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb

USER ubuntu
# install rust toolchain
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

WORKDIR /workspace
