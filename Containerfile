FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates curl git jq ripgrep unzip less \
        build-essential python3 python3-pip python3-venv \
        nodejs npm \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://opencode.ai/install | bash \
    && cp "$(find /root -name opencode -type f | head -n1)" /usr/local/bin/opencode

COPY AGENTS.md /etc/opencode/AGENTS.md
ENV OPENCODE_CONFIG_CONTENT='{"instructions":["/etc/opencode/AGENTS.md"]}'

RUN useradd -m -u 1000 dev
USER dev
RUN mkdir -p /home/dev/.config/opencode /home/dev/.local/share/opencode /home/dev/.local/state
ENV HOME=/home/dev

CMD ["opencode"]
