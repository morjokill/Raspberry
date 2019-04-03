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

INSERT INTO note (name, duration) VALUES ('B0', 31);
INSERT INTO note (name, duration) VALUES ('C1', 33);
INSERT INTO note (name, duration) VALUES ('CS1', 35);
INSERT INTO note (name, duration) VALUES ('D1', 37);
INSERT INTO note (name, duration) VALUES ('DS1', 39);
INSERT INTO note (name, duration) VALUES ('E1', 41);
INSERT INTO note (name, duration) VALUES ('F1', 44);
INSERT INTO note (name, duration) VALUES ('FS1', 46);
INSERT INTO note (name, duration) VALUES ('G1', 49);
INSERT INTO note (name, duration) VALUES ('GS1', 52);
INSERT INTO note (name, duration) VALUES ('A1', 55);
INSERT INTO note (name, duration) VALUES ('AS1', 58);
INSERT INTO note (name, duration) VALUES ('B1', 62);
INSERT INTO note (name, duration) VALUES ('C2', 65);
INSERT INTO note (name, duration) VALUES ('CS2', 69);
INSERT INTO note (name, duration) VALUES ('D2', 73);
INSERT INTO note (name, duration) VALUES ('DS2', 78);
INSERT INTO note (name, duration) VALUES ('E2', 82);
INSERT INTO note (name, duration) VALUES ('F2', 87);
INSERT INTO note (name, duration) VALUES ('FS2', 93);
INSERT INTO note (name, duration) VALUES ('G2', 98);
INSERT INTO note (name, duration) VALUES ('GS2', 104);
INSERT INTO note (name, duration) VALUES ('A2', 110);
INSERT INTO note (name, duration) VALUES ('AS2', 117);
INSERT INTO note (name, duration) VALUES ('B2', 123);
INSERT INTO note (name, duration) VALUES ('C3', 131);
INSERT INTO note (name, duration) VALUES ('CS3', 139);
INSERT INTO note (name, duration) VALUES ('D3', 147);
INSERT INTO note (name, duration) VALUES ('DS3', 156);
INSERT INTO note (name, duration) VALUES ('E3', 165);
INSERT INTO note (name, duration) VALUES ('F3', 175);
INSERT INTO note (name, duration) VALUES ('FS3', 185);
INSERT INTO note (name, duration) VALUES ('G3', 196);
INSERT INTO note (name, duration) VALUES ('GS3', 208);
INSERT INTO note (name, duration) VALUES ('A3', 220);
INSERT INTO note (name, duration) VALUES ('AS3', 233);
INSERT INTO note (name, duration) VALUES ('B3', 247);
INSERT INTO note (name, duration) VALUES ('C4', 262);
INSERT INTO note (name, duration) VALUES ('CS4', 277);
INSERT INTO note (name, duration) VALUES ('D4', 294);
INSERT INTO note (name, duration) VALUES ('DS4', 311);
INSERT INTO note (name, duration) VALUES ('E4', 330);
INSERT INTO note (name, duration) VALUES ('F4', 349);
INSERT INTO note (name, duration) VALUES ('FS4', 370);
INSERT INTO note (name, duration) VALUES ('G4', 392);
INSERT INTO note (name, duration) VALUES ('GS4', 415);
INSERT INTO note (name, duration) VALUES ('A4', 440);
INSERT INTO note (name, duration) VALUES ('AS4', 466);
INSERT INTO note (name, duration) VALUES ('B4', 494);
INSERT INTO note (name, duration) VALUES ('C5', 523);
INSERT INTO note (name, duration) VALUES ('CS5', 554);
INSERT INTO note (name, duration) VALUES ('D5', 587);
INSERT INTO note (name, duration) VALUES ('DS5', 622);
INSERT INTO note (name, duration) VALUES ('E5', 659);
INSERT INTO note (name, duration) VALUES ('F5', 698);
INSERT INTO note (name, duration) VALUES ('FS5', 740);
INSERT INTO note (name, duration) VALUES ('G5', 784);
INSERT INTO note (name, duration) VALUES ('GS5', 831);
INSERT INTO note (name, duration) VALUES ('A5', 880);
INSERT INTO note (name, duration) VALUES ('AS5', 932);
INSERT INTO note (name, duration) VALUES ('B5', 988);
INSERT INTO note (name, duration) VALUES ('C6', 1047);
INSERT INTO note (name, duration) VALUES ('CS6', 1109);
INSERT INTO note (name, duration) VALUES ('D6', 1175);
INSERT INTO note (name, duration) VALUES ('DS6', 1245);
INSERT INTO note (name, duration) VALUES ('E6', 1319);
INSERT INTO note (name, duration) VALUES ('F6', 1397);
INSERT INTO note (name, duration) VALUES ('FS6', 1480);
INSERT INTO note (name, duration) VALUES ('G6', 1568);
INSERT INTO note (name, duration) VALUES ('GS6', 1661);
INSERT INTO note (name, duration) VALUES ('A6', 1760);
INSERT INTO note (name, duration) VALUES ('AS6', 1865);
INSERT INTO note (name, duration) VALUES ('B6', 1976);
INSERT INTO note (name, duration) VALUES ('C7', 2093);
INSERT INTO note (name, duration) VALUES ('CS7', 2217);
INSERT INTO note (name, duration) VALUES ('D7', 2349);
INSERT INTO note (name, duration) VALUES ('DS7', 2489);
INSERT INTO note (name, duration) VALUES ('E7', 2637);
INSERT INTO note (name, duration) VALUES ('F7', 2794);
INSERT INTO note (name, duration) VALUES ('FS7', 2960);
INSERT INTO note (name, duration) VALUES ('G7', 3136);
INSERT INTO note (name, duration) VALUES ('GS7', 3322);
INSERT INTO note (name, duration) VALUES ('A7', 3520);
INSERT INTO note (name, duration) VALUES ('AS7', 3729);
INSERT INTO note (name, duration) VALUES ('B7', 3951);
INSERT INTO note (name, duration) VALUES ('C8', 4186);
INSERT INTO note (name, duration) VALUES ('CS8', 4435);
INSERT INTO note (name, duration) VALUES ('D8', 4699);
INSERT INTO note (name, duration) VALUES ('DS8', 4978);

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
INSERT INTO sound (note, delay, song_id) VALUES ('e', 200, 2);

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

INSERT INTO song (name) VALUES ('Mario theme');

INSERT INTO sound (note, delay, song_id) VALUES ('E7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('E7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('E7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('C7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('E7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('G7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('G6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);

INSERT INTO sound (note, delay, song_id) VALUES ('C7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('G6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('E6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('A6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('B6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('AS6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('A6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);

INSERT INTO sound (note, delay, song_id) VALUES ('G6', 400, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('E7', 400, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('G7', 400, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('A7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('F7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('G7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('E7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('C7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('D7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('B6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);

INSERT INTO sound (note, delay, song_id) VALUES ('C7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('G6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('E6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('A6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('B6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('AS6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('A6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);

INSERT INTO sound (note, delay, song_id) VALUES ('G6', 400, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('E7', 400, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('G7', 400, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('A7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('F7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('G7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('E7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('C7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('D7', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('B6', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);
INSERT INTO sound (note, delay, song_id) VALUES ('DELAY', 200, 3);

