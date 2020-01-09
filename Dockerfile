# stage 1: builder
FROM golang:1.13-alpine as builder

ENV PROJECT Burrow
ENV LATEST_VERIFIED_COMMIT ce211532b6fe3b65018af748ac6ea9706889cea9

WORKDIR /${PROJECT}

# Use latest commit at the time of writing this
RUN wget https://github.com/linkedin/Burrow/archive/${LATEST_VERIFIED_COMMIT}.tar.gz && \
  tar -xzf ${LATEST_VERIFIED_COMMIT}.tar.gz --strip 1 && \
  go build -o /artifacts/${PROJECT}

# stage 2: runner
FROM alpine:3.10

COPY --from=builder /artifacts/* /
COPY config/burrow.toml /config/
COPY launch-burrow.sh /launch-burrow.sh
  
CMD [ "/launch-burrow.sh" ]
