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
                              
                    """, returnStdout: true) 
            }
        }

        stage('Image Build') {
             agent any
            steps{
                sh script: '''
                #!/bin/bash
                 docker build . -f cicd/package.Dockerfile -t ${TempContainerName}  
                '''
            }
        }

        stage('Image Push') {
            steps{
                sh(script: """
                    echo ${BUILD_NUMBER} 
                """)
            }
        }

       
    }
}