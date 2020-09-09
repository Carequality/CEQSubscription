Instance: CEQSubscriptionStatusExample
InstanceOf: CEQSubscriptionStatus
Title: "SubscriptionStatus Example"
Description: "An example of the Carequality Subscription Status Profile"
Usage: #example

* parameter[status].valueCode = #active
* parameter[subIdentifier].valueString = "Sub84849-26"
* parameter[eventCode].valueCoding = PushCode#admit
* parameter[subscriptionEventCount].valueUnsignedInt = 25
* parameter[subscriptionPatient].valueHumanName.family = "Wanda"
* parameter[subscriptionPatient].valueHumanName.given = "Wayne"
* parameter[subscriptionPractitioner].valueHumanName.family = "Rowlf"
* parameter[subscriptionPractitioner].valueHumanName.given = "Bob"
* parameter[subscriptionPractitioner].valueHumanName.prefix = "Dr."
* parameter[subscriptionOrganization].valueString = "Veterinarian's Hospital"

Instance: NotificationBundleExample
InstanceOf: CEQNotificationBundle
Title: "CQ Notification Bundle Example"
Description: "Example of the CQ Notification Bundle with a SubscriptionStatus and payload URL"
Usage: #example

* type = #batch-response
* entry[sub-status].fullUrl = "http://www.example.org/fhir/Parameters/6b90b3bf-7564-4f4b-95c8-b06ce70699dd"
* entry[sub-status].resource = CEQSubscriptionStatusExample
* entry[sub-status].response.status = "Delivered"
* entry[sub-status].response.lastModified = "2020-08-09T00:04:00Z"
* entry[sub-payload].fullUrl = "http://www.example.org/fhir/Encounter/ed5feed2-f04b-4674-8f75-86410a7f87e9"
* entry[sub-payload].response.status = "Triggered"
* entry[sub-payload].response.lastModified = "2020-08-09T00:00:00Z"


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
