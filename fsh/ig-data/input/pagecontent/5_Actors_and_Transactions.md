The Carequality Push Notification IG defines specific Actors and Transactions. All transactions require following the security and authentication policies and requirements of the Carequality FHIR Implementation Guide, available at: [LINK]

### Actors

The Push Notification IG defines 4 Actors:

1. Notification Recipient -- the actor who requests the subscription.
2. Notification Generator -- the actor who responds to the subscription requests based on events.
3. RecipientSMS (Subscription Management Service) the actor who is an aggregator that may have a Record Locator Service and may act as a Recipient on behalf of the Notification Recipient and forward the notifications to the Notification Recipient.
4. GeneratorSMS (Data Source Subscription Management Service) the actor who may act as an aggregator for one or more Notification Generators and send the notifications to the Notification Recipient.

### Transactions

These Actors have 3 possible transactions:

1. RegisterSubscription -- Push a subscription to the receiver.

   1a. UpdateSubscription -- As per RegisterSubscription, Push a subscription  with changed events to the receiver.

   1b. TerminateSubscription -- As per RegisterSubscription, Push a subscription with a "delete" event to the receiver.
2. NotifyEvent -- Push a notification bundle.
3. RetrieveResource -- Retrieve Resource included in the bundle -- outside of scope for the this IG and subject to the Carequality FHIR Implementation Guide, available at [URL]. Included for completeness.

The Actors work with the Transactions as follows:

<table border=1>
<thead>
<tr>
<th>Actor</th>
<th>Transactions</th>
<th style="text-align:center">Optionality</th>
</tr>
</thead>
<tbody>
<tr>
<td>Notification Recipient</td>
<td>RegisterSubscription<br>RetrieveResource</td>
<td style="text-align:center">R<BR>O<sup>1</sup></td>
</tr>
<tr>
<td>Notification Generator</td>
<td>NotifyEvent</td>
<td style="text-align:center">R</td>
</tr>
<tr>
<td>RecipientSMS</td>
<td>RegisterSubscription<br>RetrieveResource</td>
<td style="text-align:center">R<BR>O<sup>1</sup></td>
</tr>
<tr>
<td>GeneratorSMS</td>
<td>NotifyEvent</td>
<td style="text-align:center">R</td>
</tr>
</tbody>
</table>

<sup>1</sup> The Notification Recipient and RecipientSMS may or may not fetch the notification's listed Resource depending on business requirements.

#### RegisterSubscription

The Notification Recipient or RecipientSMS creates the Subscription Profile. The Subscription Profile contains the canonical URL that represents the events that the Notification Recipient wishes to subscribe to and the Patient identifier or Patient ResourceID in addition to other business information.

The Subscription is Bundled with the Profile or Resource that defines the Notification Recipient (Practitioner, Organization, Patient or RelatedPerson).

#### NotifyEvent

The Notification Generator creates the Event and either requests the GeneratorSMS to notify the receiver or sends the notification to the receiver directly, depending on business requirements.

A notification consists of a [history bundle](http://hl7.org/fhir/http.html#history) sent to the endpoint listed in the Subscription. This notification can activate the RetrieveResource transaction depending on the policy and procedures of the receiving organization.

The Notification bundle contains a minimum of two entries, the Subscription Status profile and one or more resources that contain the information about the clinical event. The Subscription Status profile also includes a count of notifications to date, allowing for missed notification tracking.

This Bundle is sent to the endpoint specified in the Subscription resource that was POSTed to the Notification Generator e.g.,

`http://www.example.org/fhir/subscription/sub123`

#### RetrieveResource

Once notified via the NotifyEvent transaction the Notification Recipient/RecipientSMS can retrieve additional Resources and internalize them as dictated by business processes.
