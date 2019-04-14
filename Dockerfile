FROM golang as builder

WORKDIR /go/src/github.com/apstndb/dmesg-server
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -v -o dmesg-server

FROM alpine

COPY --from=builder /go/src/github.com/apstndb/dmesg-server/dmesg-server /dmesg-server

ENV PORT 8080

CMD ["/dmesg-server"]
