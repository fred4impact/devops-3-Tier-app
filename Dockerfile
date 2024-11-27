# Base image
FROM python:3.9-slim


# Metadata about the image
LABEL maintainer="runtesting4me@gmail.com"
LABEL version="1.0"
LABEL description="flask app 3 tier Docker image"

# Set working directory


# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . /app/

# Expose the Flask app's port
EXPOSE 5000

# Set Flask environment variables
ENV FLASK_APP=app
ENV FLASK_ENV=production

# Run the Flask app
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
