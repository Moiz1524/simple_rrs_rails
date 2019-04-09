class City < ActiveRecord::Base
    has_many :routes_as_source, foreign_key: "source_id", class_name: "Route", dependent: :destroy
    has_many :routes_as_dest, foreign_key: "dest_id", class_name: "Route", dependent: :destroy
end
