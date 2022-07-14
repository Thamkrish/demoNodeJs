docker build . -f cicd/container/packageBase.Dockerfile -t ${TempContainerName}   
echo ${BUILD_NUMBER}
echo ${TempContainerName} 