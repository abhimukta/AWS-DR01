#!/bin/bash
for region in `aws ec2 describe-regions --output text | cut -d"." -f2-2`
do
echo -e "\nListing Instances in region:'$region'..."
aws ec2 describe-instances --query "Reservations[*].Instances[*].{PublicIP:PublicIpAddress,ID:InstanceId,Type:InstanceType,State:State.Name,Tag-Name:Tags[0].Value}" --output=table --region $region
done
