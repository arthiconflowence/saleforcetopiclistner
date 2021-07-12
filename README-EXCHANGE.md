**Overview**

This asset is a component of [MuleSoft Accelerator for Salesforce Clouds](https://www.mulesoft.com/exchange/org.mule.examples/mulesoft-accelerator-for-salesforce-clouds/), which accelerates implementation of essential integration use cases for Service Cloud and B2C Commerce Cloud.

The solution includes pre-built APIs, connectors, and integration templates that help unlock business-critical data from external systems such as SAP, ServiceNow, and Jira, all the while guiding you to adopt best practices synthesized from thousands of customer implementations. These assets can be used as is or extended to meet your company’s unique needs.

## Automation for ease of consumption

Each Accelerator template in Exchange includes Bash and Windows scripts for building and deploying the API to CloudHub. The top of each script defines all the parameters needed; once the parameters are given suitable values, the scripts will run. A list of `-D` properties for Anypoint Studio Run Configuration enables these to be easily run in Studio.

The parent POM will build all assets in the Accelerator in one step, in the correct dependency order. Please see the [MuleSoft Accelerator for Salesforce Clouds overview page](https://www.mulesoft.com/exchange/org.mule.examples/mulesoft-accelerator-for-salesforce-clouds/) for a master index of all assets, including the parent POM.

## Prerequisites

Each template relies on some service/s or data to function. Please review the [reference architecture](https://www.mulesoft.com/exchange/org.mule.examples/mulesoft-accelerator-for-salesforce-clouds/), and note dependencies on other APIs and services such as Salesforce, ServiceNow, and Twilio.

## Salesforce Case Topic Listener

This Mule application supports the below functionality:

 - Listen for the case event from Salesforce push topic and publish it to Anypoint MQ.
