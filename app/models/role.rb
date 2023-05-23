class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map { |audition| audition.actor }
    end

    def locations
        self.auditions.map { |audition| audition.location }
    end

    def hired_auditions
        self.auditions.where(hired: 1)
    end

    def lead
        if self.hired_auditions != nil
            self.hired_auditions.first
        else 
            "no actor has been hired for this role"
        end
    end

    def understudy 
        if self.hired_auditions != nil
            self.hired_auditions.second
        else
            "no actor has been hired for understudy for this role"
        end
    end

end