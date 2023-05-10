pipeline{
    agent any
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
            }
        }
        stage('Pushing image'){
            steps{
            sh 'docker push mjmansi27/my-docker:${BUILD_NUMBER}'
            }
        }
        stage('Deploy to k8s'){
            steps{
                script{
                     withCredentials([file(credentialsId: 'k8s-cf-new', variable: 'k8spwd')]) {         
                        sh 'kubectl apply --kubeconfig=$k8spwd -f deployservice.yml'
                        sh 'kubectl --kubeconfig=$k8spwd set image deployment/final-capstone-deploy final-deploy-container=mjmansi27/my-docker:${BUILD_NUMBER}'
                        echo 'Deploy completed...'
                    }
                }
            }
        }
        stage('Generate Artifact'){
            steps{
                script{
                    sh 'tar -cf myapp.tar ./ '
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
