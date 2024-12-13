FROM alpine
USER root
RUN apk update
RUN apk add \
    build-base \
    cmake \
    git \
    pkgconfig \
    python3 \
    python3-dev \
    py-pip \
    portmidi-dev \
    sdl2 \
    sdl2_image-dev \
    sdl2_mixer-dev \
    sdl2_ttf-dev

RUN mkdir -p /opt/local/src
COPY . /opt/local/src
WORKDIR /opt/local/src

RUN python3 -m venv ~/.virtualenv \
    && . ~/.virtualenv/bin/activate \
    && pip install \
        -r requirements-dev.txt \
        -r requirements-test.txt \
        -r requirements.txt

CMD . ~/.virtualenv/bin/activate && cd build/web && python3 -m http.server

# FROM alpine
# USER root
# COPY --from=0