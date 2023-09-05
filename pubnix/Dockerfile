FROM nginx:mainline-alpine
RUN mkdir /app
RUN apk add certbot certbot-nginx
WORKDIR /app
COPY static/nginx.conf /etc/nginx/conf.d/default.conf
COPY bin/generate_certs.sh /bin/generate_certs.sh
