INSERT INTO users(username, password, enabled)
VALUES ('user', 'user', 1);

INSERT INTO users(username, password, enabled)
VALUES ('admin', 'admin', 1);

INSERT INTO authorities(username, authority)
VALUES ('user', 'ROLE_USER');

INSERT INTO authorities(username, authority)
VALUES ('admin', 'ROLE_ADMIN');

INSERT INTO authorities(username, authority)
VALUES ('admin', 'ROLE_USER');
