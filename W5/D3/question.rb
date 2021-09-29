# require 'questions_database.rb'

class Question

    attr_accessor :id, :title, :body, :questioner  

    def self.all
        data = QuestionsDataBase.instance.execute('SELECT * FROM questions')
        data.map { |datum| Question.new(datum) }
    end

    def self.most_followed(n = 1)
        QuestionFollows.most_followed_questions(n)
    end

    def self.most_liked(n = 1)
        QuestionLikes.most_liked_questions(n)
    end


    def self.find_by_author_id(id)
        id_instance = QuestionsDataBase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                questioner = ?
        SQL
        return nil if id_instance.length < 0
        Question.new(id_instance)
    end



    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @questioner = options['questioner']
    end

    def create
        QuestionsDataBase.instance.execute(<<-SQL, @title, @body, @questioner) 
            INSERT INTO
                questions (title, body, questioner)
            VALUES
                (?, ?, ?)
        SQL
    end

    def author
        self.questioner 
    end

    def replies
        Replies.find_by_question_id(self.id)
    end

    def followers
        QuestionFollows.followers_for_question_id(self.id)
    end

    def likers 
        QuestionLikes.likers_for_question_id(self.id)
    end

    def num_likes
        QuestionLikes.num_likes_for_question_id(self.id)
    end

    


end