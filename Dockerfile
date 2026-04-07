FROM ubuntu:24.04

# Install dependencies

# Remove default files
RUN rm -rf /var/www/html/*

# Clone repo into correct Apache directory
RUN apt-get update && apt-get install -y apache2 wget unzip

RUN wget https://github.com/Vivek90151/my-website/archive/refs/heads/master.zip && \
unzip master.zip && \
sudo cp -r my-website-master/* /var/www/html/ && \
rm -rf master.zip my-website-master

# Expose port
EXPOSE 80

# Run Apache in foreground (IMPORTANT)
CMD ["apachectl", "-D", "FOREGROUND"]
