FROM golang:1.18-bullseye AS builder

WORKDIR /go/src/github.com/BikutaDesu/fc-go-hello-world

COPY . .

RUN go build -o fullcycle

FROM scratch

WORKDIR /

COPY --from=builder /go/src/github.com/BikutaDesu/fc-go-hello-world/fullcycle /usr/local/bin/fullcycle


ENTRYPOINT [ "fullcycle" ]