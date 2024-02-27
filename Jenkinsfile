pipeline {
    agent { docker { image 'matiasch/python3.11-poetry1.7' } }
    stages {
        stage('build') {
            steps {
                sh 'python --version'
                sh 'poetry -V'
            }
        }
    }
}
