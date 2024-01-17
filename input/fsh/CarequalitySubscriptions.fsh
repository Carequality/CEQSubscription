Extension: CEQextension
Title: "Carequality Subscription Required Elements"
Description: "Additional Elements to Support Carequality Subscription Notifications"
Context: Subscription
* insert FHIRPushStructureDefinitionContent
* extension contains subIdentifier 1..1 MS
    and searchParamName 1..1
    and searchModifier 1..1
    and endUser 1..1
    and CQOrganization 1..1

* extension[subIdentifier] ^short = "A Business Identifier"
* extension[subIdentifier].value[x] only string

* extension[searchParamName] ^short = "Filter label"
* extension[searchParamName].value[x] only string

* extension[searchModifier] ^short = "= | eq | ne | gt | lt | ge | le | sa | eb | ap | above | below | in | not-in | of-type"
* extension[searchModifier].value[x] only code

* extension[endUser] ^short = "End recipient of the notification"
* extension[endUser] ^comment = "Full name of the patient, related person, practitioner or organization which is the end receiver of the notification"
* extension[endUser].value[x] only string

* extension[CQOrganization] ^short = "Recipient CQ Directory Reference"
* extension[CQOrganization] ^comment = "Shall be the value of Organization.id from the CQ FHIR Directory until the CQ Directory FHIR R4 FHIR IG is available"
* extension[CQOrganization].value[x] only string

Invariant:  CEQ-Param-Name
Description: "searchParamName shall be Patient or PatientID"
Expression: "extension('https://sequoiaproject.org/fhir/push-r4/StructureDefinition/CEQextension').extension('searchParamName').value in ( 'Patient' | 'PatientID' )"
Severity:   #error

Extension:   BackportTopicCanonical
Id:          backport-topic-canonical
Title:       "Backport R5 Subscription Topic Canonical"
Description: "Canonical reference to the subscription topic being subscribed to."
Context: Subscription
* ^jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#001
* value[x] only canonical
* valueCanonical 1..1 MS

Profile: CEQsubscription
Parent: Subscription
Title: "Carequality Subscription Profile"
Description: """Extended Elements and Constraints Specific to the Carequality Use Case
Carequality has defined a custom flow for a Subscription that removes the criteria use
in favor of specific events defined as URIs.  This adds requirements that the PatientID
and an identifier be added to the resource.  The identifier element is the endpoint id
[Base]/fhir/Subscription/[identifier]
A termination (Subscription.end) date is required and may not be more than 2 years from original date of
 subscription.  A renewal may be submitted prior to expiry for a period of up to two additional years."""
* insert FHIRPushStructureDefinitionContent
* obeys CEQ-Param-Name
* extension contains CEQextension named ceqPushExtension 1..1
* extension contains backport-topic-canonical named subscriptionTopic 1..*
* end 1..1
* end ^comment = "Maximum 2 years from date of subscription submission"

* criteria ^short = "Simplified query string for Patient using ?id= or ?identifier="
* channel.type = #rest-hook (exactly)

* extension[subscriptionTopic].valueCanonical 1..1

* extension[ceqPushExtension].extension[subIdentifier] 1..1
* extension[ceqPushExtension].extension[searchParamName].valueString 1..1
* extension[ceqPushExtension].extension[searchModifier].valueCode = http://terminology.hl7.org/CodeSystem/subscription-search-modifier#eq
* extension[ceqPushExtension].extension[endUser] 1..1
* extension[ceqPushExtension].extension[CQOrganization] 1..1

Profile: CEQNotificationBundle
Parent: Bundle
Title: "Carequality Notification Bundle"
Description: """This Bundle is configured as a history bundle and has at least two entries, the first is the CEQSubscriptionStatus Profile
that has the basic information with the date and time the topic was triggered, number of notifications to date and, the second is the
Encounter (or other, if CareGap) Resource.

Display names must be present for Encounter.subject, Encounter.participant.individual and Encounter.diagnosis.condition for compliance with HHS Notification regulations or those resources must be included in the bundle.
"""

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

* entry[SubEncounter].resource only us-core-encounter
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
    contains subscription 0..1 MS
    and topic 0..1 MS
    and status 1..1 MS
    and eventsSinceSubscriptionStart 1..1 MS

* parameter[subscription].name = "subscription-name" (exactly)
* parameter[subscription].name ^short = "Business Name of the subscription submitted"
* parameter[subscription].value[x] 0..1 MS
* parameter[subscription].value[x] only string
* parameter[topic].name = "subscription-event-code" (exactly)
* parameter[topic].value[x] 1..1 MS
* parameter[topic].value[x] only canonical
* parameter[status].name = "status" (exactly)
* parameter[status].value[x] 1..1 MS
* parameter[status].value[x] only code
* parameter[status].value[x] from http://hl7.org/fhir/ValueSet/subscription-status
* parameter[eventsSinceSubscriptionStart].name = "Events-Since-Subscription-Created" (exactly)
* parameter[eventsSinceSubscriptionStart].value[x] 1..1 MS
* parameter[eventsSinceSubscriptionStart].value[x] only unsignedInt
