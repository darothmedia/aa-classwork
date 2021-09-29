class User

    attr_accessor :id, :f_name, :l_name

    def self.all
        data = QuestionsDataBase.instance.execute('SELECT * FROM users')
        data.map { |datum| User.new(datum) }
    end

    def self.find_by_name(f_name, l_name)
        name_instance = QuestionsDataBase.instance.execute(<<-SQL, f_name, l_name)
            SELECT
                *
            FROM
                users
            WHERE
                f_name = ? AND
                l_name = ?
        SQL
        return nil if name_instance.length < 0
        User.new(name_instance)
    end

    def initialize(options)
        @id = options['id']
        @f_name = options['f_name']
        @l_name = options['l_name']
    end

    def create
        raise "User already in database" if self.id
        QuestionsDataBase.instance.execute(<<-SQL, @f_name, @l_name) 
            INSERT INTO
                users (f_name, l_name)
            VALUES
                (?, ?)
        SQL
    end

    def authored_questions
        Question.find_by_author_id(self.id)
    end

    def authored_replies
        Reply.find_by_user_id(self.id)
    end

    def followed_questions
        QuestionFollows.followed_questions_for_user_id(self.id)
    end
end