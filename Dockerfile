# Base image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

    # Metadata about the image
LABEL maintainer="runtesting4me@gmail.com"
LABEL version="1.0"
LABEL description="A simple Python 3 Tier Application Docker image"

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire app
COPY . /app/

# Expose the app's port (5000 or specified in your app)
EXPOSE 5000

# Command to run the app
CMD ["python", "manage.py", "runserver", "0.0.0.0:5000"]
