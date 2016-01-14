For using the event api I created:

	- Users can create Event, Person, or Invitation objects
	- when user creates an event, must use a valid date in mm-dd-YYYY format, that is not a date from the past
	- If a user recieves an invitiation (an invite class is initialized with a person instance for an event), the api will check if the user is busy on that date.  
		- if the user is busy, the user will rsvp no to the event, and will not be added to the even guest list
		- else the user will rsvp yes, and will be added to the event guest list
		- to check all events a person has recieved invitations to access their invites variable or their events method
		- to check the events that person is attending access their attending instance variable
	- to bulk invite users to a given event, simply call send_invites for an event, with a list of people to invite
		- this method will create invitations to send to the people invited, and will appropriately accept/reject invitations given each individual's busy status
	- to check a user-readable list of attendees for a given event simply call the instance of the event with the guest list method, and an alphatized list of attendees will be returned (last name, first name)