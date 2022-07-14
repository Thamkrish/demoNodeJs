docker build . -f container/packageBase.Dockerfile -t ${TempContainerName}   
echo ${BUILD_NUMBER}
echo ${TempContainerName} 