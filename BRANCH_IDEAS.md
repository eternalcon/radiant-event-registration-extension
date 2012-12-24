Ideas for this branch:


grab prices dynamically from the database.

First off, get the event prices from the database and select the correct price to display depending on the time period:
early bird, normal, late registration

Also, the current code will be unified (eg. using RESTful link_to statements everywhere).


Things to think about:

* Freeform Authors and Game Masters are always Participants.
    * store them in Database as such.
* Some of the info stored in the registrations table could possibly be personal preferences for Participants.
    * Maybe create a preferences table for participants, store info like room choice there and make this info available for registrations

