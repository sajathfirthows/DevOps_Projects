# Installing Nginx Server and setting up sample files on an installed Amazon Linux EC2 Instance

![image](https://user-images.githubusercontent.com/106432527/218156187-e577a5d3-1e1b-4a16-b55a-cb64c40da569.png)

<hr style="border:2px solid gray">

Nginx is a popular open-source web server and reverse proxy used to serve dynamic and static web pages. In this article, we will guide you through the steps to install Nginx on an Amazon EC2 instance.

Before we start, make sure that you have an EC2 instance set up and you have access to the terminal

## Step 1: Connect to your EC2 instance
To connect to your EC2 instance, you will need to use an ssh client such as Putty, MobaXterm. Enter the public DNS of your EC2 instance, which you can find in the AWS Management Console.

![image](https://user-images.githubusercontent.com/106432527/218156640-1aadc6f7-92de-4a3d-81f8-51473095480e.png)

## Step 2: Update the package index
To ensure that you have the latest version of the software available, run the following command:

< sudo yum update >
