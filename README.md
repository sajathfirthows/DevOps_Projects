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

```
sudo yum update
```

This command updates the package index and ensures that you have access to the latest versions of the software available in the repository.

## Step 3: Install Nginx

To install Nginx, run the following command:

you’ll need to run “amazon-linux-extras” to get nginx installed

```
sudo amazon-linux-extras install nginx1.12
```

To confirm that NGINX has been installed, use the “list” sub-command for “yum”

```
sudo yum list install nginx
```

![image](https://user-images.githubusercontent.com/106432527/218158007-3c5751b1-d20a-41ad-8bea-3ef899843dde.png)

## Step 4: Start the Nginx service

To start the Nginx service, run the following command:

```
sudo service nginx start
```

This command starts the Nginx service and ensures that it is running in the background.

## Step 5: Verify the installation

To verify the installation, open a web browser and enter the public DNS of your EC2 instance. You should see the default Nginx welcome page, which confirms that Nginx is up and running on your EC2 instance.

![image](https://user-images.githubusercontent.com/106432527/218158206-15df5793-ff7d-4798-a37f-d29c87b043f7.png)

That’s it! You have successfully installed Nginx on your Amazon Linux EC2 instance. You can now start configuring Nginx to serve your web content.

### Now let’s Set up Sample Files on an Installed Amazon Linux EC2 Instance

Now that you have Nginx installed on your Amazon Linux EC2 instance, it’s time to set up some sample files to test your server.

## Step 06: Create a sample HTML file

Create a sample HTML file in the Nginx document root directory. The default document root for Nginx on Amazon Linux is /usr/share/nginx/html. To create a sample HTML file, run the following command:

```
sudo nano /usr/share/nginx/html/index.html 

```
This command creates a new file called index.html in the Nginx document root directory.

## Step 7: Add sample HTML content

Add the following sample HTML content to the index.html file:

```
<html>
<head>
<title>Welcome to Nginx</title>
</head>
<body>
<h1>Hi, Hope you're doing well!</h1>
</body>
</html>
```

This sample HTML content will be displayed when you access the Nginx server in a web browser.

![image](https://user-images.githubusercontent.com/106432527/218158464-a2f3f875-0825-4329-b5c5-740c717e134b.png)

Save and close the file.

## Step 8: Restart the Nginx service

To make sure that the changes to the index.html file take effect, restart the Nginx service by running the following command:

```
sudo service nginx restart
```

This command restarts the Nginx service and applies the changes to the index.html file.

## Step 6: Verify the setup

To verify the setup, open a web browser and enter the public DNS of your EC2 instance. You should see the sample HTML content that you added to the index.html file.

![image](https://user-images.githubusercontent.com/106432527/218158643-ed8af4d3-d9d0-4e85-bebe-8239bcccc3a9.png)

In conclusion, the above steps provide a clear and concise guide to setting up sample files on an Amazon Linux EC2 instance with Nginx installed. By following these steps, you can test your Nginx server and verify that it is working as expected.

<hr style="border:2px solid gray">

