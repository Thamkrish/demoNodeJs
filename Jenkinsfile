pipeline {
   agent any
   environment {
        TempContainerName = "nodedemo:${BUILD_NUMBER}"
    }
    stages {
        stage('Package') {
             agent any 
            steps {
                sh './cicd/pipeline/package.sh'
            }
        }

        
        stage('Test') {
            agent {
                docker { image "test${TempContainerName}" }
            }
            steps{
                sh(script: """ 
                   # npm -v
                   # npm test
                   mocha test/testSec1.js --reporter spec
                    node --version
                    echo ${BUILD_NUMBER} 
                              
                    """, returnStdout: true) 
            }
        }

        stage('Image Build') {
             agent any
            steps{
                sh script: '''
                #!/bin/bash
                echo 1
                 #docker build . -f cicd/package.Dockerfile -t ${TempContainerName}  
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