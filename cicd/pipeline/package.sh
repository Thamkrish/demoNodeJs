docker build . -f cicd/container/packageBase.Dockerfile -t ${TempContainerName}   
docker build . -f cicd/container/testImage.Dockerfile -t test${TempContainerName}  --build-arg FROM=${TempContainerName}
echo ${BUILD_NUMBER}
echo ${TempContainerName} 