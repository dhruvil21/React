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
            git(url: 'https://github.com/dhruvil21/React.git', branch: 'master', credentialsId: '9222b58c-7731-4f1a-abfb-0258e2098443')
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
      post {
        always {
          archiveArtifacts(artifacts: 'build/**/*.zip', fingerprint: true)
        }

      }
      steps {
        sh 'npm install'
        sh 'npm run build'
      }
    }

    stage('Transfering the code') {
      steps {
        sh 'tar -czf - build | ssh test@192.168.9.5 "tar -C /var/www/dms -xzf -"'
      }
    }

  }
}