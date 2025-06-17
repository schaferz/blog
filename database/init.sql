CREATE TABLE setting
(
    id              SERIAL PRIMARY KEY,
    email           VARCHAR(100) NOT NULL UNIQUE,
    display_name    VARCHAR(100) NOT NULL,
    theme           VARCHAR(50)  NOT NULL,
    accessible_mode BOOLEAN      NOT NULL DEFAULT FALSE
);
