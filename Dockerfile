FROM alpine:latest AS builder
RUN apk --no-cache add nginx
COPY . /usr/share/nginx/html


FROM nginx:alpine
COPY --from=builder /usr/share/nginx/html /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

