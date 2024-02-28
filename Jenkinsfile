pipeline {
    agent { docker { image 'matiasch/python3.11-poetry1.7' } }
    stages {
        stage('Install Dependencies') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    sh 'poetry export -f requirements.txt --output requirements.txt'
                    sh 'pip install -r requirements.txt'
                    sh 'pip freeze'
                }
            }
        }
    }
}
