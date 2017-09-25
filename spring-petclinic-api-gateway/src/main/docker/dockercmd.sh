#!/bin/sh

 imgname="$1"
 version="$2"
 username="$3"
 password="$4"

 ARTIFACT_NAME=${imgname}-${version}

echo pushing : ${ARTIFACT_NAME} .....
echo env variables : ${imgname} $version $username $password .....

buildPart=" docker build  -t ${imgname} --build-arg ARTIFACT_NAME=${ARTIFACT_NAME} ."

cmd="$buildPart"
$cmd
echo ****DOCKER BUILD********  executed with exit code : $? 
docker tag ${imgname}  ${username}/${imgname} 

docker push ${username}/${imgname} 
