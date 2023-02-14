#Setting up Jenkins on Ubuntu AWS EC2

![image](https://user-images.githubusercontent.com/106432527/218745541-5015df3d-6554-4d43-b5c0-f03e47d784c6.png)

Jenkins is an open-source automation server that provides support for building, deploying, and automating projects. In this article, we will show you how to set up Jenkins on an Amazon Web Services (AWS) Elastic Compute Cloud (EC2) instance running Ubuntu.

Jenkins can be installed in various ways — Native system packages, Docker, standalone executable session and this post will be focused on native package installation.

To set up Jenkins, you need to have an EC2 instance running Ubuntu. To create one, log in to the AWS management console and select EC2 from the services list. On the EC2 dashboard, click the “Launch Instance” button and select the latest version of Ubuntu.

We will consider on these below,

🔸An EC2 instance running with T2 micro for instance type.

🔸AWS key-pair to SSH into the EC2 instance.

🔸Configuring firewalls (security groups) to allow SSH access into the EC2 instance.

## Step 1: Create an EC2 Instance

![image](https://user-images.githubusercontent.com/106432527/218745706-a20153de-1493-4eba-9294-ecf4b989f046.png)

We can see that EC2 instance has been created,

![image](https://user-images.githubusercontent.com/106432527/218745753-7c4362d6-1db9-4222-9f28-4c0a37562897.png)

## Step 2: Connect to the EC2 Instance

Once the instance is created, connect to it using an SSH client such as MobaXterm or Terminal. Here I will use MobaXterm. To do this, you will need the public IP address of your EC2 instance and the private key that you used to launch the instance.

![image](https://user-images.githubusercontent.com/106432527/218745829-0e7b7864-6f71-4027-a724-387f9ba1fd43.png)

## Step 3: Update the Package Index

Before installing Jenkins, update the package index on the EC2 instance. To do this, run the following commands:

```
sudo apt-get update
```

## Step 4: Install Java

Jenkins is a Java-based application, so you need to have Java installed on your EC2 instance. To install Java, run the following command:

```
sudo apt-get install openjdk-8-jdk
```

Step 5: Install Jenkins

To install Jenkins, add the Jenkins repository to the EC2 instance’s package manager by running the following command:

```
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
```

Next, update the package index and install Jenkins by running the following commands:

```
sudo apt-get update
sudo apt-get install jenkins
```

## Step 6: Start Jenkins

To start Jenkins, run the following command:

```
sudo systemctl start jenkins
```

Then checking the status of Jenkins,

```
sudo systemctl status jenkins
```

Step 7: Access the Jenkins Dashboard

Jenkins runs on port 8080 by default. To access the Jenkins dashboard, open a web browser and enter the public IP address of your EC2 instance followed by ```:8080```.

Example: ```http://<public_ip_address>:8080```

For the first time, Jenkins will prompt the ```Unlock Jenkins``` screen to authenticate the installation.

You will be prompted to enter a password, which can be found in the file ```/var/lib/jenkins/secrets/initialAdminPassword```. To retrieve the password, run the following command:

![image](https://user-images.githubusercontent.com/106432527/218746686-0bb11020-0a57-4ab8-b00e-06aed46336f7.png)

```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy the automatically-generated alphanumeric password (between the 2 sets of asterisks). On the Unlock Jenkins page, paste this password into the Administrator password field and click Continue.

## Step 8: Customize Jenkins
Recommended selecting ```Install suggested plugins``` to install the recommended set of plugins based on most common use cases.

The setup wizard shows the progression of Jenkins plugins being installed

![image](https://user-images.githubusercontent.com/106432527/218746921-ef46b9c6-9fd7-4ddb-ba17-986915ae44f0.png)

![image](https://user-images.githubusercontent.com/106432527/218746941-8b8bbc5b-f92d-4a43-9df7-e186b419e167.png)

## Step 9: Create First Admin User

Enter the details to create admin user and click continue,

![image](https://user-images.githubusercontent.com/106432527/218747004-ee2feea6-271b-4d07-8728-862507fc8347.png)

## Step 10: Configure Valid DNS (if required)

Jenkins Instance access URL will be printed on the screen that follows. This can be changed with a valid DNS name. For the purpose of our demo, we will leave it as unchanged and click Save and Finish,

![image](https://user-images.githubusercontent.com/106432527/218747074-0906d5d4-5b44-4dd8-85a7-9a022542dc8f.png)

## Step 11: Jenkins is now ready, Jenkins now successfully configured.

![image](https://user-images.githubusercontent.com/106432527/218747163-7fb9fd27-6e32-4d31-a100-434465edd456.png)

## Step 12: Let’s click on Start using Jenkins!!

![image](https://user-images.githubusercontent.com/106432527/218747224-f3573d32-8966-40d3-9ebb-88ce1fafd8a8.png)

we showed you how to set up Jenkins on an EC2 instance running Ubuntu. By following these steps, you should now have a fully functional Jenkins server that you can use to automate your builds and deployments.








