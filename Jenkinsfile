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
                    sh 'docker build . -t mjmansi27/my-docker:$BUILD_NUMBER'
                }
            }
        }
        stage('Docker Login'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhub_pwd')]) {
                    sh 'docker login -u mjmansi27 -p $dockerhub_pwd'
                    }
                }
                // sh 'echo $DOCKERHUB_CREDENTIASL_PSW | docker login -u $DOCKERHUB_CREDENTIASL_USR --password-stdin'
            }
        }
        stage('Pushing image'){
            steps{
                sh 'docker push mjmansi27/my-docker:$BUILD_NUMBER'
            }
        }
        stage('Deploy to k8s'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'k8s-config', variable: 'k8spwd')]) {
//                         sh 'minikube start'
//                            sh 'minikube start'
                        
                        sh 'kubectl --kubeconfig=$k8spwd apply -f deployservice.yml'
                    }
                }
            }
        }
    }
    post{
        always{
            sh 'docker logout'
        }
    }
}
