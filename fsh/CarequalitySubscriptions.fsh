Extension: CEQextension
Title: "Carequality Subscription Required Elements"
Description: "Additional Elements to Support Carequality Subscription Notifications"
* insert FHIRPushStructureDefinitionContent
* extension contains
    subIdentifier 1..1 MS and
    patientId 1..1 MS and
    subscriber 1..1 MS and
    subserv 0..1 MS and
    subscriptionTopic 1..1

* extension[subIdentifier] ^short = "A Business Identifier"
* extension[subIdentifier].value[x] only string

* extension[patientId] ^short = "The DataSource Patient MRN"
* extension[patientId].value[x] only Identifier

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
* extension[ceqPushExtension].extension[subscriber] 1..1
* extension[ceqPushExtension].extension[subserv] 0..1
* extension[ceqPushExtension].extension[subscriptionTopic]  1..1

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







Profile: CEQNotificationBundle
Parent: Bundle
Title: "Carequality Notification Bundle"
Description: """This Bundle has exactly two entries, the first contains CEQSubscriptionStatus Profile that has the basic
information about the subscription and the time the subscription was sent; the second is the FullUrl of thead
payload with the date and time the topic was triggered.  It is configured as a batch-response to allow for a
non-resource entry in the Bundle which requires the response.status element in all entries."""

* insert FHIRPushStructureDefinitionContent

* entry  ^slicing.discriminator.type = #value
* entry  ^slicing.discriminator.path = "response.status"
* entry  ^slicing.rules = #closed
* entry  ^slicing.ordered = true
* entry  ^slicing.description = "Slice on response status descriptor"

* type = #batch-response  (exactly)
* entry 2..2
* entry contains sub-status 1..1 MS and sub-payload 1..1 MS
* entry[sub-status].resource only CEQSubscriptionStatus
* entry[sub-status].response.status = "Delivered" (exactly)
* entry[sub-status].response.lastModified 1..1
* entry[sub-payload].fullUrl 1..1
* entry[sub-payload].response.status = "Triggered" (exactly)
* entry[sub-payload].response.lastModified 1..1


Extension: CEQEventCode
Id: CEQEventCode
Title: "CEQ Event Codes"
Description: "Event Code Extension for use in Topics and Status"
* value[x] only Coding

Profile:   CEQTopic
Parent: Basic
Id:          CEQ-topic
Title:       "Carequality R5 SubscriptionTopic replacement"
Description: "Reference to the subscription topic being subscribed to."
* ^jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#001
* code = http://terminology.hl7.org/CodeSystem/basic-resource-type#adminact (exactly)
* extension contains CEQEventCode named eventCode 1..1 MS
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
    contains subIdentifier 0..1 MS
    and eventCode 0..1 MS
    and status 1..1 MS
    and subscriptionEventCount 1..1 MS
    and subscriptionPractitioner 1..1 MS
    and subscriptionPatient 1..1 MS
    and subscriptionOrganization 1..1 MS

* parameter[subIdentifier].name = "subscription-name" (exactly)
* parameter[subIdentifier].name ^short = "Business Name of the subscription submitted"
* parameter[subIdentifier].value[x] 0..1 MS
* parameter[subIdentifier].value[x] only string
* parameter[eventCode].name = "subscription-event-code" (exactly)
* parameter[eventCode].value[x] 0..1 MS
* parameter[eventCode].value[x] only Coding
* parameter[eventCode].valueCoding from CEQPushEventCodes (required)
* parameter[status].name = "status" (exactly)
* parameter[status].value[x] 1..1 MS
* parameter[status].value[x] only code
* parameter[status].valueCode from http://hl7.org/fhir/ValueSet/subscription-status
* parameter[subscriptionEventCount].name = "subscription-event-count" (exactly)
* parameter[subscriptionEventCount].value[x] 1..1 MS
//Added to handle CMS information requirements for patient, practitioner and org names
* parameter[subscriptionEventCount].value[x] only unsignedInt
* parameter[subscriptionPractitioner].name = "subscription-practitioner-name" (exactly)
* parameter[subscriptionPractitioner].value[x] 1..1 MS
* parameter[subscriptionPractitioner].value[x] only HumanName
* parameter[subscriptionPatient].name = "subscription-patient-name" (exactly)
* parameter[subscriptionPatient].value[x] 1..1 MS
* parameter[subscriptionPatient].value[x] only HumanName
* parameter[subscriptionOrganization].name = "subscription-Organization-name" (exactly)
* parameter[subscriptionOrganization].value[x] 1..1 MS
* parameter[subscriptionOrganization].value[x] only string
