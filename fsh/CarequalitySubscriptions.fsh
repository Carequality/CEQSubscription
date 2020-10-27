Extension: CEQextension
Title: "Carequality Subscription Required Elements"
Description: "Additional Elements to Support Carequality Subscription Notifications"
* insert FHIRPushStructureDefinitionContent
* extension contains subIdentifier 1..1 MS
    and subscriptionTopic 1..*
    and searchParamName 1..1
    and searchModifier 1..1
    and searchvalue 1..1
    and endUser 1..1
    and CQOrganization 1..1

* extension[subIdentifier] ^short = "A Business Identifier"
* extension[subIdentifier].value[x] only string

* extension[subscriptionTopic] ^short = "Canonical Reference to CEQ SubscriptionTopic replacement"
* extension[subscriptionTopic].value[x] only canonical

* extension[searchParamName] ^short = "Filter label"
* extension[searchParamName].value[x] only string

* extension[searchModifier] ^short = "= | eq | ne | gt | lt | ge | le | sa | eb | ap | above | below | in | not-in | of-type"
* extension[searchModifier].value[x] only code

* extension[searchvalue] ^short = "Literal value"
* extension[searchvalue].value[x] only string

* extension[endUser] ^short = "End recipient of the notification"
* extension[endUser] ^comment = "Full name of the patient, related person, practitioner or organization which is the end receiver of the notification"
* extension[endUser].value[x] only string

* extension[CQOrganization] ^short = "Recipient CQ Directory Reference"
* extension[CQOrganization].value[x] only Reference(https://sequoiaproject.org/fhir/sphd-stu3/StructureDefinition/SequoiaOrganization)

Invariant:  CEQ-Param-Name
Description: "searchParamName shall be Patient or PatientID"
Expression: "extension('ceqPushExtension').extension('searchParamName').value in ( 'Patient' | 'PatientID' )"
Severity:   #error

Profile: CEQsubscription
Parent: Subscription
Title: "Carequality Subscription Profile"
Description: """Extended Elements and Constraints Specific to the Carequality Use Case
Carequality has defined a custom flow for a Subscription that removes the criteria use
in favor of specific events defined as URIs.  This adds requirements that the PatientID
and an identifier be added to the resource.  The identifier element is the endpoint id
[Base]/fhir/Subscription/[identifier]
A termination (Subscription.end) date is required and may not be more than 2 years from original date of subscription without renewal.
"""
* insert FHIRPushStructureDefinitionContent
* obeys CEQ-Param-Name
* extension contains CEQextension named ceqPushExtension 1..1

* end 1..1
* end ^comment = "Maximum 2 years"

* criteria = "carequality" (exactly)
* channel.type = #rest-hook (exactly)

* extension[ceqPushExtension].extension[subIdentifier] 1..1
* extension[ceqPushExtension].extension[subscriptionTopic].valueCanonical 1..1
* extension[ceqPushExtension].extension[searchParamName].valueString 1..1
* extension[ceqPushExtension].extension[searchModifier].valueCode = http://terminology.hl7.org/CodeSystem/subscription-search-modifier#eq
* extension[ceqPushExtension].extension[searchvalue] 1..1
* extension[ceqPushExtension].extension[endUser] 1..1
* extension[ceqPushExtension].extension[CQOrganization] 1..1

Profile: CEQNotificationBundle
Parent: Bundle
Title: "Carequality Notification Bundle"
Description: """This Bundle has exactly two entries, the first contains CEQSubscriptionStatus Profile that has the basic
information about the subscription and the time the subscription was sent; the second is the FullUrl of the
payload with the date and time the topic was triggered.  It is configured as a batch-response to allow for a
non-resource entry in the Bundle which requires the response.status element in all entries."""

* insert FHIRPushStructureDefinitionContent

* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.ordered = false
* entry ^slicing.description = "Slice based on resource"

* type = #history  (exactly)
* entry 1..3
* entry contains subscriptionStatus 1..1 MS
  and SubEncounter 0..1 MS
  and SubCareGap 0..1

* entry[subscriptionStatus].resource only CEQSubscriptionStatus
* entry[subscriptionStatus].request.method = #GET (exactly)
* entry[subscriptionStatus].response.status = "200" (exactly)

* entry[SubEncounter].resource only Encounter
* entry[SubEncounter].request.method = #GET (exactly)
* entry[SubEncounter].response.status = "200" (exactly)

* entry[SubCareGap].request.method = #GET (exactly)
* entry[SubCareGap].response.status = "200" (exactly)

Profile:     CEQSubscriptionStatus
Parent:      Parameters
Id:          CEQ-subscription-status
Title:       "CEQ R5 Subscription Notification Status"
Description: "Profile on the Parameters resource to enable R5-style topic-based subscription notifications in FHIR R4."

* insert FHIRPushStructureDefinitionContent

* ^jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#001
* parameter  ^slicing.discriminator.type = #value
* parameter  ^slicing.discriminator.path = "name"
* parameter  ^slicing.rules = #open
* parameter  ^slicing.ordered = false
* parameter  ^slicing.description = "Slice on parameter name"
* parameter
    contains subIdentifier 0..1 MS
    and event 0..1 MS
    and status 1..1 MS
    and subscriptionEventCount 1..1 MS

* parameter[subIdentifier].name = "subscription-name" (exactly)
* parameter[subIdentifier].name ^short = "Business Name of the subscription submitted"
* parameter[subIdentifier].value[x] 0..1 MS
* parameter[subIdentifier].value[x] only string
* parameter[event].name = "subscription-event-code" (exactly)
* parameter[event].value[x] 0..1 MS
* parameter[event].value[x] only canonical
// * parameter[event].valueCoding from CEQPushEventCodes (required)
* parameter[status].name = "status" (exactly)
* parameter[status].value[x] 1..1 MS
* parameter[status].value[x] only code
* parameter[status].valueCode from http://hl7.org/fhir/ValueSet/subscription-status
* parameter[subscriptionEventCount].name = "subscription-event-count" (exactly)
* parameter[subscriptionEventCount].value[x] 1..1 MS
* parameter[subscriptionEventCount].value[x] only unsignedInt
