# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'katherinethegreat')
User.create(username: 'alexanderthegreat')
User.create(username: 'hadrian')

Poll.create(title: 'Ruthless Dictators', author_id: 1)
Poll.create(title: 'Best European Countries', author_id: 2)

Question.create(body: 'Who cut off the heads of his wives?', poll_id: 1)
Question.create(body: 'Which European country is mostly reclaimed land from the sea?', poll_id: 2)

AnswerChoice.create(body: 'Henry VIII', question_id: 1)
AnswerChoice.create(body: 'Charles II', question_id: 1)
AnswerChoice.create(body: 'Stalin', question_id: 1)
AnswerChoice.create(body: 'France', question_id: 2)
AnswerChoice.create(body: 'The Netherlands', question_id: 2)
AnswerChoice.create(body: 'Germany', question_id: 2)

Response.create(answer_choice_id: 1, user_id: 3)
Response.create(answer_choice_id: 4, user_id: 3)