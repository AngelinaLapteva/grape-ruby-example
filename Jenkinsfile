pipeline {
  agent { any { image 'ruby' } }
    stages {
      stage('requirements') {
          steps {
            sh 'rbenv install 2.6.3'
            sh 'gem install bundler -v 2.1.4'
          }
      }
      stage('build') {
          steps {
              sh 'ruby --version'
              echo 'Installinng all gems'
              sh 'bundle install'
          }
      }
      stage('Test') {
          steps {
              echo 'Testing..'
              sh 'bundle exec rake test'
          }
      }
    }
}