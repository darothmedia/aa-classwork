
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