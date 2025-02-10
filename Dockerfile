# Use Nginx Alpine as the base image
FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy the HTML, CSS, and JavaScript files into the container
COPY yt.html index.html
COPY yt.css .
COPY yt.js .

# Expose port 80 for the container
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

