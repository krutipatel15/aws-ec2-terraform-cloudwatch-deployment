
# Automated Infrastructure Deployment with Monitoring and Alerts

This project automates the deployment of an EC2 instance with monitoring and alerting features using AWS services. 
The infrastructure is provisioned with Terraform, and monitoring is configured via AWS CloudWatch and SNS for alerts.

## Project Overview

The infrastructure includes:
- An Amazon EC2 instance
- A VPC with public subnet and internet gateway
- Security groups allowing SSH and HTTP access
- CloudWatch monitoring and alarms for CPU utilization
- SNS topic to send email notifications when alarms are triggered

## Prerequisites

- AWS account with appropriate IAM permissions
- Terraform installed locally (https://www.terraform.io/downloads.html)
- SSH client to connect to the EC2 instance

## Project Structure

- **main.tf**: Sets up the VPC, subnet, security groups, and EC2 instance.
- **provider.tf**: Configures the AWS provider for Terraform.
- **variable.tf**: Defines input variables for the project (e.g., key name, subnet CIDR).
- **outputs.tf**: Outputs the public IP of the instance and sensitive private key if generated.
- **cloudwatch_sns.tf**: Sets up CloudWatch alarms and SNS notifications for monitoring.

## Setup and Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
   ```

2. **Configure Variables**:
   - Ensure `variable.tf` contains valid values for your AWS environment.
   - Update `sns_email` with the email address for receiving alerts.

3. **Initialize and Apply Terraform**:
   - Initialize the Terraform environment:
     ```bash
     terraform init
     ```
   - Apply the Terraform configuration:
     ```bash
     terraform apply -var "key_name=my-key" -var "sns_email=your-email@example.com"
     ```
   - Confirm the creation and take note of the EC2 instance’s public IP.

4. **Access the EC2 Instance**:
   - SSH into the EC2 instance using the downloaded `.pem` key file:
     ```bash
     ssh -i "my-key.pem" ec2-user@<instance_public_ip>
     ```

5. **Testing CloudWatch Alarms and SNS Notifications**:
   - Generate high CPU load on the EC2 instance to trigger the alarm:
     ```bash
     yes > /dev/null &
     ```
   - Check for SNS email notifications once the CPU utilization exceeds the threshold.

6. **Clean Up**:
   - When finished, you can destroy the infrastructure:
     ```bash
     terraform destroy -var "key_name=my-key" -var "sns_email=your-email@example.com"
     ```

## Notes

- **Security**: The `.gitignore` file is set to exclude any sensitive information, like private keys and Terraform state files.
- **Costs**: This setup may incur costs in AWS. Be sure to destroy the resources when no longer needed.

---

### `.gitignore` File

Here’s the recommended `.gitignore` file to prevent sensitive files from being committed:

```plaintext
# Ignore SSH keys
*.pem

# Ignore Terraform files that contain sensitive info or are auto-generated
*.tfstate
*.tfstate.*
.terraform/
terraform.tfvars
*.backup

# Ignore IDE/project-specific files
*.log
*.DS_Store
.idea/
.vscode/
```

---

### Steps to Push to GitHub

1. **Initialize Git** (if not already initialized):
   ```bash
   git init
   ```

2. **Add Remote Repository**:
   - Replace `your-username` and `your-repo-name` with your actual GitHub username and repository name:
     ```bash
     git remote add origin https://github.com/your-username/your-repo-name.git
     ```

3. **Add Files and Commit**:
   - Add all files except those specified in `.gitignore`:
     ```bash
     git add .
     ```
   - Commit the files with a descriptive message:
     ```bash
     git commit -m "Initial commit - Automated Infrastructure Deployment with Monitoring and Alerts"
     ```

4. **Push to GitHub**:
   ```bash
   git push -u origin main
   ```

---

Your project is now ready to be pushed to GitHub. Copy and paste this entire README, and let me know if you need further assistance!
