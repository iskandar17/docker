FROM nginx:1.12.2

COPY build/ /opt/www/
COPY etc/nginx/conf.d /etc/nginx/conf.d

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]