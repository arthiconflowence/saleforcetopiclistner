@ECHO OFF
REM This script takes the required parameters to deploy an API
TITLE Mule Deployment using Maven
:: ######## System Parameters#########################################################

echo  #######################################
echo  #### Script to Deploy the Jar file ####
echo  #######################################


echo  #### Setting the system paramters  ####

SET muleVersion="4.2.2"
SET userName="REPLACE_BY_USER"
SET password="REPLACE_BY_USER"
SET applicationName="REPLACE_BY_USER"
SET environment="REPLACE_BY_USER"
SET businessGroup="REPLACE_BY_USER"
SET visualizer="exp"
SET workerType="REPLACE_BY_USER"
SET clientId="REPLACE_BY_USER"
SET clientSecret="REPLACE_BY_USER"
SET workers="REPLACE_BY_USER"
SET region="REPLACE_BY_USER"

:: ##############Application parameters############################
SET amqCaseClientId="REPLACE_BY_USER"
SET amqCaseClientSecret="REPLACE_BY_USER"
SET encryptionKey="REPLACE_BY_USER"
SET sfdcPassword="REPLACE_BY_USER"
SET sfdcToken="REPLACE_BY_USER"
:: ##########################Get Artifact from target folder##########################
for /f %%i in ('DIR /b target\*.jar') do set artifact=%%i
SET artifact=target/%artifact%

:: ########################MAVEN DEPLOY COMMAND#######################################

echo  ####  Deploying the Jar %artifact% using bellow command  ####

mvn mule:deploy -DmuleDeploy -Dmule.artifact=%artifact% -DmuleVersion=%muleVersion% -Dusername=%userName% -Dpassword=%password% -DapplicationName=%applicationName% -Denvironment=%environment% -DbusinessGroup=%businessGroup% -Danypoint.platform.visualizer.layer=%visualizer% -Dregion=%region% -Dworkers=%workers% -DworkerType=%workerType% -Danypoint.platform.client_id=%clientId% -Danypoint.platform.client_secret=%clientSecret% -DencryptionKey=%encryptionKey% -Dsfdc.password=%sfdcPassword% -Dsfdc.token=%sfdcToken% -Danypoint-mq.client-secret=%amqCaseClientSecret% -Danypoint-mq.client-id=%amqCaseClientId%
PAUSE
