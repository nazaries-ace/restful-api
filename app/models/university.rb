class University < ApplicationRecord
    has_and_belongs_to_many :careers
    has_many :school_years
    has_many :students, through: :school_years
end
