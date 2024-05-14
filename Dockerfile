FROM python:3.8-slim

WORKDIR /app

# Copy application files
COPY app/ /app
COPY requirements.txt /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install PostgreSQL client
RUN apt-get update && apt-get install -y postgresql-client

# Expose port for Flask application
EXPOSE 5000

# Command to run Flask application
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
