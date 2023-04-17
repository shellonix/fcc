--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (13, 'user_1681721776884', 1, 961);
INSERT INTO public.users VALUES (27, 'user_1681723098944', 1, 21);
INSERT INTO public.users VALUES (12, 'user_1681721776885', 4, 103);
INSERT INTO public.users VALUES (15, 'user_1681722460193', 1, 746);
INSERT INTO public.users VALUES (26, 'user_1681723098945', 4, 218);
INSERT INTO public.users VALUES (3, 'user_1681721027310', 1, 367);
INSERT INTO public.users VALUES (14, 'user_1681722460194', 4, 211);
INSERT INTO public.users VALUES (2, 'user_1681721027311', 4, 381);
INSERT INTO public.users VALUES (5, 'user_1681721095356', 1, 333);
INSERT INTO public.users VALUES (17, 'user_1681722589876', 1, 515);
INSERT INTO public.users VALUES (44, 'user_1681723826247', 2, 39);
INSERT INTO public.users VALUES (4, 'user_1681721095357', 4, 281);
INSERT INTO public.users VALUES (29, 'user_1681723189108', 1, 626);
INSERT INTO public.users VALUES (7, 'user_1681721122565', 1, 592);
INSERT INTO public.users VALUES (16, 'user_1681722589877', 4, 130);
INSERT INTO public.users VALUES (28, 'user_1681723189109', 4, 47);
INSERT INTO public.users VALUES (6, 'user_1681721122566', 4, 254);
INSERT INTO public.users VALUES (43, 'user_1681723826248', 5, 63);
INSERT INTO public.users VALUES (9, 'user_1681721158999', 1, 486);
INSERT INTO public.users VALUES (19, 'user_1681722763839', 1, 238);
INSERT INTO public.users VALUES (8, 'user_1681721159000', 4, 158);
INSERT INTO public.users VALUES (1, 'John', 7, 14);
INSERT INTO public.users VALUES (31, 'user_1681723238105', 1, 103);
INSERT INTO public.users VALUES (18, 'user_1681722763840', 4, 211);
INSERT INTO public.users VALUES (11, 'user_1681721727500', 1, 429);
INSERT INTO public.users VALUES (10, 'user_1681721727501', 4, 9);
INSERT INTO public.users VALUES (21, 'user_1681722910794', 1, 737);
INSERT INTO public.users VALUES (30, 'user_1681723238106', 4, 415);
INSERT INTO public.users VALUES (20, 'user_1681722910795', 4, 490);
INSERT INTO public.users VALUES (46, 'user_1681723847483', 2, 134);
INSERT INTO public.users VALUES (23, 'user_1681722924235', 1, 535);
INSERT INTO public.users VALUES (33, 'user_1681723275619', 1, 301);
INSERT INTO public.users VALUES (45, 'user_1681723847484', 5, 239);
INSERT INTO public.users VALUES (22, 'user_1681722924236', 4, 133);
INSERT INTO public.users VALUES (32, 'user_1681723275620', 4, 130);
INSERT INTO public.users VALUES (25, 'user_1681722939868', 1, 276);
INSERT INTO public.users VALUES (24, 'user_1681722939869', 4, 32);
INSERT INTO public.users VALUES (37, 'Johnny', 1, 13);
INSERT INTO public.users VALUES (39, 'user_1681723634878', 2, 546);
INSERT INTO public.users VALUES (38, 'user_1681723634879', 5, 107);
INSERT INTO public.users VALUES (40, 'Joh', 0, NULL);
INSERT INTO public.users VALUES (42, 'user_1681723795074', 2, 8);
INSERT INTO public.users VALUES (41, 'user_1681723795075', 5, 350);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 46, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

