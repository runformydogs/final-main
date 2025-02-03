FROM golang:1.21 as builder

WORKDIR /app
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o /parcel-tracker

FROM alpine:latest
COPY --from=builder /parcel-tracker /parcel-tracker
ENTRYPOINT ["/parcel-tracker"]