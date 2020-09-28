pipeline {
  agent {
    docker {
      image 'openjdk:8'
      args '--network=host'
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