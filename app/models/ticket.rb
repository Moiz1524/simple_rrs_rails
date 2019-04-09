class Ticket < ActiveRecord::Base
    belongs_to :travel
    belongs_to :user
end
