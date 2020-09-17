Instance:   DrDavidAnydoc
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner
Title:  "Dr. David Anydoc"
Description: "Example of a US Core R4 Practitioner"

Usage:  #example
* name[0].family = "Anydoc"
* name[0].given[0] = "David"
* name[0].suffix[0] = "MD"
* identifier[NPI].value = "8274017284"

Alias: RaceAndEthnicityCDC = urn:oid:2.16.840.1.113883.6.238

Instance:  EveAnyperson
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
Title:   "Eve Anyperson"
Description: "Example of a US Core R4 Patient"

Usage:  #example
* identifier.system = "urn:uuid:23667766-1c34-4ab8-9903-48c3afc9fb34"
* identifier.value = "anyperson"
* name.given = "Eve"
* name.family = "Anyperson"
* birthDate = 1960-04-25
* gender = #female


Instance: VeterinariansHospital
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization
Title: "Veterinarian's Hospital"
Description: "Example of a US Core R4 Organization"

Usage:  #example
* active = true
* name = "Veterinarian's Hospital"

Instance: ExampleDischarge
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter
Title: "An Example Discharge Encounter"
Description: "Example of a US Core R4 Encounter"

Usage:  #example

* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#ACUTE
* type =  http://snomed.info/sct#448337001 "Telemedicine consultation with patient"
* subject = Reference(EveAnyperson)
* reasonCode = http://snomed.info/sct#1917008 "Patient discharge, deceased, medicolegal case"
