Instance: CEQSubscription-Recipient
InstanceOf: CapabilityStatement
Usage: #example
* insert CEQsubscribeCapabilityStatementContent

* id = "ceqsubscribe-capabilitystatement"
* name = "CEQsubscribeCapabilityStatement"
* title = "Carequality Subscription Submission Capability Statement"
* description = "Capability Statement to describe the requirements for a Notification Recipient Actor"

* implementationGuide = "https://carequality.org/IG/push-notifications/CEQSubscription"

* rest.mode = #client
* rest.security.service.coding = http://terminology.hl7.org/CodeSystem/restful-security-service#OAuth (exactly)
* rest.security.service.text = "Carequality FHIR IG" (exactly)
* rest.security.description = "Requires adherence to the Carequality FHIR Implementation Guide"

