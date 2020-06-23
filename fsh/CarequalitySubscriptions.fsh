Extension: CEQextension
Title: "Carequality Subscription Required Elements"
Description: "Additional Elements to Support Carequality Subscription Notifications"
Mixins: FHIRPushStructureDefinitionContent
* extension contains
    subIdentifier 1..1 MS and
    eventCode 1..* MS and
    patientId 1..1 MS and
    subPurpose 1..1 MS and
    subscriber 1..1 MS

* extension[subIdentifier] ^short = "A Business Identifier"
* extension[subIdentifier].value[x] only string

* extension[eventCode] ^short = "The Carequality code for the Event"
* extension[eventCode] ^comment = "One or more of the Carequality defined set of notification codes.  Sending the payload has obvious security implications. The server is responsible for ensuring that the content is appropriately secured"
* extension[eventCode].value[x] only Coding

* extension[patientId] ^short = "The DataSource Patient MRN"
* extension[patientId].value[x] only Identifier

* extension[subPurpose] ^short = "Purpose of Use for this Subscription"
* extension[subPurpose].value[x] only Coding

* extension[subscriber] ^short = "End subscriber for the information"
* extension[subscriber].value[x] only Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient | http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner | RelatedPerson | http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization)


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
Mixins: FHIRPushStructureDefinitionContent
* extension contains CEQextension named ceqPushExtension 1..1

* end 1..1
* criteria = "carequality" (exactly)
* channel.type = #rest-hook (exactly)

* extension[ceqPushExtension].extension[subIdentifier] 1..1
* extension[ceqPushExtension].extension[eventCode] 1..*
* extension[ceqPushExtension].extension[eventCode].valueCoding from CEQPushEventCodes (required)
* extension[ceqPushExtension].extension[patientId] 1..1
* extension[ceqPushExtension].extension[subPurpose] 1..1
* extension[ceqPushExtension].extension[subPurpose].valueCoding from CEQSubscriberPurposeofUse (extensible)
* extension[ceqPushExtension].extension[subscriber] 1..1

Profile: CEQSubscriptionBundle
Parent: Bundle
Title: "Carequality Subscription Bundle"
Description: "Bundle to be submitted for Carequality subscription enrollment"

Mixins: FHIRPushStructureDefinitionContent

* type = #transaction (exactly)
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "Resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slice based on the entry.resource type"
* entry contains
	subsciptionentry 1..1 and
	subscriberentry 1..1

* entry[subsciptionentry].resource 1..1
* entry[subsciptionentry].resource only CEQsubscription
* entry[subsciptionentry].request.method = #POST

* entry[subscriberentry].resource 1..1
* entry[subscriberentry].resource only http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient or http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner or http://hl7.org/fhir/StructureDefinition/RelatedPerson or http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization
* entry[subscriberentry].request.method = #POST
