FROM nginx
RUN apt-get update && apt-get install curl apache2-utils -y && htpasswd -bc /etc/nginx/.htpasswd username password
#  default conf for proxy service

ARG YOURAPP_ENV=production

ENV YOURAPP_ENV="${YOURAPP_ENV}"

COPY ./default.conf /etc/nginx/conf.d/default.conf

RUN cd /etc/nginx/conf.d/ && sed -i "s|SECRET|$YOURAPP_ENV|g" default.conf

# NOT FOUND response
COPY ./backend-not-found.html /var/www/html/backend-not-found.html

#  Proxy and SSL configurations
#COPY ./includes/ /etc/nginx/includes/

# Proxy SSL certificates
COPY ./ssl/web.crt /etc/ssl/certs/

COPY ./ssl/web.key /etc/ssl/private/
