#!/usr/bin/env bash
if [ -z $1 ]; then
  echo "Please supply the instance name."
  exit
fi

IP=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" --query "Reservations[*].Instances[*].NetworkInterfaces[*].Association.PublicIp" --output text)

if [ -z $IP ]; then
  echo "Host not found"
else
  ssh ec2-user@$IP
fi
