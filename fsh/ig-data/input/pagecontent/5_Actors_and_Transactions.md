# Actors and Transactions
The Carequality Push Notifcation IG defines specific Actors and Transactions to define
## Actors
The Push Notifications defines 4 Actors
1. Subscriber -- the actor who requests the subscription
2. DataSource -- the actor who has responds to the subscription requests based on events
3. SubscriberSMS (Subscription Management Service) an aggregator that may have a Record Locator Service
4. DataSMS (Data Source Subscription Management Service) an aggregator for one or more Data Sources

## Transactions
These Actors have 3 possible transactions
1. RegisterSubscription -- Push a subscription (bundle) to the receiver
1a. Update Subscription -- Push a subscription bundle with changed events to the receiver
1b. Terminate Subscription -- Push a subscription bundle with no events to the receiver
2. NotifyEvent -- Push a notification "knock"
3. RetrieveEncounter -- Retrieve Resource include in knock -- outside of scope for the Subscription IG and subject to the Carequality FHIR Implementation Guide, available at [URL]. Included for completeness.

The Actors work with the Transactions as follows:

|Actor|Transactions|Optionality|
|-------------|-------------------------------|:-----:|
|SubscriberSMS|RegisterSubscription<br>RetrieveEncounter|R<BR>O<sup>1|
|Subscriber|RegisterSubscription<br>RetrieveEncounter|R<BR>O<sup>1|
|DataSource|NotifyEvent|R|
|DataSMS|NotifyEvent|R|


<sup>1</sup> The Subscriber and SubscriberSMS may or may not fetch the notification listed Resource depending on business requirements
### RegisterSubscription
The Subscriber or SubscriberSMS creates the Subscription resource.  If the actor is the SubscriberSMS, the Subscription is Bundled with the Resource that defines the Subscriber (Practitioner, Organization, Patient or RelatedPerson)

If the Actor is a SubscriberSMS, a second request for a subscription for the same patient may be sent by sending a new Bundle that includes the original Subscription and the Resource that defines the new Subscriber.

### NotifyEvent
The DataSource creates the Event and either requests the DataSMS to notify the receiver or sends the notification to the receiver directly, depending on business requirements.

A notification consists of a POST to the endpoint listed in the Subscription consisting only of a full URL to the Resource.  This "knock on the door" can activate the RetrieveEncounter transaction.

### RetrieveEncounter

Once notified via the NotifyEvent transaction the Subscriber/SubscriberSMS can retrieve the Resource and internalize it as dictated by business processes.
