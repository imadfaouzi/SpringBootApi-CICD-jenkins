pipeline {
    agent any
    tools {
        maven "maven_3_9_6"
        docker 'docker'
    }

    stages {
        // stage('Build Maven') {
        //     steps {
        //         // Chekout repo
        //        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/imadfaouzi/SpringBootApi-CICD-jenkins/']])
        //         //    sh "mvn clean install" 
        //         sh 'mvn clean package -DskipTests'
        //     }
        // }

        //  stage('Build Docker image') {
        //       steps {
        //           script{
        //               sh "docker build -t imadfa01/simpleapi_devops_cicd ."
        //             }
        //       }
        //  }

         stage('Push image to hub') {
              steps {
                  script{
                      withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                              sh "docker login -u imadfa01 -p ${dockerhubpwd}"
                       }
                       
                    }
              }
         }
    }
}