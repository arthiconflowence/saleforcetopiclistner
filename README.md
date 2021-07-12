# sfdc-case-topic-listener

This project sfdc-case-topic-listener  listens to case data triggered from Salesforce and post the data into Anypoint MQ.This listener listens to the push topic configured in salesforce on case object.The following fields are part of the push topic query Status, Type, Priority, Id, Subject.These fields are received as JSON Object from Salesforce.The received json payload is published to Anypoint MQ.In case of any failure during the flow, the incoming orginal payload is published to dead letter queue by the exception handler.

# Prerequisite Setup

 - Create a push topic on case object with below information in Salesforce.Create Custom Fields   Sync_With_SNOW__c and Sync_With_JIRA__c with checkbox as field type. 
 
        API Version 46.0 (Replace with current API version is applicable)
        Name All_Cases (May not contain spaces)
        NotifyForOperationCreate true
        NotifyForOperationDelete false
        NotifyForOperationUndelete false
        NotifyForOperationUpdate false
        Query SELECT Id  FROM Case where Sync_With_SNOW__c=true or Sync_With_JIRA__c=true
        
 - Use the same Salesforce Org credentials in YAML File.
 - Encrypt the salesforce password and token with encryptionKey and add it to {env}-secure-yaml file where env is LOCAL,DEV.
 - Create client application in Anypoint MQ if not created and copy the client id and client secret.
 - Encrypt client secret with encryptionKey and add client id and client secret to {env}-secure.yaml where env is LOCAL,DEV under respective property.
 - Create an exchange named sfa-sfdc-case-exchange in Anypoint MQ if not present.
 - Create a queue named sfa-sfdc-case-queue and bind to sfa-sfdc-case-exchange in Anypoint MQ if not present.
 - Create a queue named sfa-sfdc-case-dlq and assign as dead letter queue to sfa-sfdc-case-queue in Anypoint MQ if not present.

# Installation Instructions For Studio


- Clone the project using any Github client or Anypoint Studio Git plugin.
- Import the project into workspace.
- Modify LOCAL.yaml properties appropriately.
- Studio --> Right Click  on Project --> Run As --> Run Configurations , Navigate to Arguments tab, in VM arguments enter the following

           
           -M-Dmule.env=LOCAL
           -M-DencryptionKey=(use your encryptionKey) 
           -M-Danypoint.platform.gatekeeper=disabled
           -M-Dsfdc.password=(Replace with Salesforce Password)
           -M-Dsfdc.token=(Replace with Security Token)
           -M-Danypoint-mq.client-secret=(Replace with Client Secret)
           -M-Danypoint-mq.client-id=(Replace with Client Id)
           
           
- Click on Apply Button.
- Run the project.

# Deployment Instructions For CH


- Runtime Manager :

   Use the following Maven command to deploy application to Cloud Hub, replace '**' with appropriate values
   
mvn clean package deploy -DskipMunitTests -DmuleDeploy -DmuleVersion=** -Dusername=** -Dpassword=** -DapplicationName=** -Denvironment=** -DbusinessGroup=** -DworkerType=** -Danypoint.platform.client_id=** -Danypoint.platform.client_secret=** -DencryptionKey=**  -Danypoint-mq.client-secret=** -Danypoint-mq.client-id=**   -Dsfdc.password=** -Dsfdc.token=**

