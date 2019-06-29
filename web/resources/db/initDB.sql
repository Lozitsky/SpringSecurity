DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS users;


CREATE TABLE users
(
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    enabled  BIT(1)      NOT NULL DEFAULT 1,
    primary key (username)
);

/*CREATE TABLE user_roles
(
    id INT(11) NOT NULL AUTO_INCREMENT,

);*/


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
    last_used TIMESTAMP NOT NULL,
    PRIMARY KEY (series)
);
