The Carequality Push Notification IG defines specific Actors and Transactions.  All transactions require following the policies and requirements of the Carequality FHIR Implementation Guide, available at: [LINK]

### Actors
The Push Notifications defines 4 Actors:
1. Notification Recipient -- the actor who requests the subscription.
2. Notification Generator -- the actor who has responds to the subscription requests based on events.
3. Subscription Service (Subscription Management Service) an aggregator that may have a Record Locator Service.
4. GeneratorSMS (Data Source Subscription Management Service) an aggregator for one or more Notification Generators.

### Transactions
 These Actors have 3 possible transactions:
1. RegisterSubscription -- Push a subscription (bundle) to the receiver.
1a. UpdateSubscription -- As per RegisterSubscription, Push a subscription bundle with changed events to the receiver.
1b. TerminateSubscription -- As per RegisterSubscription, Push a subscription bundle with a "delete" event to the receiver.
2. NotifyEvent -- Push a notification bundle.
3. RetrieveResource -- Retrieve Resource included in the bundle  -- outside of scope for the this IG and subject to the Carequality FHIR Implementation Guide, available at [URL]. Included for completeness.

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
The Notification Recipient or RecipientSMS creates the Subscription resource.  The Subscription is Bundled with the Resource that defines the Notification Recipient (Practitioner, Organization, Patient or RelatedPerson)


#### NotifyEvent
The Notification Generator creates the Event and either requests the GeneratorSMS to notify the receiver or sends the notification to the receiver directly, depending on business requirements.

A notification consists of a POST to the endpoint listed in the Subscription consisting of a Bundle.  This "knock on the door" can activate the RetrieveResource transaction depending on the policy and procedures of the receiving organization.

Notifications from event triggers are simplified to just minimal bundle.  This bundle contains two entries, the Subscription status (including topic code) and, a URL of the resource to be fetched that contains the information about the clinical event.  The Subscription status also includes a count of notifications to date, that allows for missed notification tracking.

This Bundle is sent to the endpoint specified in the Subscription resource that was POSTed to the Notification Generator e.g.,

```http://www.example.org/fhir/subscription/sub123```

#### RetrieveResource

Once notified via the NotifyEvent transaction the Notification Recipient/RecipientSMS can retrieve the Resource and internalize it as dictated by business processes.
