pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build') {
      parallel {
        stage('Compile') {ƒ
          steps {
            script {
              sh 'make build'
            }
          }
        }
        stage('Lint') {
          steps {
            script {
              sh 'make lint'
            }
          }
        }
      }
    }

    stage('Test') {
      parallel {
        stage('Unit Tests') {
          steps {
            script {
              sh 'make test'
            }
          }
        }
        stage('Integration Tests') {
          steps {
            script {
              sh 'make integration-test'
            }
          }
        }
      }
    }

    stage('Deploy') {
      when {
        branch 'main'
      }
      steps {
        script {
          sh 'make deploy'
        }
      }
    }
  }

  post {
    success {
      echo 'Pipeline executed successfully!'
    }
    failure {
      echo 'Pipeline failed!'
    }
  }
}
