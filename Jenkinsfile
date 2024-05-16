pipeline {
    agent any

    tools {
        maven "maven_3_9_6"
    }

    environment {
        DOCKERHUB_USERNAME= 'imadfa01'
        IMAGE_NAME = 'simpleapi_devops_cicd'
        IMAGE_TAG = 'latest'
    }

    stages {

        stage('Build Maven') {
            steps {
                // Chekout repo
                // checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/imadfaouzi/SpringBootApi-CICD-jenkins/']])
                //    sh "mvn clean install" 
                sh 'mvn clean package -DskipTests'
            }
        }

         stage('Build Docker image') {
              steps {
                  script{
                      sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                    }
              }
         }

         stage('Push image to hub') {
              steps {
                  script{

                      withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                              sh "docker login -u ${DOCKERHUB_USERNAME} -p ${dockerhubpwd}"
                              sh "docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
                              sh "docker push ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
                       }
                       
                    }
              }
         }
    }
}