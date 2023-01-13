drop database if exists mah;
create database mah;

\c mah;

create table event (
        id SERIAL primary key NOT NULL,
        payload jsonb NOT NULL,
        created timestamp with time zone NOT NULL
);

create table event_last_applied(
    id SERIAL primary key NOT NULL,
    event_id bigint NOT NULL
    );
