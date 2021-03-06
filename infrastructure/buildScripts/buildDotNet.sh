#!/bin/bash
CONTAINER_NAME=${1:?Must provide container name}
CONTAINER_REGISTRY=${2:-"profesor79"}
CONTAINER_TAG=${3:-"latest"}
git add *

# commit changes
git commit -m "Automatic commit for container: $CONTAINER_NAME push started" -a


for DIR in bin obj publish
do
echo "deleting $DIR in $(pwd)"
 find  -type d -name $DIR  -exec rm -rf  {} +
done
# stop script on error


for script in *.csproj
do
echo "*********************************************"
  echo -e "building project: %s\n" "$script"
  dotnet clean $script
  dotnet publish $script -o publish

echo "*********************************************"
done

CONTAINER_GIT_TAG="$(git rev-parse HEAD)"

echo "calLing build script with parameters:"+ $CONTAINER_NAME, $CONTAINER_REGISTRY, $CONTAINER_TAG, $CONTAINER_GIT_TAG
docker build -t $CONTAINER_REGISTRY/$CONTAINER_NAME:$CONTAINER_TAG .
docker tag  $CONTAINER_REGISTRY/$CONTAINER_NAME:$CONTAINER_TAG $CONTAINER_REGISTRY/$CONTAINER_NAME:$CONTAINER_GIT_TAG
docker push $CONTAINER_REGISTRY/$CONTAINER_NAME:$CONTAINER_TAG
docker push $CONTAINER_REGISTRY/$CONTAINER_NAME:$CONTAINER_GIT_TAG
set +e




