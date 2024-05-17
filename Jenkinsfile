pipeline {
    agent {
        docker {
            image 'docker:19.03.12-dind'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('your-credentials-id')
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t your-dockerhub-username/your-repo-name:latest .'
                echo 'Docker build completed'
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                echo 'Docker login successful'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push your-dockerhub-username/your-repo-name:latest'
                echo 'Docker image pushed'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
            echo 'Docker logout completed'
        }
    }
}
