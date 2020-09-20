FROM alpine:3.12 AS build

RUN apk --no-cache add go

ADD . /go/src/hello-world
WORKDIR /go/src/hello-world

ENV GOROOT /usr/lib/go
ENV GOPATH /go

RUN go build

FROM alpine:3.12

COPY --from=build /go/src/hello-world/hello-world /usr/bin/hello-world

EXPOSE 8080

CMD [ "/usr/bin/hello-world" ]