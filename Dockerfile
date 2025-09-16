FROM fedora:latest AS builder

RUN dnf update -y && dnf upgrade -y
RUN dnf install -y cargo python

RUN cargo install mdbook
RUN cargo install mdbook-mermaid


FROM fedora:latest

COPY --from=builder /root/.cargo/bin/mdbook /usr/local/bin/mdbook
COPY --from=builder /root/.cargo/bin/mdbook-mermaid /usr/local/bin/mdbook-mermaid
ENV PATH="$PATH:/usr/local/bin"

CMD ["/bin/bash"]
