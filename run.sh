#!/bin/bash

# Step 1: Build and run Docker containers locally
echo "Building and starting Docker containers..."
docker-compose up --build

# Step 2: Initialize Terraform
echo "Initializing Terraform..."
cd terraform
terraform init

# Step 3: Apply Terraform configuration to provision AWS resources
echo "Provisioning infrastructure with Terraform..."
terraform apply -auto-approve

# Step 4: Get the public IP of the provisioned EC2 instance
INSTANCE_IP=$(terraform output -raw instance_ip)

# Step 5: Display the local application URL and EC2 application URL
echo "Local app URL: http://localhost:5000"
echo "EC2 app URL: http://$INSTANCE_IP:5000"

# Step 6: Wait for user input to stop the Docker containers
echo "Press [Ctrl+C] to stop the Docker containers and exit the application."

# Wait until the user stops the containers manually
wait