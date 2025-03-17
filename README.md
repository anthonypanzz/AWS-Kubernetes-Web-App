
# Dynamic Web App Deployment with Kubernetes on AWS EKS

![Alt text](Host_a_Dynamic_Web_App_on_AWS_with_Kubernetes_and_Amazon_EKS.gif)

---


## Overview

This project demonstrates how to deploy a dynamic web application on AWS using Kubernetes and EKS (Elastic Kubernetes Service). The deployment process involves multiple steps, including setting up the networking environment, containerizing the application with Docker, configuring EKS for Kubernetes orchestration, and ensuring secure access to AWS resources. The application is connected to an RDS database and uses several AWS services for security, scalability, and monitoring.

### Repository Contents
- **Reference Diagram**: A visual representation of the architecture used for deploying the application.
- **Scripts**: All the scripts and configuration files used to automate the deployment process.
- **Kubernetes Manifests**: YAML files used to deploy the application on EKS.
- **Dockerfile**: The Dockerfile used to containerize the application.

---

## Steps Involved

### 1. Set up Git and GitHub
- Initialized a Git repository to store all project files and scripts.
- Pushed the repository to GitHub for version control and collaboration.

---

### 2. Create AWS VPC with Networking Components
- **VPC**: Created a Virtual Private Cloud to securely host all resources.
  ![Screenshot 2025-03-16 003955](https://github.com/user-attachments/assets/07b02ec4-4c0a-4aea-b150-89951a512c8f)

- **Internet Gateway**: Set up an internet gateway to enable public internet access.
  ![Screenshot 2025-03-16 004016](https://github.com/user-attachments/assets/6a5377ec-a25f-41da-bc77-198805e030d5)

- **Subnets**: Configured public and private subnets for better isolation of resources.
  ![Screenshot 2025-03-16 004032](https://github.com/user-attachments/assets/41b24b2d-93ec-4789-80f8-4fdd5eb5c67a)

- **Route Tables**: Defined proper routing to ensure correct traffic flow between public and private subnets.
  ![Screenshot 2025-03-16 004058](https://github.com/user-attachments/assets/d31f6d18-e322-40db-a0c2-d6583b0735fc)

- **NAT Gateway**: Enabled outbound internet access from private subnets.
  ![Screenshot 2025-03-16 004111](https://github.com/user-attachments/assets/d59c09b1-c693-4e69-8155-a24403474ee1)

- **Security Groups**: Configured security groups to control access to EC2 and RDS instances.
  ![Screenshot 2025-03-16 004147](https://github.com/user-attachments/assets/b36becbd-ddca-4853-9c8a-a444d90f9b37)

- **EC2 Instance Connect Endpoint**: Allowed secure access to EC2 instances without direct SSH access.
  ![Screenshot 2025-03-16 004202](https://github.com/user-attachments/assets/e4328e1a-575b-4353-ae0c-dd4555c97f30)

- **RDS Instance**: Provisioned an RDS instance (e.g., MySQL, PostgreSQL) for database storage.
  ![Screenshot 2025-03-16 004239](https://github.com/user-attachments/assets/7b547d15-6a16-4d6f-bc35-916a606c6e13)

--- 
### 3. Create Dockerfile
- Created a Dockerfile to containerize the web application, ensuring all dependencies are packaged within the container.
### 4. Build Docker Image
- Built the Docker image using the Dockerfile with the `docker build` command.
- Tested the image locally to ensure it functions as expected.

   ![Screenshot 2025-03-16 004703](https://github.com/user-attachments/assets/c1cc6119-2ef8-4870-aa49-b1013b2df8cf)
![Screenshot 2025-03-16 004718](https://github.com/user-attachments/assets/4b868d34-4501-4820-858c-b34eca880231)
![Screenshot 2025-03-16 004734](https://github.com/user-attachments/assets/7de62ef9-b330-4a63-99cd-0129d69e5d2c)

---
### 5. Push Docker Image to AWS ECR
- Created an ECR (Elastic Container Registry) repository to store Docker images.
- Pushed the built Docker image to ECR using the AWS CLI.
  ![Screenshot 2025-03-16 005055](https://github.com/user-attachments/assets/e25ed6a7-4496-4b8a-82b4-4af17e740345)
![Screenshot 2025-03-16 005109](https://github.com/user-attachments/assets/7a4c7629-ae91-410c-ba2a-710446ac504c)

---
### 6. Create IAM Roles with S3 Access
- Created IAM roles that grant the necessary permissions for accessing AWS resources like S3, which is used for storing static assets.
  ![Screenshot 2025-03-16 005212](https://github.com/user-attachments/assets/8a3e6703-9b7b-4b4b-89fe-41eefe55e6d1)
![Screenshot 2025-03-16 005247](https://github.com/user-attachments/assets/efc6cabf-859f-4856-bc15-d2884c8d566a)

---
### 7. Migrate Data into RDS Using Flyway
- Utilized **Flyway** for database migration to ensure the RDS instance has the correct schema before application deployment.
- Configured Flyway scripts to automate schema versioning.
  ![Screenshot 2025-03-17 053547](https://github.com/user-attachments/assets/38b9dbe8-9f4e-4296-9d0f-d1784a6b5e51)


---
### 8. Install Command-Line Tools
- Installed essential command-line tools to interact with AWS and Kubernetes:
  - **kubectl**: For managing Kubernetes clusters.
  - **eksctl**: For managing AWS EKS clusters.
  - **helm**: For managing Kubernetes applications and deploying Helm charts.

---

### 9. Store Secrets in AWS Secrets Manager
- Stored sensitive application data (e.g., database credentials, API keys) in **AWS Secrets Manager**.
- Configured the Kubernetes deployment to retrieve secrets from Secrets Manager securely
![Screenshot 2025-03-16 005525](https://github.com/user-attachments/assets/1cbf07a6-69fa-48ab-9933-0ffe524593f6)
![Screenshot 2025-03-16 005609](https://github.com/user-attachments/assets/8f48650d-7374-46ba-967b-38e23d882f81)

---
### 10. Create Kubernetes Cluster with Control Plane and Worker Nodes
- Used **eksctl** to create a Kubernetes cluster on AWS EKS, which included the control plane and worker nodes.
- The worker nodes were automatically managed and scaled based on the configuration.
  ![Screenshot 2025-03-16 005642](https://github.com/user-attachments/assets/6cce86a2-fb13-4580-98e2-e6ad00d1dd37)
![Screenshot 2025-03-16 005713](https://github.com/user-attachments/assets/1c286ca9-4859-4651-a8fd-43dc9f5d7040)
![Screenshot 2025-03-16 005757](https://github.com/user-attachments/assets/a880ebd2-8f42-4205-92a6-ca9484657204)
![Screenshot 2025-03-16 005743](https://github.com/user-attachments/assets/6701228a-eb86-44c0-98e7-e9ff7e92c35b)

---
### 11. Create IAM Roles for EKS and Worker Nodes
- Defined IAM roles for the EKS control plane and worker nodes to ensure secure access to AWS resources (e.g., EC2, S3, RDS).
  ![Screenshot 2025-03-16 005843](https://github.com/user-attachments/assets/3a92ab59-ff2e-424d-a991-b93091bf254c)
![Screenshot 2025-03-16 005903](https://github.com/user-attachments/assets/585ae0b1-8329-45d4-96e8-43527cc967a4)

---
### 12. Create Kubernetes Manifest Files
- Created Kubernetes YAML files for deploying the application:
  - **Deployment**: Defined the application's container, replicas, and environment variables.
    ![Screenshot 2025-03-16 010025](https://github.com/user-attachments/assets/894dd769-a4cf-402f-80f5-e8aaa88d68b0)

 - **Service**: Exposed the application to the network and connected it to a Load Balancer.
   ![Screenshot 2025-03-16 010054](https://github.com/user-attachments/assets/4a450f8c-78fc-4155-b004-5144c7aa151a)

   - **ConfigMap**: Provided non-sensitive configuration data to the application.
  - **Secrets**: Managed sensitive data securely in the deployment.
![Screenshot 2025-03-16 010003](https://github.com/user-attachments/assets/2f97bc0f-94b3-4d37-b90b-a6d5c480f319)

---
### 13. Deploy to EKS Cluster
- Applied the Kubernetes manifests using `kubectl apply` to deploy the application to the EKS cluster.
- Verified the application was running using `kubectl get pods` and `kubectl get services`.
  ![Screenshot 2025-03-16 010308](https://github.com/user-attachments/assets/d48faaf9-b7b5-4c77-a012-797d9e9f98ed)
![Screenshot 2025-03-16 010330](https://github.com/user-attachments/assets/f041ebaa-d98e-4b6c-863d-78a7899767c3)
![Screenshot 2025-03-16 011633](https://github.com/user-attachments/assets/c9c7ea41-874c-4b77-8335-33744e4fd906)
![Screenshot 2025-03-16 011650](https://github.com/user-attachments/assets/c741b504-5863-48e6-897e-497b7352ea27)
![Screenshot 2025-03-16 011710](https://github.com/user-attachments/assets/4a357d07-8045-4b16-9b81-92fd6788b860)
![Screenshot 2025-03-16 011830](https://github.com/user-attachments/assets/362de78a-d923-4c4b-b49e-c70b39cb8f86)
![Screenshot 2025-03-16 011906](https://github.com/user-attachments/assets/e908c4b7-1cb0-47ba-8215-a58ca51f2f79)
![Screenshot 2025-03-16 011932](https://github.com/user-attachments/assets/a0f47ba2-7e33-40c8-80c5-84ec308d2493)

---
### 14. Set up DNS with Route 53
- Configured **Route 53** for DNS routing, pointing the domain to the public load balancer that exposes the application to the internet.
![Screenshot 2025-03-16 011746](https://github.com/user-attachments/assets/91c0b657-ec75-45d4-ab4a-5a86a51dc025)
![Screenshot 2025-03-16 003822](https://github.com/user-attachments/assets/fd5e7c89-6f9f-4d94-b022-f45bf7789eb0)


---

### Conclusion
By leveraging AWS EKS, Docker, Kubernetes, and other AWS managed services, this project provides a highly scalable, secure, and cost-efficient solution for hosting a dynamic web application. The use of Kubernetes enables automated deployments, scaling, and management of the application, while AWS services like RDS and S3 ensure that the application's data is stored reliably and securely.

This setup improves application availability, and automates many aspects of the infrastructure, making it easier to manage and scale as traffic increases. By integrating AWS Secrets Manager, IAM roles, and security best practices, the application is also secure and adheres to industry standards for cloud-native applications.





