# provider_tracker
Hours and location tracker for homecare providers in the field.

## Problem Statement

In my previous job as a case coordinator at the Illinois Department of Rehabilition Services (DRS), part of my job was to monitor the hours and location of personal assistants(also referred to as "providers") who helped my clients with their daily tasks at home.  For my capstone I would like to write a fieldworker tracking software that would be better suited for the needs of low income DRS clients and providers than the expensive and difficult to use system they currently use.

* PROBLEM: Currently providers called into a automated operator and have to go through up to ten steps of entering ID number, client case numbers, and choosing menu items to clock in and out.  There was no feedback if they entered their information incorrectly.  Providers who repeatedly and unknowingly entered the wrong information were at risk of being terminated for fraud.

* SOLUTION: My project will allow the provider to text their ID number to my system, and will return a SMS message with a unique link that will clock them in once they go to the link.  This will allow the user to see the number they are entering in and will return an error message if they enter information incorrectly.  It will also use up less of their limited resources - as they won't always have to use the same phone, or waste minutes on their limited mobile plans.

* PROBLEM: The system required the client to have a landline telephone as a means to identify that the provider was at the client's home.  All of our clients lived below the poverty line, and very few had reliable phone service.  Most depended on the use of government sponsored cell phones with less than 250 minutes per month.  This problem left most clients and providers unable to verify their locations as the state required.

* SOLUTION:  My project will verify location through an API that I write that will pull the IP address location when a user goes to the link provided in an SMS message.  Though IP address location is not foolproof, it will be a more realistic solution to narrowing down a users location given the resources that the user has (government cell phones with limited minutes) 

* PROBLEM: The current system used by DRS does not take into account the needs of the administrators.  The software was written for hospital field workers, and does not fit the needs of a DRS employee - such as notifications when a client has had no providers visit them for an extended period of time, or may have moved without notifying the office.

* SOLUTION:  My project would send alerts to the administrator if a client's case is associated with unusual behavior (clients with no check-ins from providers, or check-ins repeatedly coming from an area not associated with a client's known address).  These automations would be incredibly helpful to case managers, and help them better manage their caseloads which can include over 1,000 clients.

## Draft Feature Set

* Database that logs clients, their address, their providers, provider ID #'s, history of provider check ins/outs, and contact information for clients and providers
* API that accepts SMS from provider and returns unique link for checking in - then returns time and location information of check ins/outs to database
* Administrator interface that displays client and provider information, and alerts administrator of unusual behavior

## Draft Technology Choices
* SMS messaging API
* Live Events (notifications, live updates)
* Visualization tools (high charts, D3)
* Python
* AWS
