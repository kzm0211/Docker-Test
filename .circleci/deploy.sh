#!/bin/sh -ex

eval $(aws ecr get-login --region ap-northeast-1 --no-include-email)
docker push $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/inamuu-test01:$CIRCLE_SHA1
./ecs-deploy -r ap-northeast-1 --cluster inamuu-cluster1 --service-name inamuu-testapp --image $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/inamuu-test01:$CIRCLE_SHA1 -t 300