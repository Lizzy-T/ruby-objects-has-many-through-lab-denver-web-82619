class Patient
    attr_reader :name
    @@all = []

    def self.all
        @@all
    end

    def initialize name
        @name = name
        @@all << self
    end

    def appointments
        Appointment.all.select { |appointment| appointment.patient == self } 
    end

    def new_appointment doctor, date
        Appointment.new(date, self, doctor)
    end

    def doctors
        appointments.map { |appointment| appointment.doctor }
    end


end