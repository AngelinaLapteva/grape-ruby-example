pipeline {
    agent { any { image 'ruby' } }
    stages {
        stage('build') {
            steps {
                sh 'ruby --version'
                echo 'Test print!'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
         stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}