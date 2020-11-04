pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            echo 'Hello'
          }
        }

        stage('Preparation') {
          steps {
            sh '''pwd
ls'''
          }
        }

      }
    }

    stage('Connecting') {
      steps {
        sh 'ssh test@192.168.9.5 bash /home/test/testing/before_update.sh'
      }
    }

  }
}