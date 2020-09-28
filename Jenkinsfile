pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
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