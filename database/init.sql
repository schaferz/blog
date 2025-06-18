CREATE TABLE setting
(
    id              SERIAL PRIMARY KEY,
    email           VARCHAR(100) NOT NULL UNIQUE,
    display_name    VARCHAR(100),
    theme           VARCHAR(50),
    accessible_mode BOOLEAN DEFAULT FALSE
);
