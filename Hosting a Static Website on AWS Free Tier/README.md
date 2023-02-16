# Hosting a Static Website on AWS Free Tier

![image](https://user-images.githubusercontent.com/106432527/219456020-28bce88f-82c0-4678-8ec4-2b5e926b2914.png)

AWS (Amazon Web Services) is a popular cloud computing platform that offers a wide range of services to its users. One of these services is AWS S3 (Simple Storage Service), which allows you to store and retrieve data over the internet. In this guide, we will show you how to host a static website on AWS using the free tier account.

## Step 1: Setup an AWS Account and Set Up S3

To begin, you need to create an AWS account if you do not already have one. Now I have an existing account and I am SSH into an EC2 now,

![image](https://user-images.githubusercontent.com/106432527/219456153-0fa2bab6-6228-4043-81d7-ed34e57901ed.png)

Then Once you have an account, log in to the AWS console and navigate to the S3 service. Click on the “Create bucket” button,

![image](https://user-images.githubusercontent.com/106432527/219456251-e74b2968-9b0e-416c-b4b4-7b990c27c9c7.png)

Choose a globally unique name for your bucket. Keep the region as “US East (N. Virginia)” for this guide, as it is eligible for free tier usage. For the remaining settings, leave them as default,

![image](https://user-images.githubusercontent.com/106432527/219456301-3a591b39-b4cf-4ff7-ac93-6dce2fea6e3d.png)

then click on “Create bucket.”

![image](https://user-images.githubusercontent.com/106432527/219456350-b6963c0b-ce2c-4592-8bb6-6d2a8647fd81.png)

## Step 2: Upload Website Content to S3 Bucket

Next, you need to upload your website content to the S3 bucket. To do this, select the bucket you just created, and then click on the “Upload” button. You can upload your files by dragging and dropping them into the upload window or you can open your favorite text editor and paste following sample HTML page. I am pasting my web content in it.

```
<html>
<head>
<title>Welcome to Website!</title>
</head>
<body>
<h1>I am Sajath Firthows</h1>
</body>
</html>
```

## Step 3: Make Your Website Publicly Accessible

By default, your S3 bucket and its contents are private, meaning that they cannot be accessed by the public. To make your website publicly accessible, you need to modify the bucket policy. To do this, click on the “Permissions” tab of your bucket,

![image](https://user-images.githubusercontent.com/106432527/219456532-49f2c3c8-770d-45ee-a170-9ac67d32f8b2.png)

and then click on the “Bucket Policy” button. Paste the following policy into the policy editor, replacing “your-bucket-name” with the name of your S3 bucket.

![image](https://user-images.githubusercontent.com/106432527/219456646-929e950d-4822-41cc-90cd-dd17f2d0f981.png)

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::my-s3-project-site/*"
        }
    ]
}
```

The following example policy requires every object that is written to the bucket to be encrypted with server-side encryption using AWS Key Management Service (AWS KMS) keys (SSE-KMS). If the object isn’t encrypted with SSE-KMS, the request will be denied.

Click on “Save” to save the bucket policy. This policy allows anyone to access your website content by entering the URL of your S3 bucket.

## Step 4: Configure Website Hosting

To configure your S3 bucket to act as a website host, go to the “Properties” tab of your bucket, and then click on “Static website hosting.” Select “Use this bucket to host a website,” and enter the name of your index document (e.g., index.html) and error document (e.g., error.html). Click on “Save” to save the configuration.

![image](https://user-images.githubusercontent.com/106432527/219456776-6f598916-8975-472c-a906-79df03993811.png)

Step 5: Test Your Website

To test your website, enter the following URL in your web browser: http://your-bucket-name.s3-website-us-east-1.amazonaws.com. This should display your website content.

![image](https://user-images.githubusercontent.com/106432527/219456870-9b80ca3d-8978-4430-a36b-71c798f49eba.png)

## Step 7: Add Source Code to GitHub

To make your website code accessible to others, you can add it to GitHub. Create a new repository on GitHub,

To make your website code accessible to others, you can add it to GitHub. Create a new repository on GitHub, and then use the following commands to push your website content to the repository:

```
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/your-username/your-repo-name.git
git push -u origin master
```

Replace “your-username” and “your-repo-name” with your GitHub username and repository name, respectively. This will upload your website files to GitHub.

Congratulations, you have successfully hosted a static website on AWS using the free tier account. Your website is now publicly accessible through the S3 bucket URL or your custom domain name. You can continue to modify and update your website content as needed, and push changes to your GitHub repository to keep a backup of your code.

hosting a static website on AWS is a straightforward process that can be done using the free tier account. With this project, we have covered the necessary steps to host a static website on AWS, including creating an S3 bucket, uploading website content, making the website publicly accessible, configuring website hosting, testing the website, adding a custom domain name, and adding the website source code to GitHub. By following this tutorial, even beginners can learn how to host their website on AWS and make it accessible to the public. AWS is a powerful platform that offers a wide range of services for hosting and managing websites, and this project is an excellent starting point for anyone who wants to learn how to use it.


