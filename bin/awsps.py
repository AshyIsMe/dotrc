#!/usr/bin/env python
#awsps.py - List your running AWS instances

#Inspired by the 'convox ps' screenshot here: https://convox.com/
#$ convox ps
#ID           NAME   RELEASE      CPU    MEM     STARTED       COMMAND
#13254981d20  admin  REXIQURVKXE  0.47%  2.21%   17 hours ago  bin/admin
#92d4a822c13  web    REXIQURVKXE  3.29%  20.68%  17 hours ago  bin/web

#Dependencies: pip install boto3 tabulate
#Set up your aws profile in ~/.aws/credentials (http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-config-files)

#TODO: Add profile as an argument: https://github.com/boto/boto3/pull/69

import boto3
import datetime
from tabulate import tabulate

ec2 = boto3.resource('ec2')
cw = boto3.resource('cloudwatch')
cpu = cw.Metric('AWS/EC2', 'CPUUtilization')

instancestats = []

instances = ec2.instances.filter(
        Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])
for i in instances:
    response = cpu.get_statistics(
        Dimensions=[ { 'Name': 'InstanceId', 'Value': i.id } ],
        StartTime=datetime.datetime.utcnow() - datetime.timedelta(minutes=10),
        EndTime=datetime.datetime.utcnow(),
        Period=60,
        Statistics=[ 'Average' ])
    instancestats.append([i.id, [d['Value'] for d in i.tags if d['Key'] == 'Name'][0], i.launch_time, response["Datapoints"][0]["Average"]])

print tabulate(instancestats, headers=["InstanceId", 'Name', 'Started', 'CPU%'])
