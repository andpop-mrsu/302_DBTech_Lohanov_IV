INSERT OR IGNORE INTO users (name, email, gender, register_date, occupation_id)
VALUES
('Китаев Евгений Витальевич', 'kitaevvzhenya@gmail.com', 'male', date('now'),
 (SELECT id FROM occupations ORDER BY id LIMIT 1)),
('Копеин Александр Сергеевич', 'kopeyka@gmail.com', 'male', date('now'),
 (SELECT id FROM occupations ORDER BY id LIMIT 1)),
('Лоханов Иван Вячеславович', 'ivanlohanov2016@gmail.com', 'male', date('now'),
 (SELECT id FROM occupations ORDER BY id LIMIT 1)),
('Лукьянов Роман Александрович', 'lukyanov13@gmail.com', 'male', date('now'),
 (SELECT id FROM occupations ORDER BY id LIMIT 1)),
('Маркин Константин Романович', 'markins122@gmail.com', 'male', date('now'),
 (SELECT id FROM occupations ORDER BY id LIMIT 1));



INSERT OR IGNORE INTO movies (title, year)
VALUES
('Братья Систерс (2018)', 2018),
('Брюс Всемогущий (2003)', 2003),
('Мир юрского периода (2015)', 2015);


INSERT OR IGNORE INTO genres (name) VALUES ('Western');
INSERT OR IGNORE INTO genres (name) VALUES ('Fantasy');
INSERT OR IGNORE INTO genres (name) VALUES ('Adventure');

INSERT OR IGNORE INTO movie_genres (movie_id, genre_id)
SELECT m.id, g.id FROM movies m JOIN genres g ON g.name = 'Western'
WHERE m.title = 'Братья Систерс (2018)';

INSERT OR IGNORE INTO movie_genres (movie_id, genre_id)
SELECT m.id, g.id FROM movies m JOIN genres g ON g.name = 'Fantasy'
WHERE m.title = 'Брюс Всемогущий (2003)';

INSERT OR IGNORE INTO movie_genres (movie_id, genre_id)
SELECT m.id, g.id FROM movies m JOIN genres g ON g.name = 'Adventure'
WHERE m.title = 'Мир юрского периода (2015)';


INSERT INTO ratings (user_id, movie_id, rating, timestamp)
SELECT u.id, m.id, 4.9, strftime('%s','now')
FROM users u JOIN movies m ON m.title = 'Братья Систерс (2018)'
WHERE u.email = 'ivanlohanov2016@gmail.com'
AND NOT EXISTS (
    SELECT 1 FROM ratings r WHERE r.user_id = u.id AND r.movie_id = m.id
);

INSERT INTO ratings (user_id, movie_id, rating, timestamp)
SELECT u.id, m.id, 5.0, strftime('%s','now')
FROM users u JOIN movies m ON m.title = 'Мир юрского периода (2015)'
WHERE u.email = 'ivanlohanov2016@gmail.com'
AND NOT EXISTS (
    SELECT 1 FROM ratings r WHERE r.user_id = u.id AND r.movie_id = m.id
);

INSERT INTO ratings (user_id, movie_id, rating, timestamp)
SELECT u.id, m.id, 4.8, strftime('%s','now')
FROM users u JOIN movies m ON m.title = 'Брюс Всемогущий (2003)'
WHERE u.email = 'ivanlohanov2016@gmail.com'
AND NOT EXISTS (
    SELECT 1 FROM ratings r WHERE r.user_id = u.id AND r.movie_id = m.id
);