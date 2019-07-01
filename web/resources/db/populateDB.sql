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

