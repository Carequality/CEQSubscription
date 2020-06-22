CodeSystem: NHINPurposeOfUse
Title: "NHIN Purpose Of Use"
Description: "These are the permitted Purpose of Use within the Carequality network"

* #TREATMENT "Treatment" "Per 45 CFR § 164.501"
* #PAYMENT "Payment" "Per 45 CFR § 164.501"
* #OPERATIONS "Health Care Operations" "Per 45 CFR § 164.501"
* #PUBLICHEALTH "Public Health Activities" "Per 45 CFR § 164.512(b)"
* #REQUEST "Patient Request" "Directly initiated by the patient or the patient’s personal representative as defined by 45 CFR 164.502(g), via a personal health record or other consumer-facing application"
* #COVERAGE "Coverage Determination"

ValueSet: CEQSubscriberPurposeofUse
Title: "Permitted Purposes Of Use"
Description: "These are the permitted Purpose of Use within the Carequality network"

* NHINPurposeOfUse#TREATMENT
* NHINPurposeOfUse#PAYMENT
* NHINPurposeOfUse#OPERATIONS
* NHINPurposeOfUse#PUBLICHEALTH
* NHINPurposeOfUse#REQUEST
* NHINPurposeOfUse#COVERAGE

CodeSystem: CEQNotificationEvents
Title: "Carequality Push Notification Events"
Description: "The codes to define each of the permitted events for Carequality Network Subscriptions"

* #admit "Admit" "Admission event"
* #edadmit "ED Admit" "Emergency Department Admission"
* #acadmit "Acute Admit" "Acute Care Admission"
* #ambadmit "Ambulatory Admit" "Ambulatory Care Admission"
* #snradmit "Skilled/Rehab Admit" "SKilled Nursing or Rehabilitation Center Admission"
* #discharge "Discharge" "Discharge event"
* #transfer "Transfer" "Transfer of a Patient"
* #arrival "Arrival" "Arrival at a port of call or other location where people arrive"
* #caregap "Gap in Care" "Implementer Defined"
* #refer "Referral" "A Secondary Referral to another practitioner"
* #delete "Delete Subscription" "Cancel subscription to all events"

ValueSet: CEQPushEventCodes
Title: "Carequality Push Notification Events"
Description: "The codes to define each of the permitted events for Carequality Network Subscriptions"

* CEQNotificationEvents#admit
* CEQNotificationEvents#edadmit
* CEQNotificationEvents#ambadmit
* CEQNotificationEvents#snradmit
* CEQNotificationEvents#acadmit
* CEQNotificationEvents#discharge
* CEQNotificationEvents#transfer
* CEQNotificationEvents#arrival
* CEQNotificationEvents#caregap
* CEQNotificationEvents#refer
* CEQNotificationEvents#delete
