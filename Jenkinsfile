pipeline { 
    agent any 
    
    environment {
        codecommit_login = credentials('CodeCommit_Credentials')
        codecommit_repository_address='git-codecommit.us-east-1.amazonaws.com/v1/repos/aws-django-app'
        ecr_repository_address='076011264493.dkr.ecr.us-east-1.amazonaws.com/aws_app'
        aws_keys_ecr=credentials('AWS_CREDENTIALS_ECR')
        aws_keys_eks=credentials('AWS_CREDENTIALS_EKS')
        aws_region='us-east-1'
        eks_cluster_name=EKS_CLUSTER
    }
    
    stages {
        stage('Build') { 
            steps {
                  sh '''
                    ./build/download_code.sh $codecommit_login_USR $codecommit_login_PSW $codecommit_repository_address
                    ./build/create_container_image.sh $ecr_repository_address $BUILD_NUMBER
                    ./build/push_container_image.sh $aws_keys_ecr_USR $aws_keys_ecr_PSW $aws_region $ecr_repository_address $BUILD_NUMBER
                  '''
            }
        }
        stage('Test'){
            steps {
                echo 'Still need to implement testing ...' 
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                  ./deploy/deploy_container.sh $aws_keys_eks_USR $aws_keys_eks_PSW $aws_region $ecr_repository_address $BUILD_NUMBER $eks_cluster_name
                '''
            }
        }
    }
}
