pipeline {
  agent {
    docker {
      image 'ubuntu:18.04'
    }

  }
  stages {
    stage('Build & Test') {
      steps {
        sh '#./mvnw clean install'
      }
    }

  }
}