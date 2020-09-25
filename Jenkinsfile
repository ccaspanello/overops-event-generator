pipeline {
  agent {
    docker {
      image 'overops/collector'
    }

  }
  stages {
    stage('Download Agent') {
      steps {
        sh '''curl -sL https://s3.amazonaws.com/app-takipi-com/deploy/linux/takipi-agent-latest.tar.gz | tar -xz 
'''
      }
    }

    stage('Build & Test') {
      steps {
        sh '#./mvnw clean install'
      }
    }

  }
}