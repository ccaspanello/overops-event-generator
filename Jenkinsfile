pipeline {

  agent {
    docker {
      image 'maven:3.6.3-openjdk-8'
      args '--network=host'
    }
  }

  stages {
    stage('Build & Test') {
      steps {
        withMaven(){
          sh 'mvn clean package'
        }

      }
    }
  }
}