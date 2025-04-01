# Scalable Container App

A simple Flask application containerized with Docker and deployable to AWS using Terraform.

## Overview

This project demonstrates a DevOps workflow for a containerized application with:

- A simple Flask web application
- Docker containerization with scaling capabilities
- Infrastructure as Code using Terraform for AWS deployment
- Shell script automation for local and cloud deployment

## Project Structure

```
scalable-container-app/
├── README.md
├── docker-compose.yml       # Docker configuration for local deployment
├── run.sh                   # Automation script for deployment
├── app/                     # Application code
│   ├── Dockerfile           # Container definition
│   ├── app.py               # Flask application
│   └── requirements.txt     # Python dependencies
└── terraform/               # IaC for AWS deployment
    ├── main.tf              # Main Terraform configuration
    ├── outputs.tf           # Output definitions
    ├── terraform.tfvars     # Terraform variables values
    └── variables.tf         # Terraform variables definition
```

## Prerequisites

Before running this application, ensure you have the following installed:

- Docker and Docker Compose
- Terraform
- AWS CLI (configured with appropriate credentials)

## Running the Application

### Local Development

1. Clone the repository:
   ```bash
   git clone https://github.com/Anubothu-Aravind/scalable-container-app.git
   cd scalable-container-app
   ```

2. Run the application locally using Docker Compose:
   ```bash
   docker-compose up --build
   ```

3. Access the application at: http://localhost:5001

### Scaling the Application Locally

The Docker Compose file is configured to run 3 replicas of the application by default. You can modify the replicas count in the `docker-compose.yml` file.

### Deploying to AWS

The project includes a convenience script `run.sh` that handles both local deployment and AWS provisioning:

1. Make the script executable:
   ```bash
   chmod +x run.sh
   ```

2. Run the script:
   ```bash
   ./run.sh
   ```

This script will:
- Build and start the Docker containers locally
- Initialize Terraform
- Provision AWS resources (EC2 instance)
- Display the URLs for both local and EC2 deployments

3. Press Ctrl+C to stop the application when done.

### Manual AWS Deployment

If you prefer to deploy to AWS manually:

1. Initialize Terraform:
   ```bash
   cd terraform
   terraform init
   ```

2. Apply Terraform configuration:
   ```bash
   terraform apply
   ```

3. Get the public IP of the EC2 instance:
   ```bash
   terraform output instance_ip
   ```

4. Access the application on EC2 at: http://<instance_ip>:5000

## Configuration

### Docker Configuration

The application is configured to run in a Docker container with resource limits of:
- CPU: 0.5 cores
- Memory: 512MB

These limits can be adjusted in the `docker-compose.yml` file.

### AWS Configuration

The application is deployed to an AWS EC2 instance with the following configuration:
- Instance type: t2.micro
- Region: us-east-1
- Security group: Allows traffic on port 5000

You can modify these settings in the Terraform configuration files.

## Cleanup

To remove all AWS resources created by Terraform:

```bash
cd terraform
terraform destroy
```

## License

[MIT License](LICENSE)
