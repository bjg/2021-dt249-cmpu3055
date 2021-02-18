--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 11.10 (Debian 11.10-0+deb10u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: users; Type: TABLE; Schema: public; Owner: cmpu3055
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    name text,
    email text,
    enabled boolean
);


ALTER TABLE public.users OWNER TO cmpu3055;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: cmpu3055
--

COPY public.users (id, name, email, enabled) FROM stdin;
6308cf22-68d3-487a-b5cd-13bc3ca30149    Brian   brian@example.com       t
\.


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: cmpu3055
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
