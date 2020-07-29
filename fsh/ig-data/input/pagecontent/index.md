### Introduction
#### Vision
Improve care management across settings/systems for patients via push notifications.

#### Goals
* Remove the need to poll for solicited:
  *  High-frequency events.
  *  High-urgency events.
* Allow clients to discover missed events.
* Ensure a “low bar” for server and client implementation.
* Consider security, confidentiality, and scale during design.
* **NOT focused on unsolicited notifications**
* Project results may be useful as a building block or launching point

Subscriptions are system to system and the receiver of these subscriptions (Subscription Server or subscriber) must be able to route these messages to the appropriate end user (clinician(s), care team members) within their system. For auditing purposes, identification of a specific user is accomplished through FHIR authorizations as described in the Carequality FHIR Implementation Guide through SMART on FHIR or OAuth.

### Definitions
#### Topic
* Is a well-defined event and can be specialized to an environment (e.g., an acute admit versus an ED admit): ‘admission’, ‘discharge’, ‘gap in care', etc.
* Implementers (Notification Generators) choose which Topics to support.

#### Subscription
* Is a request for notifications based on a one or more Topics.  The end date is required and is a maximum of two years, without renewal.

#### Notification
* Is a simple http 'knock' using POST and containing only the FullURL of the Encounter resource created

#### Security Notes
* It is beyond the scope of this project to define security and authentication procedures. Please see the Carequality FHIR Implementation Guide at [LINK] for details on Registration and Authorization.
* Notification Recipient and Notification Generators MUST follow all Carequality FHIR Implementation Guide steps for registration and authentication prior to any posting of subscription requests or sending notifications.
