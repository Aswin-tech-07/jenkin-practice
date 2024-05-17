pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('a5fe5e55-b69e-4c5d-8e77-4b4e9a5d8a72')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t aswin3498/practicejenkins:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push aswin3498/practicejenkins:latest'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
