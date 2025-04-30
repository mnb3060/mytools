FROM chialab/php:7.4-apache
ENV GO_VERSION=1.24.2

RUN apt update && apt install -y wget

RUN wget -P /tmp "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz"
#RUN wget -P /tmp "https://dl2.soft98.ir/soft/g/go${GO_VERSION}.linux-amd64.tar.gz"

RUN tar -C /usr/local -xzf "/tmp/go${GO_VERSION}.linux-amd64.tar.gz"
RUN rm "/tmp/go${GO_VERSION}.linux-amd64.tar.gz"

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
