Instance:   DrDavidAnydoc
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner
Title:  "Dr. David Anydoc"
Description: "Practitioner for example use"

Usage:  #example
* name[0].family = "Anydoc"
* name[0].given[0] = "David"
* name[0].suffix[0] = "MD"
* identifier[NPI].value = "8274017284"

Alias: PushCode = https://sequoiaproject.org/fhir/sphd-r4/CodeSystem/CEQNotificationEvents
Alias: SubPoU = https://sequoiaproject.org/fhir/sphd-r4/CodeSystem/NHINPurposeOfUse

Instance:  CEQsubscriptionExample
InstanceOf: CEQsubscription
Title:   "Example Subscribing"
Description: "Example of the full Resource for a Carequality Subscription"
Usage:  #example

* id = "CEQExample"
* status = #active

* contact.system = #phone
* contact.value = "212-877-3307 ext 5001"
* end = "2021-01-01T00:00:00Z"

* reason = "Example"

* criteria = "carequality"
* channel.type = #rest-hook
* channel.endpoint = "http://www.example.org/fhir/subscription/sub123"

* extension[ceqPushExtension].extension[subIdentifier].valueString = "sub123"

* extension[ceqPushExtension].extension[patientId].valueIdentifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* extension[ceqPushExtension].extension[patientId].valueIdentifier.system = "urn:oid:1.2.36.146.595.217.0.1"
* extension[ceqPushExtension].extension[patientId].valueIdentifier.value = "MRN123"

* extension[ceqPushExtension].extension[subPurpose].valueCoding = SubPoU#TREATMENT

* extension[ceqPushExtension].extension[subscriber].valueReference = Reference(DrDavidAnydoc)
* extension[ceqPushExtension].extension[subscriptionTopic].valueReference = Reference(CEQSubscriptionTopicExample)

Instance: CEQSubscriptionTopicExample
InstanceOf: CEQTopic
Title:   "Example Subscribing Topic"

Description: "Example of the subscription Topic  for a Carequality Subscription"
Usage:  #example

* id = "CEQExample"
* extension[eventCode].valueCoding = PushCode#snradmit
