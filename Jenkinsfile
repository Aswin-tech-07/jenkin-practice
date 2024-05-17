pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerkey')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t aswin3498/practicejenkins:latest .'
	    echo 'docker build completed'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
	    echo 'docker logged in'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push aswin3498/practicejenkins:latest'
	    echo 'docker image published'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
      echo 'docker logged out'
    }
  }
}
