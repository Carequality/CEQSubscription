Extension: CEQextension
Title: "Carequality Subscription Required Elements"
Description: "Additional Elements to Support Carequality Subscription Notifications"
* insert FHIRPushStructureDefinitionContent
* extension contains subIdentifier 1..1 MS
    and subscriber 1..1 MS
    and subserv 0..1 MS
    and subscriptionTopic 1..*
    and searchParamName 1..1
    and searchModifier 1..1
    and searchvalue 1..1

* extension[subIdentifier] ^short = "A Business Identifier"
* extension[subIdentifier].value[x] only string

* extension[subscriber] ^short = "End subscriber for the information"
* extension[subscriber].value[x] only Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient or http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner or RelatedPerson or http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization)

* extension[subserv] ^short = "Subscription Service acing as intermediary"
* extension[subserv].value[x] only Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization)

* extension[subscriptionTopic] ^short = "Canonical Reference to CEQ SubscriptionTopic replacement"
* extension[subscriptionTopic].value[x] only canonical

* extension[searchParamName] ^short = "Filter label"
* extension[searchParamName].value[x] only string

* extension[searchModifier] ^short = "= | eq | ne | gt | lt | ge | le | sa | eb | ap | above | below | in | not-in | of-type"
* extension[searchModifier].value[x] only code

* extension[searchvalue] ^short = "Literal value"
* extension[searchvalue].value[x] only string

Invariant:  CEQ-Param-Name
Description: "searchParamName shall be Patient or PatientID"
Expression: "Subscription.extension('ceqPushExtension').extension('searchParamName').value in ( 'Patient' | 'PatientID' )"
Severity:   #error

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
* obeys CEQ-Param-Name
* extension contains CEQextension named ceqPushExtension 1..1

* end 1..1
* end ^comment = "Maximum 2 years"

* criteria = "carequality" (exactly)
* channel.type = #rest-hook (exactly)

* extension[ceqPushExtension].extension[subIdentifier] 1..1
* extension[ceqPushExtension].extension[subscriber] 1..1
* extension[ceqPushExtension].extension[subserv] 0..1
* extension[ceqPushExtension].extension[subscriptionTopic].valueCanonical 1..1
* extension[ceqPushExtension].extension[searchParamName].valueString 1..1
* extension[ceqPushExtension].extension[searchModifier].valueCode = http://terminology.hl7.org/CodeSystem/subscription-search-modifier#eq
* extension[ceqPushExtension].extension[searchvalue] 1..1


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

* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.ordered = false
* entry ^slicing.description = "Slice based on resource"

* type = #history  (exactly)
* entry 4..*
* entry contains subscriptionStatus 1..1 MS
  and subscriptionPatient 1..1 MS
  and subscriptionPractitioner 1..* MS
  and subscriptionOrganization 1..1 MS
  and subscriptionDiagnosis 0..1 MS

* entry[subscriptionStatus].resource only CEQSubscriptionStatus
* entry[subscriptionStatus].request.method = #GET (exactly)
* entry[subscriptionStatus].response.status = "200" (exactly)
* entry[subscriptionPatient].resource only http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
* entry[subscriptionPatient].request.method = #POST (exactly)
* entry[subscriptionPatient].response.status = "201" (exactly)
* entry[subscriptionPractitioner].resource only http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner
* entry[subscriptionPractitioner].request.method = #POST (exactly)
* entry[subscriptionPractitioner].response.status = "201" (exactly)
* entry[subscriptionOrganization].resource only http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization
* entry[subscriptionOrganization].request.method = #POST (exactly)
* entry[subscriptionOrganization].response.status = "201" (exactly)
* entry[subscriptionDiagnosis].resource only http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition
* entry[subscriptionDiagnosis].request.method = #POST (exactly)
* entry[subscriptionDiagnosis].response.status = "201" (exactly)



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
* parameter[subscriptionEventCount].value[x] only unsignedInt


Instance: CEQSubscriptionStatusExample
InstanceOf: CEQSubscriptionStatus
Title: "SubscriptionStatus Example"
Description: "An example of the Carequality Subscription Status Profile"
Usage: #example

* parameter[status].valueCode = #active
* parameter[subIdentifier].valueString = "Sub84849-26"
* parameter[eventCode].valueCoding = PushCode#admit
* parameter[subscriptionEventCount].valueUnsignedInt = 25
