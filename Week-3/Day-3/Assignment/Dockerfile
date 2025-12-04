# Use small nginx base image
FROM nginx:alpine

# Clean default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy portfolio site into nginx document root
COPY . /usr/share/nginx/html/

# Expose HTTP port
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

