FROM golang:1.20.1-alpine as builder

WORKDIR /src

COPY index.go .

RUN go build -ldflags="-w -s" -a -o index index.go

FROM scratch

COPY --from=builder /src .

CMD [ "./index" ]