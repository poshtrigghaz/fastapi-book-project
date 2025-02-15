# Use an official Python image as the base
FROM python:3.12-slim

# Install Nginx and other dependencies
RUN apt-get update && apt-get install -y nginx

# Set working directory
WORKDIR /app

# Copy application files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/sites-enabled/default

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx and Uvicorn (using the FastAPI app from main.py in the root)
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000