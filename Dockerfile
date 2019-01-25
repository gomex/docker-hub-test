FROM nginx:latest

MAINTAINER Kassiel Batista <kassiel@paycertify.com>

# Remove default sites-available
RUN rm -rf /etc/nginx/sites-available /etc/nginx/sites-enabled/default

# Add nginx configuration file, and add sites-available from local directory
ADD nginx.conf /etc/nginx/
ADD sites-available/ /etc/nginx/sites-available

# Create symbolic links within sites-available content to sites-enabled directory
RUN mkdir /etc/nginx/sites-enabled
RUN ln -s /etc/nginx/sites-available/*.conf /etc/nginx/sites-enabled/

# Start nginx service.
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["nginx"]
