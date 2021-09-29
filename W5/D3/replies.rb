class Replies

    attr_accessor :id, :subject_question, :parent_reply, :user, :body

    def self.all
        data = QuestionsDataBase.instance.execute('SELECT * FROM replies')
        data.map { |datum| Replies.new(datum) }
    end

    def self.find_by_id(id)
        reply_instance = QuestionsDataBase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        return nil if reply_instance.length < 0
        Replies.new(reply_instance)
    end

    def initialize(options)
        @id = options['id']
        @subject_question = options['subject_question']
        @parent_reply = options['parent_reply']
        @user = options['user']
        @body = options['body']
    end

    def create
        QuestionsDataBase.instance.execute(<<-SQL, @subject_question, @parent_reply, @user, @body) 
            INSERT INTO
                replies (subject_question, parent_reply, user, body)
            VALUES
                (?, ?, ?, ?)
        SQL
    end
end