--DROP SCHEMA IF EXISTS administration CASCADE;

SET statement_timeout = 0;
SET client_encoding = 'UTF-8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;

CREATE SCHEMA IF NOT EXISTS administration AUTHORIZATION postgres;

SET search_path = "user", administration, public;
ALTER DATABASE central_config SET search_path TO "user", administration, public;

CREATE TABLE administration.user (
    user_key bigint NOT NULL,
    username text NOT NULL,
    name text NOT NULL,
    email text,
    phone text,
    phone2 text,
    status text DEFAULT 'ACTIVE'::text,
    type text,
    creation_date timestamp with time zone,
    parent_user_key bigint
);

-- COMMENT ON TABLE adminitration.user IS 'User details';
-- COMMENT ON COLUMN adminitration.user.user_key IS 'Primary Key';

CREATE TABLE administration.user_details (
    user_details_key bigint NOT NULL,
    address text,
    city text,
    state text,
    country text,
    timezone text,
    document text,
    social_media text,
    logo bytea,
    user_key bigint NOT NULL
);

CREATE TABLE secret_manager (
    secret_manager_key bigint NOT NULL,
    salt text,
    passhash text,
    active boolean,
    expire_date timestamp with time zone,
    user_key bigint NOT NULL
);

CREATE TABLE administration.profile (
    profile_key bigint NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    enable boolean DEFAULT FALSE,
    price double precision,
    user_key bigint NOT NULL
);

CREATE TABLE administration.license (
    license_key bigint NOT NULL,
    license_number text NOT NULL,
    aquisition_date timestamp with time zone,
    expire_date timestamp with time zone,
    price double precision,
    user_key bigint NOT NULL,
    profile_key bigint NOT NULL
);

CREATE TABLE administration.page (
    page_key bigint NOT NULL,
    name text NOT NULL,
    menu_name text NOT NULL,
    profile_key bigint NOT NULL
);

CREATE TABLE administration.audit (
    audit_key bigint NOT NULL,
    ts timestamp with time zone,
    action text,
    tablename text,
    pkey bigint,
    fieldname text,
    value text
);

-- Primary KEYs
ALTER TABLE ONLY administration."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_key);

ALTER TABLE ONLY administration."user_details"
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (user_details_key);

ALTER TABLE ONLY administration."secret_manager"
    ADD CONSTRAINT secret_manager_pkey PRIMARY KEY (secret_manager_key);

ALTER TABLE ONLY administration."profile"
    ADD CONSTRAINT profile_pkey PRIMARY KEY (profile_key);

ALTER TABLE ONLY administration."license"
    ADD CONSTRAINT license_pkey PRIMARY KEY (license_key);

ALTER TABLE ONLY administration."page"
    ADD CONSTRAINT page_pkey PRIMARY KEY (page_key);

-- Foreign KEYs
ALTER TABLE ONLY administration."user_details"
    ADD CONSTRAINT user_details_user_fkey FOREIGN KEY (user_key) REFERENCES administration.user(user_key) DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE ONLY administration."secret_manager"
    ADD CONSTRAINT secret_manager_user_fkey FOREIGN KEY (user_key) REFERENCES administration.user(user_key) DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE ONLY administration."license"
    ADD CONSTRAINT license_user_fkey FOREIGN KEY (user_key) REFERENCES administration.user(user_key) DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE ONLY administration."license"
    ADD CONSTRAINT license_profile_fkey FOREIGN KEY (profile_key) REFERENCES administration.profile(profile_key) DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE ONLY administration."page"
    ADD CONSTRAINT page_profile_fkey FOREIGN KEY (profile_key) REFERENCES administration.profile(profile_key) DEFERRABLE INITIALLY IMMEDIATE;

CREATE INDEX user_user_key_idx ON administration.user USING btree (user_key);
CREATE INDEX user_details_user_details_key_idx ON administration.user_details USING btree (user_details_key);
CREATE INDEX secret_manager_secret_manager_key_idx ON administration.secret_manager USING btree (secret_manager_key);
CREATE INDEX license_license_key_idx ON administration.license USING btree (license_key);
CREATE INDEX profile_profile_key_idx ON administration.profile USING btree (user_key);
CREATE INDEX page_page_key_idx ON administration.page USING btree (page_key);
CREATE INDEX audit_audit_key_idx ON administration.audit USING btree (audit_key);

CREATE SEQUENCE administration.user_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE administration.user_details_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE administration.secret_manager_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE administration.profile_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE administration.license_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE administration.page_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE administration.audit_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--timezone text DEFAULT 'America/Sao_Paulo Brazil/East'::text,