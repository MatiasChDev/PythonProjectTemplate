pipeline {
    agent { dockerfile=true }
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
    }
}
