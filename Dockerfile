# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy your Nginx configuration file to the container
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy the HTML, CSS, and JavaScript files to Nginx's default directory
COPY yt.html /usr/share/nginx/html/index.html
COPY yt.css /usr/share/nginx/html/yt.css
COPY yt.js /usr/share/nginx/html/yt.js

# Expose port 5050
EXPOSE 5050

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]

