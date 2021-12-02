### Scenario 1

- Jerry is a 68-year-old male in the mid-Atlantic with asthma and Type 2 Diabetes. He is a member of a patient-centered medical home.  He recently became ill, and required EMS assistance and transport to the hospital where he was diagnosed with a community acquired pneumonia with severe dehydration, fever, and coughing.

#### Assumptions:

1. Authentication and Authorization conducted as per Carequality Implementation Guide.
2. PCP either has knowledge of or PCP EHR does query by demographics to determine Hospital PatientID.
3. PCP/Care Coordinator is the Notification Recipient.
4. Subscription, when created, knows Patient, PCP, Care Coordinator, etc.
5. Consent has been captured (if needed).
6. Notification Recipient and Hospital know the patient, so they can create a subscription or find via RLS/eMPI call.
7. Phase 1 assume patients are "known" by both Notification Recipient and Hospital (Notification Generator).

#### Subscription

- Jerry's prior events are stored in the care team notifications service in an actionable way and aligned with computable reimbursement incentive rules for his health plan.

<figure>
{%include SubscriptionFlow.svg%}
<figcaption>Figure 1: PCP Subscribes to Events at Hospital</figcaption>
</figure>

#### Notification

- Jerry's PCP at the patient-centered medical home received a clinical encounter notification that Jerry was admitted to the hospital. The Notification Recipient EHR fetched the resource giving details and the PCP was able to push a C-CDA to the hospital providing a patient summary including Jerry's co-morbidities, (problem list), medications, allergies and immunizations which improved Jerry’s hospital care and recovery.

<figure>
{%include NotificationFlow.svg%}
<figcaption>Figure 2: PCP Receives Admit Notification from Hospital</figcaption>
</figure>

