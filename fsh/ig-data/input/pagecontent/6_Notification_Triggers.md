### Triggering Events for Each Notification Type

Asserting that you support a Notification Type means that agree to abide by that Notification Type’s specific policies and requirements.

#### Admission
When a patient has been checked into the EHR system.  Codes vary by venue type.

<table border="1">
<thead>
<tr>
<th>Venue</th>
<th>Definition</th>
<th>Code</th>
</tr>
</thead>
<tbody>
<tr>
<td>General</td>
<td>Patient has been checked in to the EHR, <br> includes all subsidiary admit events</td>
<td>admit</td>
</tr>
<tr>
<td>ED</td>
<td>Patient is triaged</td>
<td>edadmit</td>
</tr>
<tr>
<td>Acute</td>
<td>An admission order has been issued and bed is assigned</td>
<td>acadmit</td>
</tr>
<tr>
<td>Ambulatory</td>
<td>Admitted to an ambulatory encounter</td>
<td>ambadmit</td>
</tr>
<tr>
<td>Skilled Nursing/<br> Rehab</td>
<td>Bed is assigned and patient has arrived</td>
<td>snradmit</td>
</tr>
</tbody>
</table>

#### Discharge
Push Notification Implementers should use the same criteria for the Discharge trigger that they use for meaningful use reporting.  (i.e., patient's status is changed to "discharged"). Notes, such as Against Medical Advice, are included in or attached to the resulting Encounter Resource.

#### Referrals
Only applies to Secondary Referrals (i.e., referrals not made by the Notification Recipient).  Internal consults are not included.

#### Transfer
The issuance of a transfer order that will not create an admit notification from the same system and is not originating from the Notification Recipient.

#### Gaps in Care
A trigger based on the [eCQM as defined by CMS](https://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/ClinicalQualityMeasures "Electronic Clinical Quality Measures Basics") or other request for follow-up based on Notification Generator policy or process.
