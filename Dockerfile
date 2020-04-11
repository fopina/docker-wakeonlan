FROM golang:1.14-alpine as builder

RUN apk add --no-cache git

RUN go get -d github.com/sabhiram/go-wol/cmd/wol

WORKDIR /go/src/github.com/sabhiram/go-wol/cmd/wol
RUN git checkout 1f746af28fd49f3542483a40f7e19828e4228dbb
RUN CGO_ENABLED=0 go build -ldflags="-w -s" -o /go/bin/wol

FROM scratch

COPY --from=builder /go/bin/wol /wol

# set USER env so wol doesn't try to use cgo
ENV USER=root

ENTRYPOINT [ "/wol" ]
