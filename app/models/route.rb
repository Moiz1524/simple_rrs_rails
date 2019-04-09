class Route < ActiveRecord::Base
    belongs_to :source, class_name: "City"
    belongs_to :dest, class_name: "City"
    has_many :travels, dependent: :destroy
    
    def route_name
       "#{source.name}_to_#{dest.name}" 
    end
end
