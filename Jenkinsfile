pipeline {
    agent any

    environment {
      RAILS_ENV = 'test'
    }

    stages {
        stage('Create Database') {
            steps {
                echo 'Create database 123'
                sh "RAILS_ENV=test bundle install"
                sh "RAILS_ENV=test rails db:create"
                sh "RAILS_ENV=test rails db:migrate"
                echo "Test PR"
            }
        }

        stage('Test') {
          steps {
            sh 'bundle exec rspec'
          }
        }
    }

    post {
      always {
        echo 'Test run completed'
        cleanWs()
      }

      success {
        echo 'Successfully. Thanks God'
      }

      failure {
        echo 'Failed.'
      }
    }
}
