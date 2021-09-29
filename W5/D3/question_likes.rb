
class QuestionLikes

    attr_accessor :id, :liker, :question 

    def self.all
        data = QuestionsDataBase.instance.execute('SELECT * FROM question_likes')
        data.map { |datum| QuestionLikes.new(datum) }
    end

    def self.find_by_name(liker, question)
        ql_instance = QuestionsDataBase.instance.execute(<<-SQL, liker, question)
            SELECT
                *
            FROM
                question_likes
            WHERE
                liker = ? 
                AND 
                question = ?
        SQL
        return nil if ql_instance.length < 0
        QuestionLikes.new(ql_instance)
    end

    self.likers_for_question_id(question_id)
        QuestionsDataBase.instance.execute(<<-SQL, question_id)
        SELECT
            liker
        FROM
            question_likes
        WHERE
            question = ?
        SQL
    end

    def self.likes_for_question_id(question_id)
        QuestionsDataBase.instance.execute(<<-SQL, question_id)
        SELECT
            COUNT(*)
        FROM
            question_likes
        WHERE
            question = ?
        SQL
    end

    def self.liked_questions_for_user_id(user_id)
        QuestionsDataBase.instance.execute(<<-SQL, user_id)
        SELECT
            question
        FROM
            question_likes
        WHERE
            liker = ?
        SQL
    end

    def self.most_liked_questions(n)
        QuestionsDataBase.instance.execute(<<-SQL, n)
        SELECT
            *
        FROM
            question_likes JOIN questions ON
            question_likes.question = questions.id
        GROUP BY
            questions.id
        LIMIT
            ?
        SQL
    end




    def initialize(options)
        @id = options['id']
        @liker = options['liker']
        @question = options['question']
    end

    def create
        raise "You already liked this question" if self.id
        QuestionsDataBase.instance.execute(<<-SQL, @liker, @question) 
            INSERT INTO
                question_likes (liker, question)
            VALUES
                (?, ?)
        SQL
    end

end