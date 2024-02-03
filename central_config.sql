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
    login text NOT NULL,
    name text NOT NULL,
    email text,
    phone text,
    phone2 text,
    status text DEFAULT 'ACTIVE'::text,
    active_date timestamp with time zone,
    site_key bigint
);

-- COMMENT ON TABLE adminitration.user IS 'User details';
-- COMMENT ON COLUMN adminitration.user.user_key IS 'Primary Key';

CREATE TABLE administration.site (
    site_key bigint NOT NULL,
    name text NOT NULL,
    address text,
    city text,
    state text,
    country text DEFAULT 'BRASIL'::text,
    document text,
    phone text,
    email text,
    social_media text,
    logo bytea,
    license_alert int,
    creation_date timestamp with time zone,
    discount int,
    profile_key bigint
);

CREATE TABLE administration.profile (
    profile_key bigint NOT NULL,
    name text,
    price double precision DEFAULT 0,
    number_users int,
    profile_details text
);

CREATE TABLE administration.license (
    license_key bigint NOT NULL,
    license_number text,
    creation_date timestamp with time zone,
    expire_date timestamp with time zone,
    cost double precision DEFAULT 0,
    site_key bigint,
    profile_key bigint
);

CREATE TABLE administration.page (
    page_key bigint NOT NULL,
    name text,
    menu_name text,
    profile_key bigint
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

ALTER TABLE ONLY administration."site"
    ADD CONSTRAINT site_pkey PRIMARY KEY (site_key);

ALTER TABLE ONLY administration."profile"
    ADD CONSTRAINT profile_pkey PRIMARY KEY (profile_key);

ALTER TABLE ONLY administration."license"
    ADD CONSTRAINT license_pkey PRIMARY KEY (license_key);

ALTER TABLE ONLY administration."page"
    ADD CONSTRAINT page_pkey PRIMARY KEY (page_key);

-- Foreign KEYs
ALTER TABLE ONLY administration."user"
    ADD CONSTRAINT user_site_fkey FOREIGN KEY (site_key) REFERENCES site(site_key) DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE ONLY administration."site"
    ADD CONSTRAINT site_profile_fkey FOREIGN KEY (profile_key) REFERENCES profile(profile_key) DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE ONLY administration."page"
    ADD CONSTRAINT page_profile_fkey FOREIGN KEY (profile_key) REFERENCES profile(profile_key) DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE ONLY administration."license"
    ADD CONSTRAINT license_site_fkey FOREIGN KEY (site_key) REFERENCES site(site_key) DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE ONLY administration."license"
    ADD CONSTRAINT license_profile_fkey FOREIGN KEY (profile_key) REFERENCES profile(profile_key) DEFERRABLE INITIALLY IMMEDIATE;

CREATE INDEX user_user_key_idx ON administration.user USING btree (user_key);
CREATE INDEX site_site_key_idx ON administration.site USING btree (site_key);
CREATE INDEX profile_profile_key_idx ON administration.profile USING btree (profile_key);
CREATE INDEX license_license_key_idx ON administration.license USING btree (license_key);
CREATE INDEX page_page_key_idx ON administration.page USING btree (page_key);
CREATE INDEX audit_audit_key_idx ON administration.audit USING btree (audit_key);

CREATE SEQUENCE administration.user_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE administration.site_key_seq
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