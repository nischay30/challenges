## For this challenge, there are two ways to do it

#1 - Use Aws Cli, where you need to configure befor you execute the below command
```
sh metadata.sh
```

In this approach, it will save the output in the json file named as `ec2Instance-metadata.json` and `ec2Specific-metadata.json`. Second file is for specific metadata.


#2 - Using terraform, it's not perfect but could be a way to import the instance and process it via `jq`.  Before you run the below command, define `access key` and `secret key` in `variables.tf`

```
terraform import aws_instance.dev-test $InstanceId && jq '.resources[].instances[]' terraform.tfstate
```
Replace `$InstanceId` with the Instance id