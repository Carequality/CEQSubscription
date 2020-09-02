### Permitted Purposes
Carequality Implementers represent a diverse set of stakeholders that wish to send and receive Push Notifications for a variety of reasons. It is important to building trust that a common set of reasons to subscribe and generate notifications (Permitted Purposes) be agreed to by all Implementers of this Use Case. The Permitted Purposes to be made under this Use Case are:

*	Treatment
*	Payment
*	Public Health Activities
*	Patient Request
*	Other Authorization-Based Disclosures

The first four terms are used as defined in the Health Insurance Portability and Accountability Act (“HIPAA”) and its implementing regulations, 45 C.F.R. Part 160 and 45 C.F.R. Part 164, Subparts A and E, Standards for Privacy of Individually Identifiable Health Information, and 45 C.F.R. Part 164, Subpart C, Security Standards for the Protection of Electronic Protected Health Information. Public Health Activities are those permitted pursuant to 45 C.F.R. Part 164.512(b). An Implementer may claim the Patient Request permitted purpose for queries notification subscriptions that are directly initiated by the patient or the patient’s personal representative as defined by 45 CFR 164.502(g), via a personal health record or other consumer-facing application. Note that any requests for subscription initiated by individuals other than the patient or personal representative may not use the Patient Request permitted purpose, even if the patient has indicated that he or she wishes for the request to occur. For queries subscriptions initiated directly by the patient’s personal representative, the Notification Recipient is responsible for ensuring that the individual initiating the subscription is, in fact, authorized and appropriate to act as the personal representative as defined by HIPAA.

An Implementer may claim the Other Authorization-Based Disclosures permitted purpose if the request is pursuant to an authorization as defined by HIPAA, and the request does not qualify for the Coverage Determination permitted purpose as defined above.

Not every Implementer will support all of the Permitted Purposes allowed for the Push Notification Use Case. Therefore, each Implementer shall identify to Carequality the Permitted Purposes that it and each of its CCs support.

When an Implementer initiates a subsription, it shall clearly identify the specific Permitted Purpose, according to the NHIN Authorization Framework 3.0 specification, section 3.2.2.6, Purpose Of Use Attribute, as referenced in this Guide. By asserting a Permitted Purpose, an Implementer certifies that the context of its request meets the requirements for the stated Permitted Purpose as defined above.
Note that the Permitted Purposes allowed for Carequality are a subset of those defined in the NHIN Authorization Framework, with the caveat that Other Authorization-Based Disclosures provides some additional flexibility. See the table below for additional information on the Other Authorization-Based Disclosures permitted purpose. The specific NHIN PurposeOfUse values that may be used to represent the Carequality permitted purposes are as follows:

|Carequality Permitted Purpose of Use | NHIN PurposeOfUse code |
|----------------|--------------------|
|Treatment|TREATMENT
|Payment|PAYMENT
|Public Health Activities|PUBLICHEALTH
|Patient Request|REQUEST|


Note that the PurposeOfUse codes defined by the NHIN Authorization Framework encompass two separate concepts – the immediate use to which the information released will be put, and other attributes of the request that may impact the Notification Generator's access policies. Carequality divides these two concepts into the Permitted Purpose, and Access Policy Assertions (the latter fully described below). For example, Carequality has defined a Policy Assertion to indicate when a request is being made in an emergency situation. The information released in such a case is most likely going to be used for treatment, so in Carequality’s defined structure the PurposeOfUse is Treatment, with a Policy Assertion of Emergency, potentially among others that may also apply.

###	 Full Participation

It is important that all Implementers, CCs and their End Users understand that others are committed to participate in this Use Case so that all those who participate can realize value for their investment of time and resources.

An Implementer that plays the role of Notification Generator for this Use Case, is strongly encouraged to provide information in response to valid subscriptions for treatment, unless doing so would violate applicable law or the Implementer’s or CC’s local access policies, or unless the data available through the Implementer is of a nature such that it is inappropriate for treatment. An Implementer may provide information notifications in response to queries subscriptions for other Permitted Purposes but is not required to do so.

An Implementer is permitted to serve ONLY in the role of Notification Recipient for the Permitted Purpose of treatment if that Implementer is a government agency, is a provider organization with no clinical information that could reasonably be made available for response as defined below, or is an EMS provider with alternative provision of data, as defined below. An Implementer, other than a government agency or those defined below, who wishes to be a Notification Recipient for treatment purposes must also play the role of Notification Generator for treatment purposes.

An Implementer who is, or who provides access to, directly or via its CCs, one or more organizations that are subject to the exceptions listed in the previous paragraph, MUST list each such organization – as defined in this specific case to be the smallest separate business entity that as a whole meets the exception requirements – in the Carequality Directory as a distinct, separate entry. For clarity, note that an individual in solo practice could be an “organization” for purposes of this requirement. These entries must label the organization, in the Organization Type (Org-Type) field, as one of the following values, as appropriate based on that organization’s exception:

*	Government Agency (Notification Recipient Only)
*	Provider Organization (Notification Recipient Only)

Organizations that do not qualify for the exceptions listed in the previous paragraph MUST NOT be assigned these Org-Type values, so that the Carequality community can immediately discern which organizations are claiming an exception.

#### Payment and Patient Request
Implementers who support the Notification Generator role MUST provide technical support and contract terms that enable their CCs to honor subscriptions for the Permitted Purposes of Payment, Patient Request, and Health Care Operations. Specifically, Implementers shall, at a minimum:

1. ensure that their network agreements or other relevant contractual terms are compatible with CCs honoring subscriptions for these Permitted Purposes;

2. provide CCs with the ability to configure their system, through readily accessible system settings, to honor such subscriptions; and
3. provide CCs wishing to honor such subscriptions with reasonable technical and operational support in the context of honoring such subscriptions, consistent with the Implementer’s support for CCs in the context of honoring subscriptions for the Permitted Purpose of Treatment.

The content provided for the Permitted Purposes of Payment and Patient Request may contain the same content released for the Treatment Purpose, though Implementers and CCs may also respond with an information set that is specific to a subscriber’s Permitted Purpose. Implementers and CCs may also choose to do so in order to comply with that Implementer or CC’s Applicant Business Rules or Organization Business Rules, and/or Applicable Law.

An Implementer or CC that does not support subscriptions for the Permitted Purpose of Treatment MAY decline to honor subscriptions from an organization, including for Treatment, if that organization does not honor subscriptions for the Permitted Purpose of Operations from that Implementer or CC.
#### Permitted Users
No specific Permitted Users have been defined for this Use Case at this time. Carequality does not want to create restrictions on Implementers with respect to the workflow in their organizations, and those of their CCs, for how they accomplish one of the Permitted Purposes.
