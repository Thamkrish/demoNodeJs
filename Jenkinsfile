pipeline {
   agent any
   environment {
        TempContainerName = nodedemo:${BUILD_NUMBER}
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
                        """, returnStdout: true) 
            }
        }

        stage('Image Build') {
            steps{
                sh script: '''
                #!/bin/bash
                cd $WORKSPACE/docker-development-youtube-series/python
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