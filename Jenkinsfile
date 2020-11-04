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

        stage('Cloning the Project') {
          steps {
            git(url: 'https://github.com/dhruvil21/React.git', branch: 'master', credentialsId: '8ba9c1b4-94f8-45a9-a86b-12b3f14bf961')
          }
        }

      }
    }

    stage('Testing Connecting Step') {
      steps {
        sh 'ssh test@192.168.9.5 bash /home/test/testing/before_update.sh'
      }
    }

  }
}