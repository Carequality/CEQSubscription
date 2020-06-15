Instance:  CEQSubBundle
InstanceOf: CEQSubscriptionBundle
Title:   "Example Subscribing Bundle"
Usage:  #example

* type = #transaction
* entry[subsciptionentry].resource = CEQsubscriptionExample
* entry[subsciptionentry].request.method = #POST
* entry[subsciptionentry].request.url = "https://www.example.org/subscriptionentry"

* entry[subscriberentry].resource = DrDavidAnydoc
* entry[subscriberentry].request.method = #POST
* entry[subscriberentry].request.url = "https://www.example.org/subscriberentry"
