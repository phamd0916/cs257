'''

olympics-schema.sql
Doug Pham
October 13, 2022

Creates out tables that we made new csvs for

'''

CREATE TABLE athletes (
    id INTEGER,
    name TEXT
);

CREATE TABLE events (
    id INTEGER,
    sport TEXT,
    event TEXT
);

CREATE TABLE settings (
    id INTEGER,
    games TEXT,
    city TEXT,
    year INTEGER
);

CREATE TABLE results (
    id INTEGER,
    medal TEXT
);

CREATE TABLE countries (
    id INTEGER,
    team TEXT,
    noc TEXT
);

CREATE TABLE genders (
    id INTEGER,
    sex TEXT
);

CREATE TABLE ages (
    id INTEGER,
    years TEXT
);

CREATE TABLE heights (
    id INTEGER,
    units TEXT
);

CREATE TABLE weights (
    id INTEGER,
    kgs TEXT
);

CREATE TABLE athletes_countries (
    id INTEGER,
    name TEXT,
    country TEXT,
    event TEXT,
    year INTEGER,
    medal TEXT
);

CREATE TABLE nocs_medals (
    id INTEGER,
    noc TEXT,
    medals TEXT
);