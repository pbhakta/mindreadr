CREATE TABLE users (
	user_id INTEGER PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT UNIQUE NOT NULL
);

CREATE TABLE friends (
	friend1_id INTEGER REFERENCES users(user_id),
	friend2_id INTEGER REFERENCES users(user_id)
);

CREATE TABLE games (
	game_id INTEGER PRIMARY KEY,
	user1_id INTEGER REFERENCES users(user_id),
	user2_id INTEGER REFERENCES users(user_id),
	topic_id INTEGER REFERENCES topics(topic_id),
	turn INTEGER DEFAULT 0,
	score1 INTEGER DEFAULT 0,
	score2 INTEGER DEFAULT 0,
	answers INTEGER REFERENCES game_answers(id),
	clues INTEGER REFERENCES game_clues(id),
	difficulty INTEGER,
	UNIQUE(user1_id, user2_id)
);

CREATE TABLE game_answers (
	id INTEGER PRIMARY KEY,
	game_id INTEGER UNIQUE NOT NULL REFERENCES games(game_id),
	answer1_id INTEGER REFERENCES answers(answer_id),
	answer2_id INTEGER REFERENCES answers(answer_id),
	answer3_id INTEGER REFERENCES answers(answer_id),
	answer4_id INTEGER REFERENCES answers(answer_id),
	answer5_id INTEGER REFERENCES answers(answer_id),
	answer6_id INTEGER REFERENCES answers(answer_id),
	answer7_id INTEGER REFERENCES answers(answer_id),
	answer8_id INTEGER REFERENCES answers(answer_id),
	answer9_id INTEGER REFERENCES answers(answer_id),
	answer10_id INTEGER REFERENCES answers(answer_id)
);

CREATE TABLE game_clues (
	id INTEGER PRIMARY KEY,
	game_id INTEGER UNIQUE NOT NULL REFERENCES games(game_id),
	clue1_id INTEGER REFERENCES clues(clue_id),
	clue2_id INTEGER REFERENCES clues(clue_id),
	clue3_id INTEGER REFERENCES clues(clue_id),
	clue4_id INTEGER REFERENCES clues(clue_id),
	clue5_id INTEGER REFERENCES clues(clue_id),
	clue6_id INTEGER REFERENCES clues(clue_id),
	clue7_id INTEGER REFERENCES clues(clue_id),
	clue8_id INTEGER REFERENCES clues(clue_id),
	clue9_id INTEGER REFERENCES clues(clue_id),
	clue10_id INTEGER REFERENCES clues(clue_id)
);

CREATE TABLE states (
	game_id INTEGER REFERENCES games(game_id) NOT NULL,
	user_id INTEGER REFERENCES users(user_id) NOT NULL,
	state INTEGER DEFAULT 0,
	UNIQUE(game_id, user_id)
);

CREATE TABLE topics (
	topic_id INTEGER PRIMARY KEY,
	topic TEXT UNIQUE NOT NULL
);

CREATE TABLE answers (
	answer_id INTEGER PRIMARY KEY,
	answer TEXT NOT NULL,
	answer_type TEXT NOT NULL,
	topic_id INTEGER REFERENCES topics(topic_id),
	easy_id INTEGER REFERENCES answers_ext(id),
	medium_id INTEGER REFERENCES answers_ext(id),
	hard_id INTEGER REFERENCES answers_ext(id),
	learn_more TEXT NOT NULL
);

CREATE TABLE clues (
	clue_id INTEGER PRIMARY KEY,
	clue TEXT NOT NULL,
	game_id INTEGER REFERENCES games(game_id),
	giver_id INTEGER REFERENCES users(user_id),
	receiver_id INTEGER REFERENCES users(user_id),
	answer_id INTEGER REFERENCES answers(answer_id),
	points INTEGER NOT NULL
);

CREATE TABLE guesses (
	guess_id INTEGER PRIMARY KEY,
	game_id INTEGER REFERENCES games(game_id) NOT NULL,
	user_id INTEGER REFERENCES users(user_id) NOT NULL,
	answer_id INTEGER REFERENCES answers(answer_id) NOT NULL,
	clue_id INTEGER REFERENCES clues(clue_id) NOT NULL,
	guess TEXT NOT NULL
);

CREATE TABLE answers_ext (
	id INTEGER PRIMARY KEY,
	media TEXT NOT NULL,
	type TEXT NOT NULL
);