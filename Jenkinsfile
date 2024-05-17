pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('a5fe5e55-b69e-4c5d-8e77-4b4e9a5d8a72')
  }
  stages {
    stage("Git Checkout"){           
      steps{                
	git credentialsId: 'github', url: 'https://github.com/Aswin-tech-07/jenkin-practice.git'                 
	echo 'Git Checkout Completed'            
      }        
    }
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
