pipeline{
    agent any
    // docker {
    //     image 'myregistry.com/node'
    // }
    stages{
        stage('Docker build'){
            steps{
                script{
                    sh 'docker build -t mjmansi27/my-docker .'
                }
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
                echo "Production finished"
            }
        }
    }

}
