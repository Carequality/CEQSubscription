Instance: CEQSubscription-Recipient
InstanceOf: CapabilityStatement
* insert CEQsubscribeCapabilityStatementContent

* id = "ceqsubscribe-capabilitystatement"
* name = "CEQsubscribeCapabilityStatement"
* title = "Carequality Subscription Submission Capability Statement"
* description = "Capability Statement to describe the requirements for a Notification Recipient Actor"

* rest.mode = #client
* rest.security.service = #CEQFHIR
* rest.security.description = "Requires adherence to the Carequality FHIR Implementation Guide"

* rest.resource.profile = "https://sequoiaproject.org/fhir/sphd-r4/StructureDefinition/CEQSubscriptionBundle"
* rest.resource.type = #Bundle
