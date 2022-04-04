# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)``
categories = Category.create!([
    { title: 'RUBY' },
    { title: 'HTML' }
    ])
  users = User.create!([
    { email: 'client1@mail.com' },
    { email: 'client2@mail.com' }
    ])
  tests = Test.create!([
    { level: 1, title: 'RUBY-TEST', category_id: categories.first.id },
    { level: 2, title: 'HTML-TEST1s', category_id: categories.last.id }
    ])
  questions = Question.create!([
    { body: 'Вопрос 1', test_id: Test.first.id },
    { body: 'Вопрос 2', test_id: Test.last.id }
    ])
  answers = Answer.create!([
    { body: 'Ответ1', correct: true, question_id: questions.first.id },
    { body: 'НЕ Ответ1', correct: false, question_id: questions.first.id },
    { body: 'НЕ Ответ2', correct: false, question_id: questions.first.id },
    { body: 'НЕ Ответ3', correct: false, question_id: questions.last.id },
    { body: 'Ответ2', correct: true, question_id: questions.last.id },
    { body: 'НЕ Ответ4', correct: false, question_id: questions.last.id }
    ])