/*
Instance: CEQsubscription
InstanceOf: OperationDefinition

* id = "ceqsubscribe"
* name = "CEQsubscribe"
* title = "Carequality Subscription Submission"
* description = "Operation for pushing a Bundle to the Notification Generator that includes the Subscription resource and the Resource indicating the end user of the notificaitons"
* status = #draft
* kind = #operation
* code = #ceqsubscribe

* system = false
* type = true
* instance =  true
* parameter[0].name = #subscription
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].documentation = "The subscription request being submitted"
* parameter[0].type = #canonical
* parameter[0].targetProfile = "https://sequoiaproject.org/fhir/sphd-r4/StructureDefinition/CEQSubscriptionBundle"

* parameter[1].name = #return
* parameter[1].use = #out
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].documentation = "If the operation outcome does not list any errors, then this is an indication that the operation would be expected to succeed"
* parameter[1].type = #OperationOutcome
*/
/*
Instance: CEQSubscriptionTopicExample
InstanceOf: CEQTopic
Title:   "Example Subscribing Topic"
Description: "Example of the subscription Topic  for a Carequality Subscription"
Usage:  #example

* id = "CEQTopicExample"
* extension[SubscriptionTopic].extension[eventCode].valueCoding = PushCode#snradmit
* extension[SubscriptionTopic].extension[PatientReference].valueReference = Reference(EveAnyperson)
* extension[SubscriptionTopic].extension[title].valueString = "Example Carequality Topic for subscribing"
* extension[SubscriptionTopic].extension[status].valueCode = #active


Instance: SubscriptionBundleExample
InstanceOf: CEQSubscriptionBundle
Title: "CQ Subscription Bundle Example"
Description: "Example of the CQ Subscription Bundle"
Usage: #example

* entry[subscriptionentry].fullUrl = "http://www.example.org/fhir/Subscription/70cba71d-f5e4-4355-9a2f-365ae7b8c694"
* entry[subscriptionentry].resource = CEQsubscriptionExample
* entry[subscriptionentry].request.method = #POST
* entry[subscriptionentry].request.url = "http://www.example.org/fhir/70cba71d-f5e4-4355-9a2f-365ae7b8c694"

* entry[1].fullUrl = "http://www.example.org/fhir/Practitioner/1adc15a2-bee5-4cfa-a6de-7ec2ce37dfe3"
* entry[1].resource = DrDavidAnydoc
* entry[1].request.method = #POST
* entry[1].request.url = "http://www.example.org/fhir/1adc15a2-bee5-4cfa-a6de-7ec2ce37dfe3"
* entry[2].fullUrl = "http://www.example.org/fhir/Basic/0537166c-5db3-4b0e-97bd-1a59e6f3d080"
* entry[2].resource = CEQSubscriptionTopicExample
* entry[2].request.method = #POST
* entry[2].request.url = "http://www.example.org/fhir/0537166c-5db3-4b0e-97bd-1a59e6f3d080"
*/
/*
Profile: CEQSubscriptionBundle
Parent: Bundle
Title: "Carequality Subscription Bundle"
Description: "Bundle to be submitted for Carequality subscription enrollment"

* insert FHIRPushStructureDefinitionContent

* type = #transaction (exactly)
* entry ^slicing.ordered = false
* entry ^slicing.rules = #open
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.description = "Slice based on the entry.resource type"
* entry contains
  subscriptionentry 1..1
* entry[subscriptionentry].resource 1..1
* entry[subscriptionentry].resource only CEQsubscription
* entry[subscriptionentry].request.method = #POST
*/
/*

Extension: CEQTopicExtension
Title: "CEQ Extension for the Profile on Basic"
Description: "Extension to create a SusbscriptionTopic style resource for use with Basic containing the event code and patient for the subscription"
* extension contains
      eventCode 1..1 MS
  and PatientIdentifier 0..1  MS
  and PatientReference 0..1  MS
  and title 0..1 MS
  and status 0..1 MS

* extension[eventCode].value[x] only Coding
* extension[PatientIdentifier].value[x] only Identifier
* extension[PatientReference].value[x] only Reference
* extension[title].value[x] only string
* extension[status].value[x] only code

Profile:   CEQTopic
Parent: Basic
Id:          CEQ-topic
Title:       "Carequality R5 SubscriptionTopic replacement"
Description: "Reference to the subscription topic being subscribed to."
* ^jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#001
* code = http://terminology.hl7.org/CodeSystem/basic-resource-type#adminact (exactly)
* extension contains CEQTopicExtension named SubscriptionTopic 1..1 MS
* extension[SubscriptionTopic].extension[eventCode].valueCoding from CEQPushEventCodes
* extension[SubscriptionTopic].extension[eventCode] ^short = "Subscription Event being Subscribed to"
* extension[SubscriptionTopic].extension[PatientIdentifier] ^short = "MRN or other identifier for the subject"
* extension[SubscriptionTopic].extension[PatientReference].valueReference only Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient)
* extension[SubscriptionTopic].extension[PatientReference] ^short = "Resource reference of the Patient subject"
* extension[SubscriptionTopic].extension[title] ^short = "Human readable title of this Topic"
* extension[SubscriptionTopic].extension[status].valueCode from http://hl7.org/fhir/ValueSet/publication-status
* extension[SubscriptionTopic].extension[status] ^short = "Status of this Topic resource"
*/
