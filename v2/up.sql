DROP DATABASE IF EXISTS mah;

CREATE DATABASE mah;

\c mah;

CREATE TABLE event (
    id serial PRIMARY KEY NOT NULL,
    payload jsonb NOT NULL,
    type character varying NOT NULL,
    created timestamp with time zone NOT NULL
);

CREATE TABLE event_applied (
    id serial PRIMARY KEY NOT NULL,
    event_id bigint NOT NULL REFERENCES event (id),
    created timestamp with time zone NOT NULL
);
