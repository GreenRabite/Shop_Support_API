CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  emailAddress VARCHAR(255) NOT NULL,
);

CREATE TABLE license_keys (
  id INTEGER PRIMARY KEY,
  license_key VARCHAR(255) NOT NULL,
  userId INTEGER,

  FOREIGN KEY(userId) REFERENCES users(id)
);

CREATE TABLE orders (
  id INTEGER PRIMARY KEY,
  userID_customer INTEGER,
  userID_shop INTEGER,

  FOREIGN KEY(userID_customer) REFERENCES users(id)
  FOREIGN KEY(userID_shop) REFERENCES users(id)
);

--
-- INSERT INTO
--   houses (id, address)
-- VALUES
--   (1, "26th and Guerrero"), (2, "Dolores and Market");
--
-- INSERT INTO
--   humans (id, fname, lname, house_id)
-- VALUES
--   (1, "Devon", "Watts", 1),
--   (2, "Matt", "Rubens", 1),
--   (3, "Ned", "Ruggeri", 2),
--   (4, "Catless", "Human", NULL);
--
-- INSERT INTO
--   cats (id, name, owner_id)
-- VALUES
--   (1, "Breakfast", 1),
--   (2, "Earl", 2),
--   (3, "Haskell", 3),
--   (4, "Markov", 3),
--   (5, "Stray Cat", NULL);
