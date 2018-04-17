#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE pirogram;
EOSQL

psql -d pirogram -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email CHARACTER VARYING(256) NOT NULL UNIQUE,
    username CHARACTER VARYING(256) NOT NULL UNIQUE,
    password CHARACTER VARYING(64),
    name CHARACTER VARYING(256),
    avatar CHARACTER VARYING(1024),
    blurb CHARACTER VARYING(1024),
    active BOOLEAN,
    superuser BOOLEAN,
    is_deleted BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE password_reset_requests (
    id CHARACTER VARYING(64) PRIMARY KEY,
    user_id INTEGER,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE study_queue (
    user_id INTEGER NOT NULL,
    module_code CHARACTER VARYING(256) NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE,
    PRIMARY KEY (user_id, module_code)
);

CREATE TABLE code_playground_data (
    user_id integer NOT NULL,
    playground_id character varying(512) NOT NULL,
    code text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    PRIMARY KEY (user_id, playground_id)
);

CREATE TABLE exercise_history (
    user_id integer NOT NULL,
    exercise_id character varying(1024) NOT NULL,
    solution jsonb,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    PRIMARY KEY (user_id, exercise_id)
);

CREATE TABLE topic_history (
    user_id integer NOT NULL,
    topic_id CHARACTER VARYING(1024) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    PRIMARY KEY (user_id, topic_id)
);

CREATE TABLE package_history (
    user_id integer NOT NULL,
    package_id CHARACTER VARYING(1024) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    PRIMARY KEY (user_id, package_id)
);

EOSQL