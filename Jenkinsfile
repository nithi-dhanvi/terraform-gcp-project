pipeline {
    agent any
    
    stages {
        stage('Git Checkout') {
            steps {
               git branch: 'main', url: 'https://github.com/nithi-dhanvi/terraform-gcp-project.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Manual Approval') {
            steps {
                input "Approve?"
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply tfplan'
                }
            }
        }
    }
}
