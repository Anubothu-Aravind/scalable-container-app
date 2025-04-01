# Use a base image
FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Install required dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the app code
COPY . .

# Expose the necessary port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
