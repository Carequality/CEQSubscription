Extension: CEQextension
Title: "Carequality Subscription Required Elements"
Description: "Additional Elements to Support Carequality Subscription Notifications"
* insert FHIRPushStructureDefinitionContent
* extension contains
    subIdentifier 1..1 MS and
    patientId 1..1 MS and
    subPurpose 1..1 MS and
    subscriber 1..1 MS and
    subserv 0..1 MS and
    subscriptionTopic 1..1

* extension[subIdentifier] ^short = "A Business Identifier"
* extension[subIdentifier].value[x] only string

* extension[patientId] ^short = "The DataSource Patient MRN"
* extension[patientId].value[x] only Identifier

* extension[subPurpose] ^short = "Purpose of Use for this Subscription"
* extension[subPurpose].value[x] only Coding

* extension[subscriber] ^short = "End subscriber for the information"
* extension[subscriber].value[x] only Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient or http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner or RelatedPerson or http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization)

* extension[subserv] ^short = "Subscription Service acing as intermediary"
* extension[subserv].value[x] only Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization)

* extension[subscriptionTopic] ^short = "Reference to CEQ SubscriptionTopic replacement"
* extension[subscriptionTopic].value[x] only Reference(CEQTopic)


Profile: CEQsubscription
Parent: Subscription
Title: "Carequality Subscription Profile"
Description: """Extended Elements and Constraints Specific to the Carequality Use Case
Carequality has defined a custom flow for a Subscription that removes the criteria use
in favour of specific events defined as URIs.  This adds requirements that the PatientID
and an identifier be added to the resource.  The identifier element is the endpoint id
[Base]/fhir/Subscription/[identifier]
A termination (Subscription.end) date is required and may not be more than 2 years from date of subscription without renewal.
"""
* insert FHIRPushStructureDefinitionContent
* extension contains CEQextension named ceqPushExtension 1..1

* end 1..1
* end ^comment = "Maximum 2 years"

* criteria = "carequality" (exactly)
* channel.type = #rest-hook (exactly)

* extension[ceqPushExtension].extension[subIdentifier] 1..1
* extension[ceqPushExtension].extension[patientId] 1..1
* extension[ceqPushExtension].extension[subPurpose] 1..1
* extension[ceqPushExtension].extension[subPurpose].valueCoding from CEQSubscriberPurposeofUse (extensible)
* extension[ceqPushExtension].extension[subscriber] 1..1
* extension[ceqPushExtension].extension[subserv] 0..1
* extension[ceqPushExtension].extension[subscriptionTopic]  1..1

Profile: CEQSubscriptionBundle
Parent: Bundle
Title: "Carequality Subscription Bundle"
Description: "Bundle to be submitted for Carequality subscription enrollment"

* insert FHIRPushStructureDefinitionContent

* type = #transaction (exactly)
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "Resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slice based on the entry.resource type"
* entry contains
  subsciptionentry 1..1 and
	subscriberentry 1..1 and
  subserv 0..1 and
  subscriptionTopic 1..1

* entry[subsciptionentry].resource 1..1
* entry[subsciptionentry].resource only CEQsubscription
* entry[subsciptionentry].request.method = #POST

* entry[subscriberentry].resource 1..1
* entry[subscriberentry].resource only http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient or http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner or http://hl7.org/fhir/StructureDefinition/RelatedPerson or http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization
* entry[subscriberentry].request.method = #POST

* entry[subserv].resource 0..1
* entry[subserv].resource only http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization
* entry[subserv].request.method = #POST

* entry[subscriptionTopic].resource 1..1
* entry[subscriptionTopic].resource only CEQTopic



Profile: CEQNotificationBundle
Parent: Bundle
Title: "Carequality Notification Bundle"
Description: "Bundle for Carequality subscription notification"

* insert FHIRPushStructureDefinitionContent

* type = #collection (exactly)

* entry 2..2
* entry.fullUrl 1..1
// * entry[1].resource = Reference(CEQSubscriptionStatus)


Profile:   CEQTopic
Parent: Basic
Id:          CEQ-topic
Title:       "Carequality R5 SubscriptionTopic replacement"
Description: "Reference to the subscription topic being subscribed to."
* ^jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#001
* code = http://terminology.hl7.org/CodeSystem/basic-resource-type#adminact (exactly)
* extension contains eventCode 1..1 MS
* extension[eventCode].value[x] only Coding
* extension[eventCode].valueCoding from CEQPushEventCodes (required)

Profile:     CEQSubscriptionStatus
Parent:      Parameters
Id:          CEQ-subscription-status
Title:       "CEQ R5 Subscription Notification Status"
Description: "Profile on the Parameters resource to enable R5-style topic-based subscription notifications in FHIR R4."
* ^jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#001
* parameter  ^slicing.discriminator.type = #value
* parameter  ^slicing.discriminator.path = "name"
* parameter  ^slicing.rules = #open
* parameter  ^slicing.ordered = false
* parameter  ^slicing.description = "Slice on parameter name"
* parameter
    contains subscriptionUrl 1..1 MS
    and eventCode 0..1 MS
    and status 1..1 MS
    and type 1..1 MS
    and subscriptionEventCount 1..1 MS

* parameter[subscriptionUrl].name = "subscription-url" (exactly)
* parameter[subscriptionUrl].value[x] 1..1 MS
* parameter[subscriptionUrl].value[x] only uri
* parameter[eventCode].name = "subscription-event-code" (exactly)
* parameter[eventCode].value[x] 0..1 MS
* parameter[eventCode].value[x] only Coding
* parameter[eventCode].valueCoding from CEQPushEventCodes (required)
* parameter[status].name = "status" (exactly)
* parameter[status].value[x] 1..1 MS
* parameter[status].value[x] only code
* parameter[status].value[x] from http://hl7.org/fhir/ValueSet/subscription-status
* parameter[subscriptionEventCount].name = "subscription-event-count" (exactly)
* parameter[subscriptionEventCount].value[x] 1..1 MS
* parameter[subscriptionEventCount].value[x] only unsignedInt
