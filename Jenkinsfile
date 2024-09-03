pipeline {
    agent any
    stages {
        stage('List S3 Buckets') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                                  accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                  secretKeyVariable: 'AWS_SECRET_ACCESS_KEY', 
                                  credentialsId: 'aws-credentials-dev-env']]) {
                    script {
                        // Ejecuta el comando AWS CLI directamente
                        sh 'aws s3 ls'
                    }
                }
            }
        }
    }
}
