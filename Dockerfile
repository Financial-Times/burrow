FROM golang:1.9-alpine

ENV DEP_VERSION="0.3.2"
RUN apk add --no-cache git curl && \
    curl -L -s https://github.com/golang/dep/releases/download/v${DEP_VERSION}/dep-linux-amd64 -o $GOPATH/bin/dep && \
    chmod +x $GOPATH/bin/dep && \
    mkdir -p $GOPATH/src/github.com/linkedin/Burrow

RUN cd $GOPATH/src/github.com/linkedin && \
    git clone https://github.com/linkedin/Burrow.git && \
    cd Burrow && \
    git checkout v1.1.0 && \
    dep ensure && \
    go build -o /tmp/burrow .

FROM iron/go
MAINTAINER LinkedIn Burrow "https://github.com/linkedin/Burrow"

WORKDIR /app
COPY --from=0 /tmp/burrow /app/
CMD ["/app/burrow", "--config-dir", "/etc/burrow"]
