Instance: CEQsubscription
InstanceOf: OperationDefinition

* id = "ceqsubscribe"
* name = "CEQsubscribe"
* title = "Carequality Subscription Submission"
* description = "Operation for pushing a Bundle to the Notification Generator that includes the Subscription resource and the Resource indicating the end user of the notificaitons"
* status = #draft
* kind = #operation
* code = #ceqsubscribe

* system = false
* type = true
* instance =  true
* parameter[0].name = #subscription
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].documentation = "The subscription request being submitted"
* parameter[0].type = #canonical
* parameter[0].targetProfile = "https://sequoiaproject.org/fhir/sphd-r4/StructureDefinition/CEQSubscriptionBundle"

* parameter[1].name = #return
* parameter[1].use = #out
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].documentation = "If the operation outcome does not list any errors, then this is an indication that the operation would be expected to succeed"
* parameter[1].type = #OperationOutcome
