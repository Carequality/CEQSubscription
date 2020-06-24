The Carequality Push Notifcation IG defines specific Actors and Transactions
### Actors
The Push Notifications defines 4 Actors
1. Notification Recipient -- the actor who requests the subscription
2. Notification Generator -- the actor who has responds to the subscription requests based on events
3. Subscription Service (Subscription Management Service) an aggregator that may have a Record Locator Service
4. GeneratorSMS (Data Source Subscription Management Service) an aggregator for one or more Data Sources

### Transactions
These Actors have 3 possible transactions
1. RegisterSubscription -- Push a subscription (bundle) to the receiver
1a. UpdateSubscription -- As per RegisterSubscription, Push a subscription bundle with changed events to the receiver
1b. TerminateSubscription -- As per RegisterSubscription, Push a subscription bundle with a "delete" event to the receiver
2. NotifyEvent -- Push a notification "knock"
3. RetrieveResource -- Retrieve Resource included in the knock  -- outside of scope for the Subscription IG and subject to the Carequality FHIR Implementation Guide, available at [URL]. Included for completeness.

The Actors work with the Transactions as follows:

|Actor|Transactions|Optionality|
|-------------|-------------------------------|:-----:|
|RecipientSMS |RegisterSubscription<br>RetrieveResource |R<BR>O<sup>1|
|Notification Recipient |RegisterSubscription<br>RetrieveResource |R<BR>O<sup>1|
|Notification Generator |NotifyEvent |R|
|GeneratorSMS |NotifyEvent |R|

<sup>1</sup> The Notification Recipient and RecipientSMS may or may not fetch the notification listed Resource depending on business requirements

#### RegisterSubscription
The Notification Recipient or RecipientSMS creates the Subscription resource.  The Subscription is Bundled with the Resource that defines the Notification Recipient (Practitioner, Organization, Patient or RelatedPerson)


#### NotifyEvent
The Notification Generator creates the Event and either requests the GeneratorSMS to notify the receiver or sends the notification to the receiver directly, depending on business requirements.

A notification consists of a POST to the endpoint listed in the Subscription consisting only of a full URL to the Resource.  This "knock on the door" can activate the RetrieveResource transaction.

Notifications from event triggers are simplified to just an http 'knock'.  This follows the basic format of a POST to the Notification Recipient's endpoint with the FullURL of the Resource that has the data for the associated event.  

``` POST https://www.myserver.org/fhir/Encounter/ba90f9ab-fc56-4012-be4c-77cb9cf4cb84 ```

This is sent to the endpoint specified in the Subscription resource that was POSTed to the Notification Generator e.g.,

```http://www.example.org/fhir/subscription/sub123```


#### RetrieveResource

Once notified via the NotifyEvent transaction the Notification Recipient/RecipientSMS can retrieve the Resource and internalize it as dictated by business processes.
