<<<<<<< HEAD
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
=======
# Use the official Nginx image as the base
FROM nginx:alpine

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy the static files (HTML, CSS, JS) into the container
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
>>>>>>> origin/main
CMD ["nginx", "-g", "daemon off;"]
