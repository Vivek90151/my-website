FROM nginx:alpine

# old default files remove
RUN rm -rf /usr/share/nginx/html/*

# copy your website files
COPY . /usr/share/nginx/html

# expose port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
