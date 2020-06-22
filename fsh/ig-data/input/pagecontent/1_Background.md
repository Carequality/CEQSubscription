* Based on the Use Case Proposal, Notification Types define:
  * What information is sent
  * Policies around who is able to subscribe and when
  * What triggers are used
  * Technical Specifications
Asserting that you support a Notification Type means that agree to abide by that Notification Type’s specific policies and requirements

### Triggering Events for Each Notification Type
#### Admission
When a patient has been checked into the EHR system.  Codes vary by venue type.  

#### Discharge
Push Notification Implementers should use the same criteria for the Discharge Trigger that they use for meaningful use reporting.  (i.e., patient's status is changed to "discharged"). Notes, such as Against Medical Advice, are included in the resulting Encounter Resource

#### Referrals
Only applies to Secondary Referrals.  Internal consults are not included.

#### Transfer
Push Notification Implementers should use the same criteria for the Transfer trigger that they use for meaningful use reporting.

#### Gaps in Care
The defintion of a gap in care is Implementer dependent.
