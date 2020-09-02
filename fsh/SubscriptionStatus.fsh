Instance: CEQSubscriptionStatusExample
InstanceOf: CEQSubscriptionStatus
Title: "SubscriptionStatus Example"
Description: "An example of the Carequality Susbscription Status Profile"
Usage: #example

* parameter[status].valueCode = #active
* parameter[subscriptionUrl].valueUri = "http://example.org/subscription/uri"
* parameter[eventCode].valueCoding = PushCode#admit
* parameter[subscriptionEventCount].valueUnsignedInt = 25
