DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT2,
  gender VARCHAR(255)
);

CREATE TABLE games(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  theme VARCHAR(255),
  renter INT2 REFERENCES customers(id)
);
