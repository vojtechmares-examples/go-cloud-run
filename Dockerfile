FROM golang:1.23-alpine AS builder

WORKDIR /build

COPY go.* ./
RUN go mod download

COPY . ./

RUN go build -v -o server

FROM alpine AS app

RUN apk add --no-cache ca-certificates

COPY --from=builder /build/server /app/server

CMD ["/app/server"]

# [END run_helloworld_dockerfile]
# [END cloudrun_helloworld_dockerfile]
