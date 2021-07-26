RuleSet: FHIRPushStructureDefinitionContent
* ^status = #draft      // draft until final published
* ^experimental = true  // true until ready for pilot, then false
* ^version = "0.1.0"    // Follow IG Versioning rules
* ^publisher = "Carequality"
* ^contact[0].telecom.system = #url
* ^contact[0].telecom.value = "https://carequality.org/get-involved/technical-workgroup/"
* ^contact[1].telecom.system = #email
* ^contact[1].telecom.value = "mailto:david.pyke@readycomputing.com"
* ^jurisdiction.coding = urn:iso:std:iso:3166#US

RuleSet: FHIRPushDefinitionContent
* ^status = #draft      // draft until final published
* ^experimental = true  // true until ready for pilot, then false
* ^version = "0.1.0"    // Follow IG Versioning rules
* ^publisher = "Carequality"
* ^contact[0].telecom.system = #url
* ^contact[0].telecom.value = "https://carequality.org/get-involved/technical-workgroup/"
* ^contact[1].telecom.system = #email
* ^contact[1].telecom.value = "mailto:david.pyke@readycomputing.com"
* jurisdiction.coding = urn:iso:std:iso:3166#US

RuleSet: CEQsubscribeCapabilityStatementContent
* status = #draft
* experimental = true
* date = "2020-05-07"
* publisher = "Carequality"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml
* implementationGuide = "https://build.fhir.org/ig/DavidPyke/CEQSubscription/index.html"
