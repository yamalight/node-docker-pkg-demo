FROM alpine:latest
WORKDIR /app
ENV NODE_ENV=production

RUN apk update && apk add --no-cache libstdc++ libgcc
EXPOSE 80
COPY --from=build /app/app /app/app
CMD ["/app/app"]
