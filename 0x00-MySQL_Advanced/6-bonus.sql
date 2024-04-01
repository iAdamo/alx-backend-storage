-- DROP TABLE IF EXISTS corrections;
-- DROP TABLE IF EXISTS users;
-- DROP TABLE IF EXISTS projects;

-- CREATE TABLE IF NOT EXISTS users (
--     id int not null AUTO_INCREMENT,
--     name varchar(255) not null,
--     average_score float default 0,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS projects (
--     id int not null AUTO_INCREMENT,
--     name varchar(255) not null,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS corrections (
--     user_id int not null,
--     project_id int not null,
--     score int default 0,
--     KEY `user_id` (`user_id`),
--     KEY `project_id` (`project_id`),
--     CONSTRAINT fk_user_id FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
--     CONSTRAINT fk_project_id FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
-- );

-- INSERT INTO users (name) VALUES ("Bob");
-- SET @user_bob = LAST_INSERT_ID();

-- INSERT INTO users (name) VALUES ("Jeanne");
-- SET @user_jeanne = LAST_INSERT_ID();

-- INSERT INTO projects (name) VALUES ("C is fun");
-- SET @project_c = LAST_INSERT_ID();

-- INSERT INTO projects (name) VALUES ("Python is cool");
-- SET @project_py = LAST_INSERT_ID();

-- INSERT INTO corrections (user_id, project_id, score) VALUES (@user_bob, @project_c, 80);
-- INSERT INTO corrections (user_id, project_id, score) VALUES (@user_bob, @project_py, 96);

-- INSERT INTO corrections (user_id, project_id, score) VALUES (@user_jeanne, @project_c, 91);
-- INSERT INTO corrections (user_id, project_id, score) VALUES (@user_jeanne, @project_py, 73);

-- script that creates a stored procedure AddBonus that adds a new correction for a student.
DELIMITER $$
CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(255), IN score INT)
BEGIN
    DECLARE project_id INT;
    SELECT id INTO project_id FROM projects WHERE name = project_name;
    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (project_name);
        SELECT LAST_INSERT_ID() INTO project_id;
    END IF;
    INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
END$$
DELIMITER ;

-- SELECT * FROM projects;
-- SELECT * FROM corrections;

-- SELECT "--";

-- CALL AddBonus((SELECT id FROM users WHERE name = "Jeanne"), "Python is cool", 100);

-- CALL AddBonus((SELECT id FROM users WHERE name = "Jeanne"), "Bonus project", 100);
-- CALL AddBonus((SELECT id FROM users WHERE name = "Bob"), "Bonus project", 10);

-- CALL AddBonus((SELECT id FROM users WHERE name = "Jeanne"), "New bonus", 90);

-- SELECT "--";

-- SELECT * FROM projects;
-- SELECT * FROM corrections;