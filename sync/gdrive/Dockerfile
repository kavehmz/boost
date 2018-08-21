FROM golang:1 AS build

ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GOROOT_FINAL=/
RUN mkdir -p $GOPATH/src/github.com/odeke-em
RUN git clone https://github.com/kmzfs/drive.git $GOPATH/src/github.com/odeke-em/drive
WORKDIR $GOPATH/src/github.com/odeke-em/drive
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GOROOT_FINAL=/ go build -o /go/bin/drive-google drive-google/main.go

FROM debian

RUN apt-get update
RUN apt-get install -y sudo ca-certificates
RUN useradd -u 1000 kaveh
COPY --from=build /go/bin/drive-google /bin/drive-google
ADD entrypoint.sh /
WORKDIR /gdrive
ENTRYPOINT [ "/entrypoint.sh" ]