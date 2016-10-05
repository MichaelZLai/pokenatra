DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS trainers;

create table pokemons (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  poke_type VARCHAR,
  cp INTEGER,
  img_url VARCHAR,
  trainer_id INTEGER
);

create table trainers (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  level INTEGER,
  img_url VARCHAR
);
