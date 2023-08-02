pipeline {
    agent any

    environment {
      RAILS_ENV = 'test'
    }

    stages {
        stage('Create Database') {
            steps {
                sh RAILS_ENV=${RAILS_ENV} bundle install
                sh RAILS_ENV=${RAILS_ENV} rails db:create
                sh RAILS_ENV=${RAILS_ENV} rails db:migrate
            }
        }

        stage('Test') {
          steps {
            sh 'bundle exec rspec'
          }
        }
    }

    posts {
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
