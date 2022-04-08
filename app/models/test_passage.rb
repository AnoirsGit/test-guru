class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question, optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.question = next_question
    save
  end

  def completed?
    question.nil?
  end

  private 

  def before_validation_set_first_question
    self.question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.question = test.questions.order(:id).where('id > ?', self.question.id).first
  end

  def correct_answer?(answer_ids)
    count_correct_answer = correct_answers.count
    count_correct_answer == correct_answers.where(id: answer_ids).count && count_correct_answer == answer_ids.count
  end

  def correct_answers
    question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', self.question.id).first
  end

end
