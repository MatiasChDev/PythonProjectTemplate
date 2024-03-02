pipeline {
    agent { label 'docker' }
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build --target=testing .'
            }
        }
        stage('Install Dependencies') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    sh 'docker run --rm $(docker build --target=testing -q .) poetry show'
                }
            }
        }
        stage("Check Linting") {
            steps {
                sh 'docker run --rm $(docker build --target=testing -q .) poetry run nox -s lint'
            }
        }
        stage("Run Unit Tests") {
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    sh 'docker run --rm $(docker build --target=testing -q .) poetry run nox -s tests'
                }
            }
        }
    }
    post {
        success {
            echo 'Pipeline ran successfully!'
        }
        failure {
            echo 'Pipeline failed :('
        }
        always {
            echo 'Cleanup'
            sh 'docker rmi $(docker build --target=testing -q .)'
        }
    }
}
