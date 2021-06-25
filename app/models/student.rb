class Student < ApplicationRecord
    has_many :school_years
    has_many :universities, through: :school_years
end
