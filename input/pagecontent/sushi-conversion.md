This IG was converted on 2026-11-10 from an XML ImplementationGuide (`input/fp-cds.xml` plus JSON resources) to FSH, built with sushi ([litlfred/smart-fp#3](https://github.com/litlfred/smart-fp/pull/3)). sushi runs with 0 errors. This page records how the JSON that sushi generates compares with the original JSON resources.

### Result
- **16 of 46 resources identical field by field**: all 15 value sets (13 now FSH, 2 kept as JSON) and the deliverymethod extension (kept as JSON). The generated ImplementationGuide has the XML IG's identity, page tree and parameters.
- The code system differs only by `count: 9`, which sushi adds.
- **Snapshots: 25 of 26 profiles identical** to the original (computed for both sides with fhir-snapshot-generator against hl7.fhir.r4.core 4.0.1). The one difference: `CarePlan.activity.detail.extension` gets the standard `slicing` by `url` in the sushi version (the IG Publisher normally adds this default slicing to extension elements when it builds a snapshot, so the published result should match; not yet checked against an IG Publisher build).
- 3 profiles could not be snapshotted by the tool on either side (deep paths into Reference/CodeableConcept). Their differentials differ only by `min`/`max` equal to the base, which sushi leaves out.

### What differs in the raw JSON, and why it doesn't change meaning
| Difference | Count | Why |
|---|---|---|
| `min`/`max` equal to the base left out | 60 (in 29 profiles) | sushi only writes what changes the base. |
| `Observation.valueX` → `Observation.value[x]` + `only X` | 15 | Same snapshot; FSH has no renamed-path form. |
| `CodeSystem.count` added | 1 | sushi fills the count (9). |
| reason-for-stopping: two type slices | 1 | value[x] limited to CodeableConcept or string with the same per-type rules; tool couldn't snapshot the original. |

### Kept as JSON (would otherwise change)
- `StructureDefinition/deliverymethod`: `Extension.extension 0..1` next to a value; sushi refuses it.
- `ValueSet/contraception-issues-and-concerns-values` (N89.8 twice) and `ValueSet/medicaleligibilityconditions-values` (CIEL 159276, 144475; ICD-11 BD72, 8B20, 5A14 repeated): FSH drops duplicate codes.

### Defects in the original, reproduced as-is (caret rules)
- 0..* on 0..1 elements (8 profiles), 0..1 on 1..1 elements (Observation.code in medical-eligibility, Procedure.status, MedicationStatement.medication[x]).
- A required binding on `Observation.valueInteger` (medical-eligibility-number).
- `DeviceUseStatement.device.type` constrains Reference.type, likely meant Device.type.
