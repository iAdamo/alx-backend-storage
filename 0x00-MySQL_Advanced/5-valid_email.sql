-- Initial
-- DROP TABLE IF EXISTS users;

-- CREATE TABLE IF NOT EXISTS users (
--     id int not null AUTO_INCREMENT,
--     email varchar(255) not null,
--     name varchar(255),
--     valid_email boolean not null default 0,
--     PRIMARY KEY (id)
-- );
-- INSERT INTO users (email, name) VALUES ("bob@dylan.com", "Bob");
-- INSERT INTO users (email, name, valid_email) VALUES ("sylvie@dylan.com", "Sylvie", 1);
-- INSERT INTO users (email, name, valid_email) VALUES ("jeanne@dylan.com", "Jeanne", 1);

-- script that creates a trigger that resets the attribute valid_email only when the email has been changed.
DELIMITER $$
CREATE TRIGGER reset_valid_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email != NEW.email THEN
        SET NEW.valid_email = 0;
    END IF;
END$$
DELIMITER ;

-- -- Show users and update (or not) email
-- SELECT * FROM users;

-- UPDATE users SET valid_email = 1 WHERE email = "bob@dylan.com";
-- UPDATE users SET email = "sylvie+new@dylan.com" WHERE email = "sylvie@dylan.com";
-- UPDATE users SET name = "Jannis" WHERE email = "jeanne@dylan.com";

-- SELECT "--";
-- SELECT * FROM users;

-- UPDATE users SET email = "bob@dylan.com" WHERE email = "bob@dylan.com";

-- SELECT "--";
-- SELECT * FROM users;
