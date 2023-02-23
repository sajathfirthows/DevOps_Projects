# Installing and Configuring Jenkins on an EC2 Instance with Port 9090

![image](https://user-images.githubusercontent.com/106432527/220930414-ff5165b4-347e-4b0d-b9da-ed935dedb7cf.png)

Jenkins is an open-source automation server that can help you automate various tasks in your software development process, such as building, testing, and deploying your code. In this guide, we will walk through the steps to install Jenkins on an EC2 instance and access it via a web browser on port 9090.

Reason to install Jenkins on port 9090, it is simply a commonly used port for Jenkins installations. By default, Jenkins is configured to run on port 8080, but this can be changed in the Jenkins configuration settings. Port 9090 is sometimes used as an alternative port to avoid conflicts with other applications that may be using port 8080. Additionally, some users may prefer to use a non-default port for security reasons. Ultimately, the choice of port number is up to the individual user and their specific needs and preferences.

## Step 01: Connect your EC2 instance via SSH

The first step is to connect to your EC2 instance via SSH. You can do this by opening a terminal on your local machine and running the following command:

```
ssh -i <your-ssh-key> <your-ec2-instance-ip>
```

Replace ```<your-ssh-key>``` with the path to your SSH key file and ```<your-ec2-instance-ip>``` with the public IP address of your EC2 instance.

![image](https://user-images.githubusercontent.com/106432527/220928144-d7893259-7ecd-4987-bb26-a5d9619632f4.png)

## Step 02: Update the package index and install java

Once you’re connected to your EC2 instance, the next step is to update the package index and install Java. Jenkins requires Java to run, so we need to make sure it’s installed on our system. You can do this by running the following commands:

```
sudo apt update
```

```
sudo apt install default-jdk -y
```

The first command updates the package index on your system, and the second command installs the default JDK package, which includes the Java Runtime Environment (JRE) and the Java Development Kit (JDK).

## Step 03: Add the Jenkins Debian package key to your system

In order to install Jenkins on our system, we need to add the Jenkins Debian package key to our system. This key is used to verify the integrity of the Jenkins packages we will install. You can do this by running the following command:

```
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
```

This command downloads the Jenkins Debian package key from the official Jenkins website and adds it to our system’s list of trusted keys.

## Step 04: Add the Jenkins Debian repository to your system

Next, we need to add the Jenkins Debian repository to our system. This repository contains the Jenkins packages we will install. You can do this by running the following command:

```
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

```

This command creates a new file called ```jenkins.list``` in the ```/etc/apt/sources.list.d/``` directory and adds a line to it that specifies the Jenkins repository URL.

## Step 05: Update the package index and install Jenkins

Now that we have added the Jenkins repository to our system, we can update the package index and install Jenkins. You can do this by running the following commands:

```
sudo apt update
sudo apt install jenkins -y
```

The first command updates the package index on your system with the new Jenkins repository, and the second command installs the Jenkins package.

## Step 06: Start the Jenkins service

After Jenkins is installed, we need to start the Jenkins service. You can do this by running the following command:

```
sudo systemctl start jenkins
```

This command starts the Jenkins service, which will allow us to access Jenkins via a web browser.

## Step 07: Check the status of the Jenkins service

To make sure that Jenkins is running correctly, we can check the status of the Jenkins service. You can do this by running the following command:

```
sudo systemctl status jenkins
```

This command will show you the current status of the Jenkins service. If everything is running correctly

![image](https://user-images.githubusercontent.com/106432527/220929110-8e1a0d44-6403-43c4-87d6-0a475447ccb3.png)

By default, Jenkins runs on port 8080. However, we want to run Jenkins on port 9090 in this guide. To do this, we need to modify the Jenkins configuration file. You can do this by running the following command:

```
sudo nano /etc/default/jenkins
```

This command opens the Jenkins configuration file in the Nano text editor. You need to find the line that starts with ```HTTP_PORT=``` and change the value to ```HTTP_PORT=9090```.

![image](https://user-images.githubusercontent.com/106432527/220929383-7f086da3-9bf2-42b8-9b45-89d6b49dab88.png)

![image](https://user-images.githubusercontent.com/106432527/220929400-fe6c332d-4904-499d-b8db-384807977af4.png)

Save and exit the file by pressing ```Ctrl+X```, ```Y```, and ```Enter```.

## Step 09: Restart the Jenkins service

After modifying the Jenkins configuration file, we need to restart the Jenkins service for the changes to take effect. You can do this by running the following command:

```
sudo systemctl restart jenkins
```

## Step : 10 Opening port 9090 in the security group associated with the instance.

Select the instance on which Jenkins is installed and in the bottom pane, select the “Security” tab now click the name of the security group associated with the instance.

The in the “Inbound rules” tab, click the “Edit inbound rules” button and click the “Add rule” button and select “Custom TCP Rule” and Set the “Port range” to 9090 and in the “Source” field, enter “0.0.0.0/0” to allow incoming traffic from any IP address.

![image](https://user-images.githubusercontent.com/106432527/220929660-cd701f8d-3fea-480b-a053-419d40bcf9d7.png)

Then click the “Save rules” button to apply the changes.

These steps will ensure that traffic on port 9090 is allowed through the instance’s security group, allowing Jenkins to be accessed on that port.

## Step 11: Access Jenkins via a web browser

Now that Jenkins is running on port 9090, we can access it via a web browser. Open your web browser and enter the following URL in the address bar:

```
http://<your-ec2-instance-ip>:9090
```

Replace ```<your-ec2-instance-ip>``` with the public IP address of your EC2 instance.

You should see the Jenkins login page.

![image](https://user-images.githubusercontent.com/106432527/220929847-01b53707-b22d-4307-a270-c377234755e8.png)

You can log in with the username ```admin``` and the password that you can find on the EC2 instance by running the following command:

```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy the automatically-generated alphanumeric password (between the 2 sets of asterisks). On the Unlock Jenkins page, paste this password into the Administrator password field and click Continue.

## Step 12: Customize Jenkins
Recommended selecting Install suggested plugins to ```install the recommended set of plugins``` based on most common use cases.

The setup wizard shows the progression of Jenkins plugins being installed

![image](https://user-images.githubusercontent.com/106432527/220930043-8833ee5a-7f31-4096-99e4-6c85bfac76e8.png)

![image](https://user-images.githubusercontent.com/106432527/220930056-f10632d9-adcb-4824-8cad-66682e49bfa5.png)

## Step 13: Create First Admin User

Enter the details to create admin user and click continue,

![image](https://user-images.githubusercontent.com/106432527/220930115-dd67afde-0663-4999-b548-d7fcb4ebd180.png)

## Step 14: Configure Valid DNS (if required)

Jenkins Instance access URL will be printed on the screen that follows. This can be changed with a valid DNS name. For the purpose of our demo, we will leave it as unchanged and click Save and Finish,

## Step 15: Jenkins is now ready, Jenkins now successfully configured.

![image](https://user-images.githubusercontent.com/106432527/220930185-92b0d680-3e83-4aa5-aad2-255aa5729b02.png)

## Step 16: Let’s click on Start using Jenkins!!

![image](https://user-images.githubusercontent.com/106432527/220930210-fd2906e7-00f2-4d2c-8277-35b8ae59676e.png)



Jenkins is a powerful automation server that can help you streamline your software development process. In this guide, we have walked through the steps to install Jenkins on an EC2 instance with port 9090 and access it via a web browser. We have also explained how to add your project files to a GitHub repository. By following these steps, you can take advantage of the many features and benefits of Jenkins to improve your software development process.








