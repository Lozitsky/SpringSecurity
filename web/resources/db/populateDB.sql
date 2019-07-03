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

INSERT INTO `groups`(group_name)
VALUES ('admins');

INSERT INTO `groups`(group_name)
VALUES ('users');

INSERT INTO group_authorities(group_id, authority)
VALUES (1, 'ROLE_ADMIN');

INSERT INTO group_authorities(group_id, authority)
VALUES (1, 'ROLE_USER');

INSERT INTO group_authorities(group_id, authority)
VALUES (2, 'ROLE_USER');

INSERT INTO group_members(username, group_id)
VALUES ('user', 2);

INSERT INTO group_members(username, group_id)
VALUES ('admin', 1);

# https://www.bcryptgenerator.com/
# https://stackoverflow.com/a/52420168/9586230
UPDATE users
SET password = '$2a$12$gOeQpQ2fj7FRzlrp/.XQnO6cd3LQO65gqsqzJjDxAtC/zJiUI9u6u'
WHERE username = 'user';

UPDATE users
SET password = '$2a$12$S29k3A2Zims1rUqRe/ojT.cHukzgWvf/95WF2RFR93AxAvxAFNvcm'
WHERE username = 'admin';