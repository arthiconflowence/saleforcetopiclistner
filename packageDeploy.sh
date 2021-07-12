#!/bin/bash
#This script takes the required parameters to deploy an API
#
###################################
muleVersion="4.2.2"
userName="REPLACE_BY_USER"
password="REPLACE_BY_USER"
applicationName="REPLACE_BY_USER"
environment="REPLACE_BY_USER"
businessGroup="REPLACE_BY_USER"
visualizer="exp"
workerType="REPLACE_BY_USER"
clientId="REPLACE_BY_USER"
clientSecret="REPLACE_BY_USER"
workers="REPLACE_BY_USER"
region="REPLACE_BY_USER"
###################################
#
##########Application parameters########
amqCaseClientId="REPLACE_BY_USER"
amqCaseClientSecret="REPLACE_BY_USER"
encryptionKey="REPLACE_BY_USER"
sfdcPassword="REPLACE_BY_USER"
sfdcToken="REPLACE_BY_USER"
###################################
mvn clean package deploy -DskipMunitTests -DmuleDeploy -DmuleVersion=${muleVersion} -Dusername=${userName} -Dpassword=${password} -DapplicationName=${applicationName} -Denvironment=${environment} -DbusinessGroup=${businessGroup} -Danypoint.platform.visualizer.layer=${visualizer} -Dregion=${region} -Dworkers=${workers} -DworkerType=${workerType} -Danypoint.platform.client_id=${clientId} -Danypoint.platform.client_secret=${clientSecret} -DencryptionKey=${encryptionKey} -Dsfdc.password=${sfdcPassword} -Dsfdc.token=${sfdcToken} -Danypoint-mq.client-secret=${amqCaseClientSecret} -Danypoint-mq.client-id=${amqCaseClientId}
