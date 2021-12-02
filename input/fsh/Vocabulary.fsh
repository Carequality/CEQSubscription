CodeSystem: NHINPurposeOfUse
Title: "NHIN Purpose Of Use"
Description: "These are the permitted Purpose of Use within the Carequality network"

* ^caseSensitive = true
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