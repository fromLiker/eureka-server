pipeline {
  agent none
  environment {
    DOCKERHUBNAME = "liker163"
  }
  stages {
    stage('maven Build') {
      agent {
        docker {
          image 'maven:3-alpine'
          args '-v /root/.m2:/root/.m2'
        }
      }
      steps {
        sh 'mvn -B -DskipTests clean package'
        // sh 'mvn package -Dmaven.test.skip=true'
        // sh 'mvn clean package'
      }
    }

    stage('docker build & push & run') {
      agent any
      steps {
        // withCredentials([usernamePassword(credentialsId: 'liker163ID', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          // sh 'docker login -u $USERNAME -p $PASSWORD'
          sh 'docker image build -t ${DOCKERHUBNAME}/teureka .'
          // sh 'docker push ${DOCKERHUBNAME}/exchange'
          // sh 'docker run -d -p 8754:8754 --network smc-net --name smcexchange ${DOCKERHUBNAME}/exchange'
          sh 'docker run -d -p 8761:8761 ${DOCKERHUBNAME}/teureka'
        // }
      }
    }

    stage('clean workspace') {
      agent any
      steps {
        // clean workspace after job finished
        cleanWs()
      }
    }
  }
}
