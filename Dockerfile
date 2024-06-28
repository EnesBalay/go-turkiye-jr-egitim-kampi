FROM golang:1.22.2-alpine3.19 as builder

WORKDIR /app

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=arm64

COPY . .

RUN go build main.go

FROM gcr.io/distroless/static-debian11

COPY --from=builder /app /app

CMD [ "./app/main" ]