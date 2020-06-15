# Notifications
Notifications from event triggers are simplified to just an http 'knock'.  This follows the basic format of a POST to the subscriber's endpoint with the FullURL of the encounter that has the data for the associated event.  

``` POST https://www.myserver.org/fhir/Encounter/ba90f9ab-fc56-4012-be4c-77cb9cf4cb84 ```

This is sent to the endpoint specified in the Subscription resource that was POSTed to the DataSource e.g.,

```http://www.example.org/fhir/subscription/sub123```
