-- Initial
DROP TABLE IF EXISTS corrections;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS projects;

CREATE TABLE IF NOT EXISTS users (
       id int not null AUTO_INCREMENT,
       name varchar(255) not null,
       average_score float default 0,
       PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS projects (
       id int not null AUTO_INCREMENT,
       name varchar(255) not null,
       weight int default 1,
       PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS corrections (
       user_id int not null,
       project_id int not null,
       score float default 0,
       KEY `user_id` (`user_id`),
       KEY `project_id` (`project_id`),
       CONSTRAINT fk_user_id FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
       CONSTRAINT fk_project_id FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
);

INSERT INTO users (name) VALUES ("Bob");
SET @user_bob = LAST_INSERT_ID();

INSERT INTO users (name) VALUES ("Jeanne");
SET @user_jeanne = LAST_INSERT_ID();
