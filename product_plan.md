# Capstone Product Plan

## Product Plan Components
1. __Problem Statement__: A clear, concise statement describing the problem your project will solve. Re-use the problem statement from the conceptual delivery or re-write for
2. __Market Research__: Outline the key insights from your research, including:
  - COMPETITION 
    - competing apps
      - existing system that using landline based calling system (electronic voice verification features are not used) 
      - http://www.sandata.com/our-platform/santrax-electronic-visit-verification
      - http://www.dhs.state.il.us/page.aspx?item=66961
      - GPS tracking apps marketed to companies with field workers
        - http://www.clicksoftware.com/small-medium-business-streetsmart 
    - non-app solutions
      - paper timesheet signed by both client and worker.  Still required in Illinois for some reason.  Workers and Clients must submit          these in addition to using automated system. 
    - research from users on why these alternatives do not effectively address the problem.
      -  
    - differentiation: what makes your idea/product different
3. __User Personas__: A summary of your main target user group(s). What are their key characteristics? How do those characteristics factor into project/app/idea?
  - WORKER
  - CLIENT
  - ADMIN(DISTRICT)
4. __Trello Board__:
  - https://trello.com/b/mXAhNW8P/provider-tracker
5. __Technology selections__:
   - Draft Feature Set

      * Database that logs clients, their address, their providers, provider ID #'s, history of provider check ins/outs, and contact         information for clients and providers
      * API that accepts SMS from provider and returns unique link for checking in - then returns time and location information of           check ins/outs to database
      * Administrator interface that displays client and provider information, and alerts administrator of unusual behavior

   - Draft Technology Choices
      * SMS messaging API (Twilio)
      * Live Events (notifications, live updates)
      * Python
      * Heroku
