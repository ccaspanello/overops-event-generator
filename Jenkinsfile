pipeline {
  agent {
    docker {
      image 'overops/collector'
    }

  }
  stages {
    stage('Download Agent') {
      steps {
        sh '''wget --content-disposition https://app.overops.com/app/download?t=sa-tgz
tar -xzf  takipi-agent-*.tar.gz
rm takipi-agent*'''
      }
    }

    stage('Build & Test') {
      steps {
        sh './mvnw clean install'
      }
    }

  }
}