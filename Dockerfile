FROM nginx:alpine
WORKDIR /app
COPY . /app
RUN apt-get update
