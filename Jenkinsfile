pipeline{
    agent any
    // docker {
    //     image 'myregistry.com/node'
    // }
    environment{
        DOCKERHUB_CREDENTIALS= credentials('mjmansi27-dockerhub')
    }
    stages{
        stage('Docker build'){
            steps{
                script{
                    sh 'docker build -t mjmansi27/my-docker .'
                }
            }
        }
        stage('Docker Login'){
            steps{
                sh 'echo $DOCKERHUB_CREDENTIASL_PSW | docker login -u $DOCKERHUB_CREDENTIASL_USR --password-stdin'
            }
        }
        stage('Pushing image'){
            steps{
                sh 'docker push mjmansi/my-docker:latest'
            }
        }
        stage ("Development"){
            steps {
                echo "Development finished successfully"
            }
        }
        stage ("Testing "){
            steps {
                echo "Testing finished successfully"
            }
        }
        stage ("Production"){
            steps {
                echo "Production finished successfully.."
            }
        }
    }
    post{
        always{
            sh 'docker logout'
        }
    }
}
