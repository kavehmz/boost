FROM golang:1 AS build

ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GOROOT_FINAL=/
# RUN go get -u github.com/odeke-em/drive/cmd/drive
RUN go get -u -v github.com/odeke-em/drive/drive-google

RUN whereis drive-google

FROM debian

RUN apt-get update
RUN apt-get install -y sudo ca-certificates

RUN useradd -u 1000 kaveh

COPY --from=build /go/bin/drive-google /bin/drive-google
ADD entrypoint.sh /

WORKDIR /gdrive

ENTRYPOINT [ "/entrypoint.sh" ]