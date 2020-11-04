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
            sh '''sh(script: "rm -rf .", label: "DELETING Stuff")
'''
          }
        }

      }
    }

  }
}