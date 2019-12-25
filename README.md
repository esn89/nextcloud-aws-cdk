# Nextcloud and AWS CDK Python project

This is a project to deploy a dockerized Nextcloud on AWS with the AWS Cloud Development Kit.

There are a few manual steps needed to be done as some resources such as the EFS are in a [experimental state](https://docs.aws.amazon.com/cdk/api/latest/docs/aws-efs-readme.html).

This project also demonstrates using a multi-stack approach to create a networking layer, database, storage and an autoscaling group with a load balancer.

NetworkStack - creates subnets, VPCs and routes and route tables
RDSStack - creates a MySQL instance
EFSStack - creates an elastic file store
ASGStack - contains the code for an autoscaling group, application loadbalancer
and some security groups to allow the load balancer to access the instance.  Also
contains an example on how to load user data into the instance.



## Useful commands

 * `cdk ls`          list all stacks in the app
 * `cdk synth`       emits the synthesized CloudFormation template
 * `cdk deploy`      deploy this stack to your default AWS account/region
 * `cdk diff`        compare deployed stack with current state
 * `cdk docs`        open CDK documentation
