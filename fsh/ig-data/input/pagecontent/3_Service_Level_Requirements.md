### Capability Statement and Versioning Conformance  
Implementers shall support the notion of backwards compatibility until such a time that a particular version has been officially sun-setted by Carequality.  Carequality, with the input of the Implementer community, shall determine the appropriate live versions and backwards compatibility. This shall include the specific version and how long it shall be maintained.

Implementers shall list in their Capability Statement __and__ in the Carequality Directory which subscription Topics they support.

### Notification Generation Latency
Implementers should generate Notifications in response to specific triggering events. For example: The table below lists the scenario and maximum acceptable latency:

|Trigger|Latency|
|--------|---------|
|Admission|Immediate<sup>*</sup>|
|Discharge|Immediate|
|Referral|Immediate|
|Transfer|Immediate|
|Gaps in Care|If batch processing generation within 24hrs, otherwise immediate|
<sup>*</sup> 5 minutes or less
### Uptime
Implementers should measure uptime on a monthly basis at the Gateway level.  Such measurements should only take into account unplanned downtime. Implementers should strive to achieve 99.9% uptime. The SLA target uptime should be 99.5%.

### Unplanned and Planned Downtime
Please see the Carequality FHIR Implementation Guide for downtime requirements.

Implementers should store outgoing notifications and distribute them when the planned or unplanned downtime has ended.
