
The concept of a role within the use case is central to this Implementation Guide and to defining the rights, obligations, and responsibilities of Carequality Implementers. Implementers play a declared role or roles, and Implementers must indicate to Carequality, during the application process for each use case, which role or roles the Implementer will fill, and which role or roles each of its  fill.
By default, any requirement specified in Sections 3 through 6 of this Guide applies to any Implementer regardless of role. Requirements that apply only to those Implementers with a particular role or roles will clearly indicate the role or roles to which they apply.
### Notification Generator
An Implementer with the declared role of a Notification Generator is any organization, vendor, or other entity that initiates a push notification in response to a triggering event within the generator’s system to a Notification Recipient.
An Implementer with the declared role of a Notification Generator shall support the technical actor(s) specified in Section 4 of this Guide, and comply with any other requirements throughout this Guide that are specifically described as applying to the Notification Generator role.
### Notification Recipient
An Implementer with the declared role of a Receiving System is any system that manages subscriptions and receives notifications.
<span style="display:block;text-align:center">
![Usage Scenario 1, No Intermediary](Scenario1.png "Scenario 1, No Intermediary")
</span>

### Subscription Service
#### Definition
An Implementer or CC with the declared role of an Subscription Service provides subscription data management, and forwards patient specific subscriptions, subscription requests, and push notifications sent to them by Implementers or CCs in the Notification Generator, Notification Receiver, and Subscription Service roles. In addition, Subscription Services provide a list of Implementers and/or CCs in the Notification Generator or Receiver role who potentially have, likely have, or are
known to have a clinical relationship with the patient who is the subject of a subscription.
* An Implementer in the Subscription Service (Subserv) role may have CCs in other roles, even if the Implementer itself only plays the Subscription Service role.
* An Implementer or CC with the declared role of a Subscription Service shall support the technical actor(s) specified in Section 4 of this Guide, and comply with any other requirements throughout this Guide that are specifically described as applying to the Subscription Service role.
* The Subscription Service must have a Business Associate relationship with organizations for whom they are managing subscriptions.
<span style="display:block;text-align:center">
![Scenario 2: Notification Receiver has Subscription Service](Scenario2.png "Scenario 2: Notification Receiver has Subscription Service")
</span><span style="display:block;text-align:center">
![Scenario 3: Notification Generator has Subscription Service](Scenario3.png "Scenario 3: Notification Generator has Subscription Service")
</span><span style="display:block;text-align:center">
![Scenario 4: Both Actors have Subscription Service](Scenario4.png "Scenario 4: Both Actors have Subscription Service")
</span>

#### Limitations to Subscription Services
A Subscription Service may not impose any additional terms beyond the
Carequality Elements, including fees, on Notification Recipients or Notification Generators on any organization that is using the Subscription Service endpoint only to send, pass on, or receive notifications or subscriptions, but are not otherwise contractually bound to that Subscription Service.
* Subscription Services may impose additional terms on their client organizations as they see fit. A Subscription Service must pass along subscriptions and notifications carrying a Carequality Certificate ONLY if those subscriptions come from an Implementer or CC that is validated as such according to the Carequality Technical Trust Policy.
* For Example, a Subscription Service may pass a subscription request from Notification Receiver A to Notification Generator B, even if Notification Receiver A is not a Carequality participant, however, they MAY NOT use a Carequality Certificate for that transaction.
* Subscription Services may communicate subscriptions and notifications for and to entities outside of the Carequality community, however Generators may choose not to honor those subscriptions.

### Multiple Roles
Carequality does not restrict any Implementer from acting in multiple roles within this Use Case.
