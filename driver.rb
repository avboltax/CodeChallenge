require './code_challenge.rb'

# creating some events
party = Event.new('Birthday Party', '01-31-2016')
meeting = Event.new('Meeting', '01-31-2016')
dinner = Event.new('Dinner Date', '01-28-2016')

# creating some people
mandy = Person.new('Mandy', 'Boltax')
john = Person.new('John', 'Smith')
alex = Person.new('Alex', 'Song')

# alex and mandy have a meeting
meeting.send_invites([alex, mandy])

# we see they're both busy 1-31-2016
mandy.busy
alex.busy

# john invites them to a party
party.send_invites([mandy, alex, john])

# only john can attend
party.guest_list

# mandy and alex already have a meeting
meeting.guest_list

# mandy plans a dinner
dinner_invitiation = Invite.new(mandy, dinner)
dinner.guest_list

# if john isn't busy, he'll attend
if !john.busy.include? dinner.date
	dinner_invitiation = Invite.new(john, dinner)
end

# mandy and john are guests of the dinner event
dinner.guest_list

# mandy was invited to all three events
mandy.events.size
# she attended two
mandy.attending.size

# alex was invited to two events
alex.events.size
# he attended one
alex.attending.size