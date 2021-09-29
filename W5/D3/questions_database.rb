require 'sqlite'
require 'singleton'

class QuestionsDataBase < SQLite3::Database
    include Singleton 

    def initialize 
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true

    end
    

end

class User
    def self.all
        data = QuestionsDataBase.instance.execute('SELECT * FROM users')
        data.map { |datum| User.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @f_name = options['f_name']
        @l_name = options['l_name']
    end

    def create
        raise "User already in database" if self.id
        QuestionsDataBase.instance.execute(<<-- SQL, 
            self.f_name, self.l_name
            
        )
        SQL
    end

end

class Question

end