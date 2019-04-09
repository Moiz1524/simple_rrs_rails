class Travel < ActiveRecord::Base
    belongs_to :train
    belongs_to :route
    has_many :tickets, dependent: :destroy 
    has_many :compartments, through: :train
end
