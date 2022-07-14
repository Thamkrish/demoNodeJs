docker build . -f cicd/package.Dockerfile -t ${TempContainerName}   
echo ${BUILD_NUMBER}
echo ${TempContainerName}