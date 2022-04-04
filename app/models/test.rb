class Test < ApplicationRecord
    has_many :questions
    has_many :tests_passages
    has_many :users, through: :test_passages
    belongs_to :category, optional: true

    validates :title,   presence: true,
                        uniqueness: true
    validates :level,   numericality: { only_integer: true }, allow_nil: true
    validate :validate_max_level

    scope :easy, -> { where(level: 0..1) }
    scope :medium, -> { where(level: 2..4) }
    scope :hard, -> { where(level: 5..10) }

    def validate_max_level
        errors.add(:level) if level.to_i > 10
    end
end
