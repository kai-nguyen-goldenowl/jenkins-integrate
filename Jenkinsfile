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
                echo "Test RSPEC"
                echo "testttt"
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
        setBuildStatus("Build succeeded", "SUCCESS");
      }

      failure {
        setBuildStatus("Build failed", "FAILURE");
      }
    }
}


void setBuildStatus(String message, String state) {
  step([
      $class: "GitHubCommitStatusSetter",
      reposSource: [$class: "ManuallyEnteredRepositorySource", url: "https://github.com/kai-nguyen-goldenowl/jenkins-integrate"],
      contextSource: [$class: "ManuallyEnteredCommitContextSource", context: "ci/jenkins/build-status"],
      errorHandlers: [[$class: "ChangingBuildStatusErrorHandler", result: "UNSTABLE"]],
      statusResultSource: [ $class: "ConditionalStatusResultSource", results: [[$class: "AnyBuildResult", message: message, state: state]] ]
  ]);
}
