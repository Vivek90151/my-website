FROM ubuntu:24.04

# Install dependencies

# Remove default files
RUN rm -rf /var/www/html/*

# Clone repo into correct Apache directory
RUN apt-get update && apt-get install -y apache2 wget unzip

RUN wget https://github.com/nawab8997/apache/archive/refs/heads/main.zip && \
    unzip main.zip && \
    cp -r apache-main/* /var/www/html/ && \
    rm -rf main.zip apache-main

# Expose port
EXPOSE 80

# Run Apache in foreground (IMPORTANT)
CMD ["apachectl", "-D", "FOREGROUND"]
