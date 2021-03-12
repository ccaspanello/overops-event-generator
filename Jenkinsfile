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
          sh 'mvn clean package -DskipTests'
        }
        sh '''
wget -q --content-disposition https://app.overops.com/app/download?t=sa-tgz
tar xvzf takipi-agent-*.tar.gz
echo takipi.deployment.name=job-${CI_COMMIT_SHORT_SHA} > takipi/agent.properties
echo takipi.application.name=${CI_PROJECT_NAME} >> takipi/agent.properties
echo takipi.collector.host=192.168.0.115 >> takipi/agent.properties
echo takipi.collector.port=${TAKIPI_LISTEN_PORT} >> takipi/agent.properties
echo shutdownGraceTime=20000 >> takipi/agent.properties
mvn -DargLine=-agentpath:./takipi/lib/libTakipiAgent.so test
        '''
      }
    }
  }
}