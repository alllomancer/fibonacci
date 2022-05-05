FROM golang:1.18  AS builder
WORKDIR /go/src/github.com/alllomancer/fibonacci
ADD . /go/src/github.com/alllomancer/fibonacci
RUN cd /go/src/github.com/alllomancer/fibonacci

RUN go test .
RUN go build -o /app/fibonacci .
RUN chmod +x /go/src/github.com/alllomancer/fibonacci/ldd-cp.sh
RUN /go/src/github.com/alllomancer/fibonacci/ldd-cp.sh ldd-cp  /app/fibonacci /temp


# Create a small image
FROM busybox AS default-image

COPY --from=builder /temp/ /
CMD /app/fibonacci