FROM ubuntu:24.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache + tools
RUN apt-get update && \
    apt-get install -y apache2 wget unzip && \
    apt-get clean

# Remove default Apache files AFTER install
RUN rm -rf /var/www/html/*

# Download and deploy your website
RUN wget https://github.com/Vivek90151/my-website/archive/refs/heads/master.zip && \
    unzip master.zip && \
    cp -r my-website-master/* /var/www/html/ && \
    rm -rf master.zip my-website-master

# Set correct permissions (important)
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]
