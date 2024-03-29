### Introduction

#### Vision

Improve care continuity across settings/systems for patients via subscription-based push notifications.

#### Carequality Subscription Implementation Guide for Push Notifications Introduction

This Implementation Guide outlines policy, technical, and process requirements for Implementers of the Push Notifications Use Case, under the terms of the Carequality Connected Agreement (CCA), and their Carequality Connections (CCs), under the Carequality Connection Terms.

Currently, patients access healthcare services and products and health-related services in a fragmented way across multiple organizations and geographic jurisdictions. An information gap at the moment of making clinical or service assessments presents challenges to ensuring that delivered care is effective, safe, and necessary. Sharing information about care decisions and treatments, unmet service needs, and eligibility for services empowers multi-sector teams to better organize patient care activities that improve outcomes in the context of patient preferences and to improve the delivery of high-value care across siloed systems. Using real-time notifications helps to close the information gap and enables patients, families, caregivers, and health and service providers to be kept in the loop and coordinate their efforts.

Many individuals, especially those with multiple chronic conditions or disabilities, and those facing circumstances of social disadvantage, will benefit from coordination among their healthcare providers and the social and ancillary health service organizations who are assisting on their journey to improved health and well-being (e.g., transportation, housing, nutrition, early childhood programs).  Seamless sharing of notifications about patients and their healthcare event is essential to delivering appropriate services that improve the well-being of individuals.

Carequality is ideally suited to bring added value beyond simple point-to-point notification services, and can instead enable stakeholders to implement consistent approaches to notifications that are only possible at a national, cross-platform, multi-service scale.

The Carequality framework can be leveraged to support notifications when those involved in the patient's care are affiliated with many different organizations, and use many different systems or applications. These notifications are designed to support all relevant individuals in learning about care events in real time, giving a person's extended care team the information they need about a person to improve health outcomes.

Carequality and its community of member organizations have collaborated to define exactly how notifications can be shared across different health and service sectors so that members have confidence in their capability to commit to implementing consistent notification services. This Guide covers technical specifications as well as policy and process requirements for Push Notifications

#### Goals

- Remove the need to poll for solicited:

  - High-frequency events.
  - High-urgency events.

- Ensure a "low bar" for server and client implementation.

- Consider security, confidentiality, and scale during design.
- **NOT focused on unsolicited notifications**
- Project results may be useful as a building block or launching point

Subscriptions are system to system and the receiver of these subscriptions (Subscription Server or subscriber) must be able to route these messages to the appropriate end user (clinician(s), care team members, etc.) within their system. For auditing purposes, identification of a specific user is accomplished through FHIR authorizations as described in the Carequality FHIR Implementation Guide through SMART on FHIR or OAuth.

### Definitions

#### Topic

- Is a well-defined event and can be specialized to an environment (e.g., an acute admit versus an ED admit): 'admission', 'discharge', 'gap in care', etc.
- Implementers (Notification Generators) choose which Topics to support.

#### Subscription

- Is a request for notifications based on a one or more Topics. The end date is required and is a maximum of two years in the future.  Renewals may be sent as subscription updates prior to expiry for up to an additional 2 years per renewal.

#### Notification

- Is a simple FHIR bundle containing the Subscription Status (a resource including the Topic code and notification count) and the Encounter resource or other Resource for Care Gaps. **For the Encounter resource, the display name for the subject, participant, diagnosis and serviceProvider elements must be the Proper Name of the individual/organization to align with CMS regulations.**

#### Security Notes

- It is beyond the scope of this project to define security and authentication procedures. Please see the Carequality FHIR Implementation Guide at [carequality.org](https://carequality.org/wp-content/uploads/2020/12/Carequality-FHIR-Implementation-Guide.pdf) for details on Registration and Authorization.
- Notification Recipient and Notification Generators MUST follow all Carequality FHIR Implementation Guide steps for registration and authentication prior to any posting of subscription requests or sending notifications.

### Legal Statements
{% include ip-statements.xhtml %}