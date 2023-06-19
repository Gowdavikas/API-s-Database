class School < ApplicationRecord
    has_many :branch
    has_many :students, through: :branch
end
