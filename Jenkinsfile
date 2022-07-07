pipeline {
   agent any
   environment {
        TempContainerName = "nodedemo:${BUILD_NUMBER}"
    }
    stages {
        stage('Package') {
            agent { dockerfile { filename 'cicd/package.Dockerfile'} }
            steps {
                sh(script: """
                    node --version
                   echo ${BUILD_NUMBER}
                   echo ${TempContainerName}
                """)
            }
        }

        
        stage('Test') {
            agent any
            steps{
                sh(script: """ 
                    echo ${BUILD_NUMBER} 
                    docker build cicd/package.Dockerfile -t ${TempContainerName}                 
                    """, returnStdout: true) 
            }
        }

        stage('Image Build') {
            steps{
                sh script: '''
                #!/bin/bash
                
                docker build . --network host -t aimvector/python:${BUILD_NUMBER}
                '''
            }
        }

        stage('Image Push') {
            steps{
                sh(script: """
                    docker push aimvector/python:${BUILD_NUMBER}
                """)
            }
        }

       
    }
}