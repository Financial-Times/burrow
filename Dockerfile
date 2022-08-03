FROM alpine:3.16.0

ADD config/burrow.toml /config/burrow.toml
ADD config/logging.toml /config/logging.toml
ADD launch-burrow.sh /launch-burrow.sh

RUN apk update \
  && apk add git bash\
  && apk add go \
  && export GOPATH=/gopath \
  && mkdir -p $GOPATH/src/github.com/linkedin/ \
  && cd $GOPATH/src/github.com/linkedin/ \
  && git clone https://github.com/linkedin/Burrow.git \
  && cd Burrow \
  && git checkout v1.3.0 \
  && go mod tidy \
  && go install \
  && go build -o /Burrow \
  && mv $GOPATH/bin/Burrow /go \
  && apk del go git bzr \
  && rm -rf $GOPATH /var/cache/apk/* /gpm \
  && touch /burrow.out \
  && ln -sf /proc/1/fd/1 /burrow.out

CMD [ "/launch-burrow.sh" ]