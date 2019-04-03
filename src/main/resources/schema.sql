DROP TABLE IF EXISTS sound;
DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS song;

CREATE TABLE song (
  id   SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE note (
  name     VARCHAR(10) PRIMARY KEY,
  duration INT
);

CREATE TABLE sound (
  id      SERIAL PRIMARY KEY,
  note    VARCHAR(10) REFERENCES note (name),
  delay   INT,
  song_id INT REFERENCES song (id)
);

INSERT INTO song (name) VALUES ('Imperial march');

INSERT INTO note (name, duration) VALUES ('cL', 129);
INSERT INTO note (name, duration) VALUES ('cLS', 139);
INSERT INTO note (name, duration) VALUES ('dL', 146);
INSERT INTO note (name, duration) VALUES ('dLS', 156);
INSERT INTO note (name, duration) VALUES ('eL', 163);
INSERT INTO note (name, duration) VALUES ('fL', 173);
INSERT INTO note (name, duration) VALUES ('fLS', 185);
INSERT INTO note (name, duration) VALUES ('gL', 194);
INSERT INTO note (name, duration) VALUES ('gLS', 207);
INSERT INTO note (name, duration) VALUES ('aL', 219);
INSERT INTO note (name, duration) VALUES ('aLS', 228);
INSERT INTO note (name, duration) VALUES ('bL', 232);

INSERT INTO note (name, duration) VALUES ('c', 261);
INSERT INTO note (name, duration) VALUES ('cS', 277);
INSERT INTO note (name, duration) VALUES ('d', 294);
INSERT INTO note (name, duration) VALUES ('dS', 311);
INSERT INTO note (name, duration) VALUES ('e', 329);
INSERT INTO note (name, duration) VALUES ('f', 349);
INSERT INTO note (name, duration) VALUES ('fS', 370);
INSERT INTO note (name, duration) VALUES ('g', 391);
INSERT INTO note (name, duration) VALUES ('gS', 415);
INSERT INTO note (name, duration) VALUES ('a', 440);
INSERT INTO note (name, duration) VALUES ('aS', 455);
INSERT INTO note (name, duration) VALUES ('b', 466);

INSERT INTO note (name, duration) VALUES ('cH', 523);
INSERT INTO note (name, duration) VALUES ('cHS', 554);
INSERT INTO note (name, duration) VALUES ('dH', 587);
INSERT INTO note (name, duration) VALUES ('dHS', 622);
INSERT INTO note (name, duration) VALUES ('eH', 659);
INSERT INTO note (name, duration) VALUES ('fH', 698);
INSERT INTO note (name, duration) VALUES ('fHS', 740);
INSERT INTO note (name, duration) VALUES ('gH', 784);
INSERT INTO note (name, duration) VALUES ('gHS', 830);
INSERT INTO note (name, duration) VALUES ('aH', 880);
INSERT INTO note (name, duration) VALUES ('aHS', 910);
INSERT INTO note (name, duration) VALUES ('bH', 933);

INSERT INTO note (name, duration) VALUES ('DELAY', 0);

INSERT INTO sound (note, delay, song_id) VALUES ('a', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('a', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('f', 350, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cH', 150, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('a', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('f', 350, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cH', 150, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('a', 1000, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('eH', 500, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('eH', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('eH', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('fH', 350, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cH', 150, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('gS', 500, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('f', 350, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cH', 150, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('a', 1000, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('aH', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('a', 350, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('a', 150, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('aH', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('gHS', 250, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('gH', 250, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('fHS', 125, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('fH', 125, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('fHS', 250, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 250, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('aS', 250, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('dHS', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('dH', 250, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cHS', 250, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cH', 125, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('b', 125, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cH', 250, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 250, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('f', 125, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('gS', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('f', 375, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('a', 125, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cH', 500, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('a', 375, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cH', 125, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('eH', 1000, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('aH', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('a', 350, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('a', 150, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('aH', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('gHS', 250, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('gH', 250, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('fHS', 125, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('fH', 125, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('fHS', 250, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 250, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('aS', 250, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('dHS', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('dH', 250, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cHS', 250, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cH', 125, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('b', 125, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cH', 250, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 250, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('f', 250, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('gS', 500, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('f', 375, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('cH', 125, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('a', 500, 1);

INSERT INTO sound (note, delay, song_id) VALUES ('f', 375, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('c', 125, 1);
INSERT INTO sound (note, delay, song_id) VALUES ('a', 1000, 1);

INSERT INTO song (name) VALUES ('Jingle Bells');

INSERT INTO sound (note, delay, song_id) VALUES ('e', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('e', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('e', 400, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('e', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('e', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('e', 400, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('e', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('a', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('g', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('c', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('d', 400, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('e', 1000, 2);

INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 2);

INSERT INTO sound (note, delay, song_id) VALUES ('f', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('f', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('f', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('f', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('f', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('f', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('e', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('e', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('e', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('e', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('d', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('d', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('e', 200, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('d', 400, 2);
INSERT INTO sound (note, delay, song_id) VALUES ('g', 400, 2);

