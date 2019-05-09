FROM node:11.15.0
WORKDIR /app
COPY . /app
RUN npm ci


