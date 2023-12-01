
Alias: PushCode = https://sequoiaproject.org/fhir/sphd-r4/CodeSystem/CEQNotificationEvents
Alias: SubPoU = https://sequoiaproject.org/fhir/sphd-r4/CodeSystem/NHINPurposeOfUse

Instance:  CEQsubscriptionExample
InstanceOf: CEQsubscription
Title:   "Example Subscribing"
Description: "Example of a full Resource for a Carequality Subscription"
Usage:  #example

* id = "CEQSubscriptionExample"
* status = #active
* contact.system = #phone
* contact.value = "555-555-5555"
* end = "2021-01-01T00:00:00Z"
* reason = "Example"
* criteria = "Patient?identifier=MRN123"
* channel.type = #rest-hook
* channel.endpoint = "http://www.example.org/fhir/subscription/sub123"

* extension[subscriptionTopic].valueCanonical = "http://www.carequality.org/fhir/CEQTopic/snradmit"
* extension[ceqPushExtension].extension[subIdentifier].valueString = "sub123"
* extension[ceqPushExtension].extension[searchParamName].valueString = "PatientID"
* extension[ceqPushExtension].extension[searchModifier].valueCode = http://terminology.hl7.org/CodeSystem/subscription-search-modifier#eq
* extension[ceqPushExtension].extension[endUser].valueString = "Dr. David AnyDoc"
* extension[ceqPushExtension].extension[CQOrganization].valueString = "02yr0qwy40"



Instance: CEQSubscriptionStatusExample
InstanceOf: CEQSubscriptionStatus
Title: "SubscriptionStatus Example"
Description: "An example of the Carequality Subscription Status Profile"
Usage: #example

* parameter[status].valueCode = #active
* parameter[subscription].valueString = "Sub84849-26"
* parameter[topic].valueCanonical = "http://www.carequality.net/CEQTopic/admit"
* parameter[eventsSinceSubscriptionStart].valueUnsignedInt = 8


Instance: NotificationBundleExample
InstanceOf: CEQNotificationBundle
Title: "CQ Notification Bundle Example"
Description: "Example of the CQ Notification Bundle with a SubscriptionStatus and payload URL"
Usage: #example

* type = #history
* entry[subscriptionStatus].fullUrl = "http://www.example.org/fhir/Parameters/CEQSubscriptionStatusExample"
* entry[subscriptionStatus].resource = CEQSubscriptionStatusExample
* entry[subscriptionStatus].request.method = #GET
* entry[subscriptionStatus].request.url = "https://example.org/fhir/r4/Subscription/admission/$status"
* entry[subscriptionStatus].response.status = "200"
* entry[subscriptionStatus].response.lastModified = "2020-08-09T00:04:00Z"

* entry[SubEncounter].fullUrl = "http://www.example.org/fhir/Encounter/CEQ-Encounter"
* entry[SubEncounter].resource = CEQ-Encounter
* entry[SubEncounter].request.url = "https://example.org/fhir/r4/Encounter/CEQ-Encounter"
* entry[SubEncounter].response.status = "200"
