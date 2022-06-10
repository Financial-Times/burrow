FROM coco/burrow:v3.0.4

FROM alpine:3.16.0

WORKDIR /

COPY --from=0 /go/Burrow /Burrow
COPY --from=0 /launch-burrow.sh /launch-burrow.sh
COPY --from=0 /config/burrow.cfg /config/burrow.cfg
COPY --from=0 /config/logging.cfg /config/logging.cfg

CMD [ "/launch-burrow.sh" ]