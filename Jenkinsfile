pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1'
    }
    stages {
        stage('Checkout') {
            steps {
                // Clonar el repositorio
                git branch: 'main', url: 'https://github.com/jrojas02/globantchallenge.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('devops') {
                    // Inicializar Terraform
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('devops') {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                                      accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                      secretKeyVariable: 'AWS_SECRET_ACCESS_KEY', 
                                      credentialsId: 'aws-credentials-dev-env']]) {
                        // Crear el plan de Terraform
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('devops') {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                                      accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                      secretKeyVariable: 'AWS_SECRET_ACCESS_KEY', 
                                      credentialsId: 'aws-credentials-dev-env']]) {
                        // Aplicar la configuración de Terraform
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completado exitosamente.'
        }
        failure {
            echo 'Pipeline fallido.'
        }
    }
}
