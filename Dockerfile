FROM golang
COPY . /go/src/github.com/kashyaprajan11/rambler
WORKDIR /go/src/github.com/kashyaprajan11/rambler
RUN go get ./...
RUN go build -ldflags="-s -linkmode external -extldflags -static -w"

FROM scratch
MAINTAINER Romain Baugue <romain.baugue@kashyaprajan11.com>
COPY --from=0 /go/src/github.com/kashyaprajan11/rambler/rambler /
CMD ["/rambler", "apply", "-a"]
