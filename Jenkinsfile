pipeline {
   agent any
    stages {
        stage('Package') {
            agent { dockerfile { filename 'cicd/package.Dockerfile'} }
            steps {
                sh(script: """
                    node --v
                   echo ${BUILD_NUMBER}
                """)
            }
        }

        
        stage('Test') {
            steps{
                sh(script: """ 
                npm install                     
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