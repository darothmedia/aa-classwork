PRAGMA foreign_keys = ON;

CREATE TABLE users (

    id INTEGER PRIMARY KEY,
    f_name VARCHAR(255) NOT NULL,
    l_name VARCHAR(255) NOT NULL

);

CREATE TABLE questions (

    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    questioner INTEGER NOT NULL,

    FOREIGN KEY (questioner) REFERENCES users(id)
);


CREATE TABLE question_follows (

    id INTEGER PRIMARY KEY, 
    u_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (u_id) REFERENCES users(id),
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

INSERT INTO
    users (f_name, l_name)
VALUES
    ('Tyler', 'Harper'),
    ('Adrian', 'Rothschild');

INSERT INTO
    questions (title, body, questioner)
VALUES
    ('byebug', 'How do you install the gem byebug?', 1);

INSERT INTO
    question_follows (u_id, questions_id)
VALUES
    (2, 1);

INSERT INTO
    replies (subject_question, parent_reply, user, body)
VALUES
    (1, NULL, 2, 'Type bundle install!');

INSERT INTO
    question_likes (liker, question)
VALUES
    (2, 1);
