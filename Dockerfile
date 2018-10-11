FROM golang:1.10-alpine

ADD config/burrow.cfg /config/burrow.cfg
ADD config/logging.cfg /config/logging.cfg
ADD launch-burrow.sh /launch-burrow.sh

RUN apk update \
  && apk add git bash\
  && wget https://raw.githubusercontent.com/pote/gpm/v1.4.0/bin/gpm && chmod +x gpm \
  && export GOPATH=/gopath \
  && mkdir -p $GOPATH/src/github.com/linkedin/ \
  && cd $GOPATH/src/github.com/linkedin/ \
  && git clone https://github.com/linkedin/Burrow.git \
  && cd Burrow \
  && git checkout v0.1.1 \
  && /go/gpm install \
  && go install \
  && mv $GOPATH/bin/Burrow /go \
  && apk del go git bzr \
  && rm -rf $GOPATH /var/cache/apk/* /gpm \
  && touch /burrow.out \
  && ln -sf /proc/1/fd/1 /burrow.out
  
CMD [ "/launch-burrow.sh" ]