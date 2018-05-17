FROM alpine:latest
WORKDIR /app
ENV NODE_ENV=production

RUN apk update && apk add --no-cache libstdc++ libgcc
EXPOSE 3000
COPY . /app/app
CMD ["/app/app"]
