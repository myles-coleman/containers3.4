#alpine base image
FROM alpine:3.19

#update and install stuff
RUN apk update && apk upgrade \
    && apk add curl jq && apk add sudo

#creates user GHA with no password and adds to sudoers
RUN adduser -D GHA && mkdir -p /etc/sudoers.d \
    && echo "GHA ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/GHA \
    && chmod 0440 /etc/sudoers.d/GHA

#switch to user GHA
USER GHA

#install runner
RUN sudo curl -O -L https://github.com/actions/runner/releases/download/v2.312.0/actions-runner-linux-arm64-2.312.0.tar.gz \
    && sudo tar xzf ./actions-runner-linux-arm64-2.312.0.tar.gz \
    && sudo rm -f ./actions-runner-linux-arm64-2.312.0.tar.gz

