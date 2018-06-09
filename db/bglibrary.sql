DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS rentals;

CREATE TABLE games(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  theme VARCHAR(255)
);

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT2,
  gender VARCHAR(255)
);

-- CREATE TABLE rentals(
--   id SERIAL PRIMARY KEY,
--   game_id REFERENCES games(id),
--   customer_id REFERENCES customers(id),
--   date_rented VARCHAR(255)
-- );
