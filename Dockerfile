FROM fedora:latest

RUN dnf update -y && dnf upgrade -y
RUN dnf install -y cargo python

RUN cargo install mdbook
RUN cargo install mdbook-mermaid

ENV PATH="$PATH:/root/.cargo/bin"
RUN cp /root/.cargo/bin/mdbook /usr/bin
RUN cp /root/.cargo/bin/mdbook-mermaid /usr/bin

CMD ["/bin/bash"]
