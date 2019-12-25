#!/usr/bin/env python3

from aws_cdk import core

from nextcloud_docker_cdk.nextcloud_docker_cdk_stack import NextcloudDockerCdkStack


app = core.App()
NextcloudDockerCdkStack(app, "nextcloud-docker-cdk")

app.synth()
