## Before you run the command, you need to be authenticated with the AWS by running
## aws configure and pass all the reuqired information.

#For the entire Meta data associated with the instance
read -p 'Instance id:' instanceId

aws ec2 describe-instances --instance-ids $instanceId --output json > ec2Instance-metadata.json

#For Specific Field, we need to use --query parameter and pass the key in Query as I have passed below few examples
aws ec2 describe-instances --query 'Reservations[*].Instances[*].{Instance:InstanceId, PrivateIpAddress:PrivateIpAddress, AZ:Placement.AvailabilityZone}'  --output json > ec2Specific-metadata.json
