CREATE TABLE setting
(
    id              SERIAL PRIMARY KEY,
    email           VARCHAR(100) NOT NULL UNIQUE,
    display_name    VARCHAR(100),
    theme           VARCHAR(50),
    accessible_mode BOOLEAN DEFAULT FALSE
);

CREATE TABLE blog_user
(
    id           SERIAL PRIMARY KEY,
    username     VARCHAR(100) NOT NULL UNIQUE,
    display_name VARCHAR(100),
    email        VARCHAR(100),
    active       BOOLEAN DEFAULT TRUE,
    bio          TEXT,
    created_on   TIMESTAMP
);
