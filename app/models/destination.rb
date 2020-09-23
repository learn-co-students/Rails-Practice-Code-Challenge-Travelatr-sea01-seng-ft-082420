class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts
    validates :name, presence: true
    validates :country, presence: true
end
