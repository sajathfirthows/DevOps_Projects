# Building and Storing a Docker Image in AWS EC2 with Terraform and GitHub

![image](https://user-images.githubusercontent.com/106432527/218282592-64441711-e149-4df6-9da6-5fba676e8f8e.png)

Amazon Elastic Compute Cloud (Amazon EC2) is a scalable cloud computing service provided by Amazon Web Services (AWS). It provides a platform for users to run their applications, store their data, and manage their infrastructure resources. Amazon Linux is a distribution of the Linux operating system designed specifically for use on the Amazon EC2 platform. In this article, we will show you how to install an EC2 Amazon Linux Free Tier instance using Terraform, and how to install Docker and create a sample Docker file.

Terraform can be installed for the process of deploying a Docker image on can be installed in 2 ways:

Local Machine: You can install Terraform on your local machine and run the Terraform commands from there. To do this, you will need to have the necessary permissions to create and manage AWS resources, and you will need to configure your AWS CLI credentials on your local machine.
EC2 Instance: Another option is to install Terraform on an EC2 instance, and run the Terraform commands from there. This can be useful if you want to automate the entire deployment process, or if you don’t have access to install Terraform on your local machine. To do this, you would first create an EC2 instance using Terraform, and then SSH into the instance to install Terraform and run the Terraform commands.
Regardless of where Terraform is installed, it will use the AWS CLI credentials that you have configured to access your AWS account and deploy the necessary resources.

Here I am using an Amazon EC2 Linux instance which already installed,

Now SSH in it,

![image](https://user-images.githubusercontent.com/106432527/218282614-e4254985-ca5f-4833-8264-be556cd79b98.png)

## Step 01: Installing Terraform:

Terraform is an open-source tool used for infrastructure as code (IAC). It enables users to define their infrastructure as code and provision, manage, and version the resources on multiple cloud platforms. To install Terraform, follow these steps:

You can download the Terraform binary file from the Terraform website (https://www.terraform.io/downloads.html) based on your operating system.

1. Download the Terraform package for your operating system from the official website.
2. Extract the Terraform package and copy it to a directory in your PATH environment variable, such as /usr/local/bin.
3. Verify the installation by running the following command in your terminal:

```
terraform -v
```

![image](https://user-images.githubusercontent.com/106432527/218282667-48cd95c7-85e5-4b62-986a-16959163aebb.png)

Now Terraform installed,

To use your IAM credentials to authenticate the Terraform AWS provider, set the `AWS_ACCESS_KEY_ID` environment variable.export AWS_ACCESS_KEY_ID=

```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

## Now Let’s start on writing the configuration File,

In this step, we will use Terraform to create an EC2 Amazon Linux Free Tier instance. First, create a Terraform configuration file named “ec2.tf”.

```
mkdir terraform-aws-instance
```

```
cd terraform-aws-instance
```

```
touch ec2.tf
```

This file will define the resources to be created.

```
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "instance" {
  name        = "instance"
  description = "Allow SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "My-ec2-Inst" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  subnet_id            = aws_vpc.default.public_subnet_id
}
```

This Terraform configuration file that creates a Virtual Private Cloud (VPC), a security group, and an EC2 instance in the Amazon Web Services (AWS) cloud.

Here’s what each section of the code does:

1.`provider "aws":` This section defines the provider as AWS and specifies the region to be used as "us-east-1".

2.`resource "aws_vpc" "default":` This section creates an AWS Virtual Private Cloud (VPC) with the CIDR block "10.0.0.0/16".

3.`resource "aws_security_group" "instance":` This section creates a security group that allows incoming SSH traffic from anywhere on port 22.

4.`resource "aws_instance" "My-ec2-Inst":` This section creates an EC2 instance using the Amazon Machine Image (AMI) with ID "ami-0aa7d40eeae50c9a9". The instance type is set to "t2.micro" and the security group created earlier is associated with the instance. The subnet used is the public subnet within the VPC.


Next, run the following Terraform commands to create the instance:

```
terraform init
terraform apply
```

The “terraform init” command initializes the Terraform configuration, and the “terraform apply” command creates the resources defined in the configuration file.

## Step 2: Installing Docker

Docker is a platform for developing, shipping, and running applications. In this step, we will install Docker on our EC2 Amazon Linux instance. To install Docker, follow these steps:

Once you SSH into your EC2 Amazon Linux instance which was created using Terraform.

Run the following command to install docker,

```
sudo yum install -y docker

```

## Step 03: Start the Docker service by running the following command:

```
sudo service docker start
```

## Step 4: Creating a sample Docker file

A Docker file is a script that contains instructions for building a Docker image. In this step, we will create a sample Docker file that will run a simple Hello World application. Create a file named “Dockerfile” in your current directory and paste the following contents:

 ```
 FROM alpine:3.12

CMD ["echo", "Hello World"]
```

## Step 5: Building the Docker image

In this step, we will use the Docker file to build a Docker image. Run the following command in your terminal:

```
docker build -t hello-world .
```

The “docker build” command builds a Docker image from the Docker file, and the “-t” option tags the image with the name “hello-world”. The “.” at the end specifies the location of the Docker file.

![image](https://user-images.githubusercontent.com/106432527/218282940-60c1d0ea-d6e6-4561-8618-fab1d9b8c99b.png)

## Step 6: Running the Docker image

In this step, we will run the Docker image we created in the previous step. Run the following command in your terminal:

```
docker run hello-world
```
The “docker run” command runs a Docker image, and the “hello-world” argument specifies the image to be run.


we showed you how to install an EC2 Amazon Linux Free Tier instance using Terraform, how to install Docker, and how to create a sample Docker file. We also demonstrated how to store the code on GitHub for version control and collaboration. This tutorial provides a basic introduction to using Terraform and Docker, and you can use this knowledge to build more complex applications on the Amazon EC2 platform.



