pipeline {
    agent { label 'docker' }
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build .'
            }
        }
        stage('Install Dependencies') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    sh 'docker run --rm $(docker build -q .) poetry show'
                }
            }
        }
        stage("Run Unit Tests") {
            steps {
                timeput(time: 10, unit: 'MINUTES') {
                    sh 'docker run --rm $(docker build -q .) poetry run nox -s tests'
                }
            }
        }
    }
}
