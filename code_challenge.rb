class Event
    attr_accessor :attendees, :name, :date 

    def initialize(name, date)
        @name = name
        @date = verify_date(date)
    end

    def add_attendee person
        @attendees ||= []
        @attendees << person
        @attendees
    end

    # allows for bulk inviting of people to a given event
    def send_invites people
        for person in people
            invitation = Invite.new(person, self)
            invitation.update_attendees
        end
    end

    # returns readable list of attendees (last name, first name) sorted alphabetically
    def guest_list
        guest_list = []
        for person in attendees
            full_name = person.last_name + ", " + person.first_name
            guest_list << full_name
        end
        guest_list.sort_by{|guest| guest.downcase}
    end

    def verify_date date_str
        require 'date'
        m, d, y = date_str.split '-'
        valid = Date.valid_date?(y.to_i, m.to_i, d.to_i)
        date_obj = Date.strptime(date_str, '%m-%d-%Y')
        if valid and date_obj >= Date.today
            return date_str
        else
            raise 'Enter date as valid "mm-dd--YYYY" that is not in the past'
        end
    end
end

class Person
    attr_accessor :busy, :first_name, :last_name

    def initialize(fname, lname)
        @first_name = fname
        @last_name = lname
    end

    # checks if person is busy during date specified, else attends event
    def attend_event event
        @busy ||= []
        if @busy.include? event.date
            return false
        else
            @busy << event.date
            return true
        end
    end

end

class Invite
    attr_accessor :accepted, :person, :event

    def initialize(person, event)
        @person = person
        @event = event
    end

    def rsvp
        if @person.attend_event(@event)
            @accepted = true
        else
            @accepted = false
        end
    end

    # if person 'rsvps' yes to invite, adds person to attendee list
    def update_attendees
        rsvp
        if @accepted
            @event.add_attendee(@person)
        end
    end

end

