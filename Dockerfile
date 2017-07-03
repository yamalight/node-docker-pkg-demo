# ----------------
# STEP 1:
# build with pkg
FROM node:latest AS build
WORKDIR /app

# install dependencies with cache
COPY package.json .
COPY yarn.lock .
RUN yarn
# copy app files, build and package
COPY . /app
RUN yarn package

# ----------------
# STEP 2:
# run with alpine
FROM alpine:latest
WORKDIR /app
ENV NODE_ENV=production

# install required libs
RUN apk update && apk add --no-cache libstdc++ libgcc

# copy prebuilt binary from previous step
COPY --from=build /app/app /app/app
CMD ["/app/app"]
