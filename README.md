# GPS Time Clock
######Capstone for Ada Developer's Academy - 30 day solo project

######Text Messaging Based hours and location tracker for homecare providers.
#####(Ruby, Rails, JavaScript, JQuery, HTML5, CSS3, Twilio, Pusher, Pinlogic) 

### Disclaimer: Documentation is under construction.  Project was previously deployed on AWS and available at GPStimeClock.org, but I have taken offline due to server costs.  If you would like a demo, I can temporarily re-deploy the project for you to try.

------------------------------------------

### Problem Statement

In my previous job as a case coordinator at the Illinois Department of Rehabilition Services (DRS), part of my job was to monitor the hours and location of personal assistants who helped my clients with their daily tasks at home.  For my capstone I built a fieldworker tracking software that would be better suited for the needs of low income DRS clients and workers than the expensive and difficult to use system they currently use.  I also made a web application  front end for administrators to address frustrations I experienced using the administrator dashboard currently used by DRS employees.


* PROBLEM: Currently homecare workers call into a automated operator and have to go through up to ten steps of entering their employee ID number, client case numbers, and choosing menu items to clock in and out.  There is no feedback if they enter their information incorrectly.  Workers who repeatedly and unknowingly enter the wrong information are at risk of being terminated for fraud.

* SOLUTION: My project allows the worker to text their ID number to a Twilio number to check in and out of a shift, and returns a SMS message with a unique link from Pinlogic that will record the time and location of their check in/out.  This allows the user to see the number they are entering in and returns an error message if they enter information incorrectly.  It will also uses less of the worker and client's limited resources - as they won't always have to use the same phone, or waste minutes on their limited mobile plans.

* PROBLEM: The current system requires the client to have a landline telephone as a means to identify that the worker is at the client's home.  All of our clients live below the poverty line, and very few have reliable phone service.  Most rely on the use of government sponsored cell phones with less than 250 minutes per month.  This problem leaves most clients and workers unable to verify their locations as the state requires.

* SOLUTION:  My project verifies location via GPS, and is not tied to one specific phone.  This allows flexibilty for workers and clients and does not penalize them for not being able to afford a landline.

* PROBLEM: The current system used by DRS does not take into account the needs of the administrators.  The software is written for hospital field workers, and does not supply many funtions that would be useful for a DRS employee - such as notifications when a client has had no workers visit them for an extended period of time, or may have moved without notifying the office.

* SOLUTION:  My project sends live alerts to the administrator if a client's case is associated with unusual behavior (clients with no check-ins from workers, or check-ins repeatedly coming from an area not associated with a client's known address).  These automations can be incredibly helpful to case managers, and assist them to better manage their caseloads which can include over 1,000 clients.

## Feature Set

* Database that logs clients, their address, their workers, worker ID #'s, history of worker check ins/outs, and contact information for clients and workers
* API that accepts SMS from worker and returns unique link for checking in - then returns time and location information of check ins/outs to database
* Administrator interface that displays client and worker information, and includes live notifications to alert administrator of unusual behavior

