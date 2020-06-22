### Capability Statement Versioning Conformance  
Implementers shall support the notion of backwards compatibility until such a time that a particular version has been officially sun-setted by Carequality. Implementers shall list in their Capability Statement and in the Carequality Directory which subscriptions they support. Carequality, with the input of the Implementer community, shall determine the appropriate live versions and backwards compatibility. This shall include the specific version and how long it shall be maintained.

### Notification Generation Latency
Implementers should generate Notifications in response to specific triggering events. For example: The table below lists the scenario and maximum acceptable latency:

|Trigger|Latency|
|--------|---------|
|Admission|Immediate (5 minutes or less)|
|Discharge|Immediate |
|Gaps in Care|Batch within 24hrs|
|Referral|Immediate|
|Transfer|Immediate|

### Uptime
Implementers should measure uptime on a monthly basis at the Gateway level.  Such measurements should only take into account unplanned downtime. Implementers should strive to achieve 99.9% uptime. The SLA target uptime should be 99.5%.

### Unplanned and Planned Downtime
As a best practice, Implementers should schedule planned downtime for windows with the least amount of traffic. For example, in many cases after midnight PST and before 6:00 am EST. Implementers should store outgoing notifications and distribute them when the planned or unplanned downtime has ended.
