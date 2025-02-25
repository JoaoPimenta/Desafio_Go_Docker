FROM golang:1.20 AS builder

WORKDIR /app

COPY main.go .


RUN go build -ldflags="-s -w" -o fullcycle main.go

FROM scratch


COPY --from=builder /app/fullcycle /fullcycle


ENTRYPOINT ["/fullcycle"]
