DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS persistent_logins;
DROP TABLE IF EXISTS group_authorities;
DROP TABLE IF EXISTS group_members;
DROP TABLE IF EXISTS `groups`;



CREATE TABLE users
(
    username VARCHAR(50) NOT NULL,
    password VARCHAR(60) NOT NULL,
    enabled  BIT(1)      NOT NULL DEFAULT 1,
    primary key (username)
);


CREATE TABLE authorities
(
    id        INT(11)     NOT NULL AUTO_INCREMENT,
    username  VARCHAR(50) NOT NULL,
    authority VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (username) REFERENCES users (username)
);

CREATE TABLE persistent_logins
(
    username  VARCHAR(50) NOT NULL,
    series    VARCHAR(64) NOT NULL,
    token     VARCHAR(64) NOT NULL,
    last_used TIMESTAMP   NOT NULL,
    PRIMARY KEY (series)
);

CREATE TABLE `groups`
(
    id         BIGINT      NOT NULL AUTO_INCREMENT,
    group_name VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE group_authorities
(
    group_id  BIGINT      NOT NULL,
    authority VARCHAR(50) NOT NULL,
    FOREIGN KEY (group_id) REFERENCES `groups` (id)
);

CREATE TABLE group_members
(
    id       BIGINT      NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    group_id BIGINT      NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES `groups` (id)
);
