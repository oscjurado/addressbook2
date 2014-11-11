DROP TABLE IF EXISTS addressentry;
DROP TABLE IF EXISTS phonenumber;
DROP TABLE IF EXISTS email;


CREATE TABLE addressentry (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE phonenumber (
	id INTEGER PRIMARY KEY,
	category VARCHAR(255),
	digits VARCHAR(255)
);

CREATE TABLE email (
	id INTEGER PRIMARY KEY,
	category VARCHAR(255),
	address VARCHAR(255)
);