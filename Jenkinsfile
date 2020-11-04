pipeline {
  agent any
  stages {
    stage('Testing') {
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

    stage('SSH') {
      steps {
        sh 'ssh test@192.168.9.5  < before_update.sh'
      }
    }

    stage('Building') {
      steps {
        sh 'npm install'
        sh 'npm run build'
        sh 'zip -r build.zip .'
      }
    }

    stage('Transfering the code') {
      parallel {
        stage('Transfering the code') {
          steps {
            sh 'tar -czf - build | ssh test@192.168.9.5 "tar -C /var/www/dms -xzf -"'
          }
        }

        stage('') {
          steps {
            sh 'scp -r build.zip test@192.168.9.5:/var/www/advam-api'
          }
        }

      }
    }

  }
}