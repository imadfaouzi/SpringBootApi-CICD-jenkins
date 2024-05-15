pipeline {
    agent any
    tools {
        maven "maven_3_9_6"
    }

    stages {
        stage('Build Maven') {
            steps {
                // Chekout repo
               checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/imadfaouzi/SpringBootApi-CICD-jenkins']])
               sh "mvn clean install"

            }
        }
         
    }
}