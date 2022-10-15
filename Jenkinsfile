pipeline {
  agent any

  options {
      ansiColor('xterm')
    }

  parameters {
    choice(name: 'ENV', choices: ['', 'dev', 'prod'], description: 'specify environment')
    text(name: 'COMPONENT', defaultValue: '', description: 'give component name')
  }

  stages {
    stage ('terraform') {
      steps {
        sh '''
          terraform init
          terraform apply -auto-approve -var ENV=${ENV} -var COMPONENT=${COMPONENT}
        '''
        }
      }
    }
  post {
      always {
        cleanWs ()
        }
      }
  }