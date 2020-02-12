Jenkins EKS Pipeline
------------------

This Jenkins pipeline deploys a web application in Amazon Elastic Kubernetes Service using CodeCommit for version control and Amazon ECR for container registry. 

<img src="img/diagram1.png" width="80%">

**Jenkins Pipeline Steps**

1. Download code from CodeCommit repository
2. Create container image
3. Push container image to Amazon ECR
4. Deploy application in Amazon EKS


**Requirements**

* Create two repositories in CodeCommit. One for the application code and the other one for the Jenkins pipeline
* Create ECR registry
- Create password credentials in Jenkins for ECR and CodeCommit
  ![jenkins-credentials](img/jenkins_credentials.png)
 - Create Jenkins pipeline and add the CodeCommit repository URL in the SCM section
  ![jenkins-pipeline](img/jenkins_pipeline.png)
- Create EKS Cluster in AWS and node groups
- [Install kubectl on Jenkins machine to connect to AWS EKS cluster](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
- [Install AWS IAM authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
