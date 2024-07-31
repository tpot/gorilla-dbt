FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y git python3-full pipx

USER ubuntu
WORKDIR /home/ubuntu

ENV PATH="${PATH}:/home/ubuntu/.local/bin:/home/ubuntu/.venv/bin"

RUN pipx install uv
RUN uv venv
RUN uv pip install dbt-core dbt-duckdb
