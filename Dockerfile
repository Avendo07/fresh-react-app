FROM node:latest AS builder

WORKDIR /app

COPY . .

RUN yarn install

RUN yarn build



FROM nginx:1.10.1-alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=builder /app/build .

# COPY index.html .

EXPOSE 8080

ENTRYPOINT ["nginx", "-g", "daemon off;"]


