# require 'questions_database.rb'

class Question

    attr_accessor :id, :title, :body, :questioner  

    def self.all
        data = QuestionsDataBase.instance.execute('SELECT * FROM questions')
        data.map { |datum| Question.new(datum) }
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


end