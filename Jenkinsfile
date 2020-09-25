pipeline {
  agent {
    docker {
      image 'overops/collector'
    }

  }
  stages {
    stage('Download Agent') {
      steps {
        sh '''curl -L https://app.overops.com/app/download?t=sa-tgz | tar -xz 
'''
      }
    }

    stage('Build & Test') {
      steps {
        sh './mvnw clean install'
      }
    }

  }
}