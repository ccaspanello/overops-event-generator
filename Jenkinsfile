pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }

  }
  stages {
    stage('Download Agent') {
      steps {
        sh '''yum -y install wget
wget --content-disposition https://app.overops.com/app/download?t=sa-tgz
tar -xzf  takipi-agent-*.tar.gz
rm takipi-agent*%'''
      }
    }

    stage('Build & Test') {
      steps {
        sh '#./mvnw clean install'
      }
    }

  }
}