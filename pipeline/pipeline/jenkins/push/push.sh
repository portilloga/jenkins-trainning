#!/bin/bash

echo "#########################"
echo "*** Preparing to push ***"
echo "#########################"

REGISTRY="registry:2"
IMAGE="app"

echo "*** Logging in ***"
#docker login -u user1 -p $PASS $REGISTRY
echo "*** Tagging IMAGE ***"
docker tag $IMAGE:$BUILD_TAG $REGISTRY/$IMAGE:$BUILD_TAG
echo "*** Pushing IMAGE ***"
docker push $REGISTRY/$IMAGE:$BUILD_TAG