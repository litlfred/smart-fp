Profile: WHO-FP_Observation_(Medical_eligibility_number)
Parent: Observation
Id: who-fp-observation-medical-eligibility-number
Title: "WHO-FP Observation (Medical eligibility number)"
Description: "System generated medical eligibility value for numerical ratings"
* ^name = "WHO-FP Observation (Medical eligibility number)"
* ^status = #draft
* ^experimental = false
* . ^short = "Medical eligibility - number classification"
* . ^comment = "[Data stored with record (FP.RQ.002.011) and used to populate an alert.]"
* . ^mustSupport = false
* value[x] only integer
* value[x] 0..1 MS
* value[x] ^binding.strength = #required
* value[x] ^binding.valueSet = Canonical($medicaleligibilitynumber-values)