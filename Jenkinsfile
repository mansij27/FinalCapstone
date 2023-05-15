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
                 kubeconfig(credentialsId: 'dd0be6cc-e44a-4f8e-a93a-c2b09f4fb10d', serverUrl: '') {
                           sh ' kubectl get pods '
//                         sh 'kubectl --kubeconfig=$var1 apply -f deployservice.yml'
//                         sh 'kubectl --kubeconfig=$var1 set image deployment/final-capstone-deploy final-deploy-container=mjmansi27/my-docker:${BUILD_NUMBER}'
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
