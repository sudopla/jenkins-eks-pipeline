Jenkins EKS Pipeline
------------------

This Jenkins pipeline uses    using Amazon CodeCommit for 

![diagram](img/diagram1.PNG)

Jenkins Pipeline Steps

	1. Download code from CodeCommit repository

	2. Create container image

	3. Push container image to Amazon ECR

	4. Deploy application in Amazon EKS


Requirements

	- Create ECR, CodeCommit and EKS (in the future add CloudFormation template for this)
	 Two repositories in CodeCommit - one for application code other for Jenkins pipeline
	- Create Credentials in Jenkins for ECR user, CodeCommit user and EKS 

	- Create EKS Cluster in AWS and node groups
	- Install kubectl to connect to AWS EKS cluster
		○ Install kubect - l https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html
		○ Install AWS IAM authenticator- https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html
