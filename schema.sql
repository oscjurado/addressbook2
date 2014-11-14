DROP TABLE IF EXISTS addressentries;
DROP TABLE IF EXISTS phonenumbers;
DROP TABLE IF EXISTS emails;


CREATE TABLE addressentries (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE phonenumbers (
	id INTEGER PRIMARY KEY,
	category VARCHAR(255),
	digits VARCHAR(255)
);

CREATE TABLE emails (
	id INTEGER PRIMARY KEY,
	category VARCHAR(255),
	address VARCHAR(255)
);
