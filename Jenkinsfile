pipeline {
  agent {
    docker {
      image 'openjdk:8'
    }

  }
  stages {
    stage('Build & Test') {
      steps {
        sh './mvnw clean install'
      }
    }

  }
}