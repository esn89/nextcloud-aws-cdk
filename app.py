#!/usr/bin/env python3

from aws_cdk import core

from nextcloud_docker_cdk.network_stack import NetworkStack
from nextcloud_docker_cdk.rds_stack import RDSStack
from nextcloud_docker_cdk.asg_stack import ASGStack
from nextcloud_docker_cdk.efs_stack import StorageStack

props = {'namespace': 'NetworkStack '}
app = core.App()
ns = NetworkStack(app, "NetworkStack", props)

rds = RDSStack(app, "RDSStack", ns.outputs)
rds.add_dependency(ns)

asg = ASGStack(app, "ASGStack", ns.outputs)
asg.add_dependency(ns)

efs = StorageStack(app, "StorageStack", ns.outputs)
app.synth()
