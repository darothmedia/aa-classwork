
CREATE TABLE users (

    id INTEGER PRIMARY KEY,
    f_name VARCHAR(255) NOT NULL,
    l_name VARCHAR(255) NOT NULL

);

CREATE TABLE questions (

    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE question_follows (

    id INTEGER PRIMARY KEY, 
    user_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)


);

CREATE TABLE replies (

    id INTEGER PRIMARY KEY,
    subject_question INTEGER NOT NULL,
    parent_reply INTEGER,
    user INTEGER NOT NULL,
    body TEXT NOT NULL, 

    FOREIGN KEY (user) REFERENCES users(id),
    FOREIGN KEY (subject_question) REFERENCES questions(id),
    FOREIGN KEY (parent_reply) REFERENCES replies(id)
    
);

CREATE TABLE question_likes (

    id INTEGER PRIMARY KEY,
    liker INTEGER NOT NULL,
    question INTEGER NOT NULL,

    FOREIGN KEY (liker) REFERENCES users(id),
    FOREIGN KEY (question) REFERENCES questions(id)

);