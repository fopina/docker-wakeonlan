FROM golang:1.14-alpine as builder

RUN apk add --no-cache git

RUN CGO_ENABLED=0 go get -ldflags="-w -s" github.com/sabhiram/go-wol/cmd/wol


FROM scratch

COPY --from=builder /go/bin/wol /wol

# set USER env so wol doesn't try to use cgo
ENV USER=root

ENTRYPOINT [ "/wol" ]
