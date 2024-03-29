### Permitted Purposes

Carequality Implementers or CCs represent a diverse set of stakeholders that wish to send and receive Push Notifications for a variety of reasons. It is important to building trust that a common set of reasons to subscribe and generate notifications (Permitted Purposes) be agreed to by all Implementers or CCs of this Use Case. The Permitted Purposes to be made under this Use Case are:

- Treatment
- Payment
- Public Health Activities
- Patient Request
- Coverage Determination
- Healthcare Operations
- Other Authorization-Based Disclosures

The first four terms are used as defined in the Health Insurance Portability and Accountability Act ("HIPAA") and its implementing regulations, 45 C.F.R. Part 160 and 45 C.F.R. Part 164, Subparts A and E, Standards for Privacy of Individually Identifiable Health Information, and 45 C.F.R. Part 164, Subpart C, Security Standards for the Protection of Electronic Protected Health Information. Public Health Activities are those permitted pursuant to 45 C.F.R. Part 164.512(b). An Implementer or CC may claim the Patient Request permitted purpose for notification subscriptions that are directly initiated by the patient or the patient's personal representative as defined by 45 CFR 164.502(g), via a personal health record or other consumer-facing application. Note that any requests for subscription initiated by individuals other than the patient or personal representative may not use the Patient Request permitted purpose, even if the patient has indicated that he or she wishes for the request to occur. For subscriptions initiated directly by the patient's personal representative, the Notification Recipient is responsible for ensuring that the individual initiating a subscription is, in fact, authorized and appropriate to act as the personal representative as defined by HIPAA.

An Implementer may claim the Other Authorization-Based Disclosures permitted purpose if the request is pursuant to an authorization as defined by HIPAA, and the request does not qualify for the Coverage Determination permitted purpose as defined above.

Not every Implementer will support all of the Permitted Purposes allowed for the Push Notification Use Case. Therefore, each Implementer shall identify to Carequality the Permitted Purposes that it and each of its CCs support.

### Full Participation

It is important that all Implementers, CCs and their End Users understand that others are committed to participate in this Use Case so that all those who participate can realize value for their investment of time and resources. An Implementer or CC that plays the role of Notification Generator for this Use Case, is strongly encouraged to provide information in response to valid subscriptions for Treatment, unless doing so would violate applicable law or the Implementer's or CC's local access policies, or unless the data available through the Implementer is of a nature such that it is inappropriate for Treatment. An Implementer or CC may provide notifications in response to subscriptions for other Permitted Purposes, but is not required to do so.

An Implementer or CC is permitted to serve ONLY in the role of Notification Recipient for the Permitted Purpose of Treatment if that Implementer or CC is a government agency or is a provider organization with no clinical information that could reasonably be made available for response as defined below. An Implementer or CC, other than those defined below, who wishes to be a Notification Recipient for Treatment purposes must also play the role of Notification Generator and accept subscriptions for Treatment purposes.

An Implementer or CC who is, or who provides access to, directly or via its CCs, one or more organizations that are subject to the exceptions listed in the previous paragraph, MUST list each such organization – as defined in this specific case to be the smallest separate business entity that as a whole meets the exception requirements – in the Carequality Directory as a distinct, separate entry.

For clarity, note that an individual in solo practice could be an "organization" for purposes of this requirement. These entries must label the organization, in the CarequalityType (Org-CarequalityType) field or SequoiaOrganization.type element , as one of the following values, as appropriate based on that organization's exception: • Government Agency (Notification Recipient Only) • Provider Organization (Notification Recipient Only)

Organizations that do not qualify for the exceptions listed in the previous paragraph MUST NOT be assigned these CarequalityType values, so that the Carequality community can immediately discern which organizations are claiming an exception.

#### Payment and Patient Request

Implementers who support the Notification Generator role MUST provide technical support and contract terms that enable their CCs to honor subscriptions for the Permitted Purposes of Payment, Patient Request, and Health Care Operations. Specifically, Implementers shall, at a minimum:

1. Ensure that their network agreements or other relevant contractual terms are compatible with CCs honoring subscriptions for these Permitted Purposes;
2. Provide CCs with the ability to configure their system, through readily accessible system settings, to honor such subscriptions; and
3. Provide CCs wishing to honor such subscriptions with reasonable technical and operational support in the context of honoring such subscriptions, consistent with the Implementer's support for CCs in the context of honoring subscriptions for the Permitted Purpose of Treatment.

An Implementer or CC that does not subscribe for the Permitted Purpose of Treatment MAY decline to honor subscriptions from an organization, including for Treatment, if that organization does not honor subscriptions for the Permitted Purpose of Operations from that Implementer or CC

#### Permitted Users

No specific Permitted Users have been defined for this Use Case at this time. At this time, Carequality has decided not to create restrictions on Implementers with respect to the workflow in their organizations, and those of their CCs, for how they accomplish one of the Permitted Purposes.
