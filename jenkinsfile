pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    git 'https://github.com/Nirajkumar18/website.git'
                    sh 'docker build -t webapp .'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'docker run -d -p 8080:80 --name webapp_test webapp'
                    sh 'docker exec webapp_test /path/to/test/script.sh'
                }
            }
        }
        stage('Deploy') {
            when {
                branch 'master'
            }
            steps {
                script {
                    sh 'docker tag webapp myregistry/webapp:latest'
                    sh 'docker push myregistry/webapp:latest'
                    sh 'docker run -d -p 80:80 --name webapp_prod myregistry/webapp:latest'
                }
            }
        }
    }

    post {
        always {
            script {
                sh 'docker rm -f webapp_test'
            }
        }
    }
}
