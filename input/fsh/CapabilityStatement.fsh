Instance: CEQSubscription-Recipient
InstanceOf: CapabilityStatement
Usage: #example
* insert CEQsubscribeCapabilityStatementContent

* id = "ceqsubscribe-capabilitystatement"
* name = "CEQsubscribeCapabilityStatement"
* title = "Carequality Subscription Submission Capability Statement"
* description = "Capability Statement to describe the requirements for a Notification Recipient Actor"

* implementationGuide = "https://www.carequality.org/fhir/sphd-r4/CEQSubscription"

* rest.mode = #client
* rest.security.service.coding = http://terminology.hl7.org/CodeSystem/restful-security-service#OAuth (exactly)
* rest.security.service.text = "Carequality FHIR IG" (exactly)
* rest.security.description = "Requires adherence to the Carequality FHIR Implementation Guide"
/*
* rest.resource.profile = "https://sequoiaproject.org/fhir/sphd-r4/StructureDefinition/CEQSubscriptionBundle"
* rest.resource.type = #Bundle
* rest.resource.operation.name = "ceqsubscribe"
* rest.resource.operation.definition = "https://sequoiaproject.org/fhir/sphd-r4/OperationDefinition/ceqsubscribe"
*/
