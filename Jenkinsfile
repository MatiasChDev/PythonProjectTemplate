pipeline {
    agent { docker { image 'matiasch/python3.11-poetry1.7' } }
    stages {
        stage('Install Dependencies') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    sh 'poetry install'
                    sh 'poetry shell'
                    sh 'pip freeze'
                }
            }
        }
    }
}
