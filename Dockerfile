# Use an official Python runtime as a parent image
FROM python:3.12

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Set the working directory
WORKDIR /app

# Copy project files into the container
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/sites-enabled/default

# Expose the port Nginx will serve on
EXPOSE 80

# Start Nginx and Uvicorn
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000