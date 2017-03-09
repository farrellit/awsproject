#!/bin/bash
region=us-east-2
# todo : lookup current aws ami or some job to find one and create our own.
params="ParameterKey=AMI,ParameterValue=ami-fcc19b99 ParameterKey=KeyName,ParameterValue=$keyname"
args="--stack-name demo-mentoring --template-body file://stack.json --parameters $params"
# discover whether stack exists
aws cloudformation --region $region describe-stacks --stack-name demo-mentoring
if [ $? == 0 ]; then
  echo -e "\033[33mCreating stack\033[0m"
  aws cloudformation --region $region update-stack $args
else
  aws cloudformation --region $region create-stack $args
fi
		
