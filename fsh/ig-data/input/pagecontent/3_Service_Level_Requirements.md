### Capability Statement and Versioning Conformance

Implementers shall support the notion of backwards compatibility until such a time that a particular version has been officially sun-setted by Carequality. Carequality, with the input of the Implementer community, shall determine the appropriate live versions and backwards compatibility. This shall include the specific version and how long it shall be maintained.

Implementers shall list this IG in their Capability Statement **and** which subscription topics they support in the Carequality Directory.

### Notification Generation Latency

Implementers should generate Notifications in response to specific triggering events. For example: The table below lists the scenario and maximum acceptable latency.  Notifications must acheive these requirements for at least 99% of notifications.:

|Trigger      | Latency|
|------------ | ----------------------------------------------------------------|
Admission    | 5 minutes or less
Discharge    | 5 minutes or less
Referral     | 5 minutes or less
Transfer     | 5 minutes or less
Gaps in Care | If batch processing generation within 24hrs, otherwise 5 minutes or less

Notification Generators encountering timeouts on delivery attempts shall retry these attempts at reasonable intervals for at least sixty (60) minutes before terminating attempts.  The timelines for retries will be re-evaluated after one year to determine if additional requirements are necessary.

### Uptime

Implementers should measure uptime on a monthly basis at the Gateway level. Such measurements should only take into account unplanned downtime. Implementers should strive to achieve 99.9% uptime. The SLA target uptime should be 99.5%.

### Unplanned and Planned Downtime

Please see the Carequality FHIR Implementation Guide for downtime requirements.

Notification Generators should store outgoing notifications and distribute them when their planned or unplanned downtime has ended.
