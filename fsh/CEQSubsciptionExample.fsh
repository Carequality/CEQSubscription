
Alias: PushCode = https://sequoiaproject.org/fhir/sphd-r4/CodeSystem/CEQNotificationEvents
Alias: SubPoU = https://sequoiaproject.org/fhir/sphd-r4/CodeSystem/NHINPurposeOfUse

Instance:  CEQsubscriptionExample
InstanceOf: CEQsubscription
Title:   "Example Subscribing"
Description: "Example of the full Resource for a Carequality Subscription"
Usage:  #example

* id = "CEQSubscriptionExample"
* status = #active
* contact.system = #phone
* contact.value = "212-877-3307 ext 5001"
* end = "2021-01-01T00:00:00Z"
* reason = "Example"
* criteria = "carequality"
* channel.type = #rest-hook
* channel.endpoint = "http://www.example.org/fhir/subscription/sub123"

* extension[ceqPushExtension].extension[subIdentifier].valueString = "sub123"

* extension[ceqPushExtension].extension[subscriber].valueReference = Reference(DrDavidAnydoc)

* extension[ceqPushExtension].extension[subscriptionTopic].valueCanonical = "http://www.carequality.org/fhir/CEQTopic/snradmit"
* extension[ceqPushExtension].extension[searchParamName].valueString = "PatientID"
* extension[ceqPushExtension].extension[searchModifier].valueCode = http://terminology.hl7.org/CodeSystem/subscription-search-modifier#eq
* extension[ceqPushExtension].extension[searchvalue].valueString = "MRN123"

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
*/

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
/*
* entry[2].fullUrl = "http://www.example.org/fhir/Basic/0537166c-5db3-4b0e-97bd-1a59e6f3d080"
* entry[2].resource = CEQSubscriptionTopicExample
* entry[2].request.method = #POST
* entry[2].request.url = "http://www.example.org/fhir/0537166c-5db3-4b0e-97bd-1a59e6f3d080"
*/

Instance: CEQSubscriptionStatusExample
InstanceOf: CEQSubscriptionStatus
Title: "SubscriptionStatus Example"
Description: "An example of the Carequality Subscription Status Profile"
Usage: #example

* parameter[status].valueCode = #active
* parameter[subIdentifier].valueString = "Sub84849-26"
* parameter[event].valueCanonical = "http://www.carequality.net/CEQTopic/admit"
* parameter[subscriptionEventCount].valueUnsignedInt = 8


Instance: NotificationBundleExample
InstanceOf: CEQNotificationBundle
Title: "CQ Notification Bundle Example"
Description: "Example of the CQ Notification Bundle with a SubscriptionStatus and payload URL"
Usage: #example

* type = #history
* entry[subscriptionStatus].fullUrl = "http://www.example.org/fhir/Parameters/6b90b3bf-7564-4f4b-95c8-b06ce70699dd"
* entry[subscriptionStatus].resource = CEQSubscriptionStatusExample
* entry[subscriptionStatus].request.method = #GET
* entry[subscriptionStatus].request.url = "https://example.org/fhir/r4/Subscription/admission/$status"
* entry[subscriptionStatus].response.status = "200"
* entry[subscriptionStatus].response.lastModified = "2020-08-09T00:04:00Z"

* entry[subscriptionPatient].fullUrl = "http://www.example.org/fhir/Patient/90477e1c-2be1-4302-af4a-7b46da998296"
* entry[subscriptionPatient].resource = EveAnyperson
* entry[subscriptionPatient].request.method = #POST
* entry[subscriptionPatient].request.url = "https://example.org/fhir/r4/Subscription/admission/$status"
* entry[subscriptionPatient].response.status = "201"

* entry[subscriptionPractitioner].fullUrl = "http://www.example.org/fhir/Practitioner/e650c774-8a53-4e75-8cab-43d9f204b1c8"
* entry[subscriptionPractitioner].resource = DrDavidAnydoc
* entry[subscriptionPractitioner].request.method = #POST
* entry[subscriptionPractitioner].request.url = "https://example.org/fhir/r4/Subscription/admission/$status"
* entry[subscriptionPractitioner].response.status = "201"

* entry[subscriptionOrganization].fullUrl = "http://www.example.org/fhir/Organization/6da3decd-9df9-40c4-ae82-525d27f171de"
* entry[subscriptionOrganization].resource = VeterinariansHospital
* entry[subscriptionOrganization].request.method = #POST
* entry[subscriptionOrganization].request.url = "https://example.org/fhir/r4/Subscription/admission/$status"
* entry[subscriptionOrganization].response.status = "201"
