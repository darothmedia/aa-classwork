class QuestionFollows

    attr_accessor :id, :u_id, :questions_id 

    def self.all
        data = QuestionsDataBase.instance.execute('SELECT * FROM question_follows')
        data.map { |datum| QuestionFollows.new(datum) }
    end

    def self.find_by_name(u_id, questions_id)
        qf_instance = QuestionsDataBase.instance.execute(<<-SQL, u_id, questions_id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                u_id = ? 
                AND 
                questions_id = ?
        SQL
        return nil if qf_instance.length < 0
        QuestionFollows.new(qf_instance)
    end

    def initialize(options)
        @id = options['id']
        @u_id = options['u_id']
        @question_id = options['question_id']
    end

    def create
        raise "You already followed this question" if self.id
        QuestionsDataBase.instance.execute(<<-SQL, @u_id, @question_id) 
            INSERT INTO
                question_follows (u_id, question_id)
            VALUES
                (?, ?)
        SQL
    end
end