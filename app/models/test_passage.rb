class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question, optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  private 

  def before_validation_set_first_question
    self.question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.question = test.questions.order(:id).where('id > ?', self.question.id).first
  end

end
