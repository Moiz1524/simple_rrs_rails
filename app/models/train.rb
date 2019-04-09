class Train < ActiveRecord::Base
    has_and_belongs_to_many :compartments
    has_many :travels, dependent: :destroy
    mount_uploader :avatar, AvatarUploader
end
