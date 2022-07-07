FROM golang:1.18 AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build ./app.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder usr/src/app .

CMD ["/usr/src/app/app"]