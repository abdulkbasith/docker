# Base image
FROM nginx:latest

# Author
LABEL maintainer="Your Name"

# Copy custom configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
