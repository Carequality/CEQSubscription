# Scenario 1
* Jerry is a 68-year-old male in the mid-Atlantic with asthma and Type 2 Diabetes. He is a member of a patient-centered medical home, and required EMS assistance for severe dehydration, fever, and coughing.

## Assumptions:
1. Authentication and Authorization conducted as per Carequality Implementation Guide
2. PCP either has knowledge of or PCP EMR does query by demographics to determine Hospital PatientID
3. PCP and Care Coordinator are the “Subscriber”
4. Subscription, when created, knows Patient, PCP, CareCoordinator, etc.
5. Consent has been captured (if needed)
6. PCP and Hospital know the patient, so they can create a subscription or find via RLS/eMPI call
7. Phase 1 assume patients are “known” by both PCP (subscriber) and Hospital (Notification generator)

## Subscription
* Jerrry's prior events are stored in the care team notifications service in an actionable way and aligned with computable reimbursement incentive rules for his health plan.
![PCP Subscribes to Events at Hospital](SubscriptionFlow.png "Subscription Flow")

## Notification
* Jerry’s PCP at the patient-centered medical home received a clinical encounter notification that Jerry was admitted to the hospital. The PCP EHR fetched the resource giving details and the PCP was able to call the hospital and provide a brief history of Jerry’s co-morbidities, which improved Jerry’s recovery time.
![PCP Receives Admit Notification from Hospital](NotificationFlow.png "Notification Flow")
