FROM golang:1.12.0-alpine3.9 AS builder 
 
# RUN apk add --no-cache git
RUN apk add git
 
ENV GO111MODULE=on
 
ENV PORT=9091
 
WORKDIR /helloword
 
COPY go.mod .
 
COPY go.sum .
 
RUN go mod download
 
COPY . .
 
RUN go build

# build stage 
FROM alpine
WORKDIR /root

COPY --from=builder helloword/Docker_multistage_build .

CMD ["./Docker_multistage_build"]
