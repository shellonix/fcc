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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    abbreviation character(3),
    area numeric,
    in_zodiac boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(15),
    description text,
    mass numeric,
    distance_from_earth numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    mass numeric,
    diameter numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    age_in_gyr integer,
    gravity numeric,
    radius numeric,
    moons integer,
    has_atmosphere boolean,
    has_rings boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    constellation_id integer,
    age_in_myr numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'And', 722, false);
INSERT INTO public.constellation VALUES (3, 'Aries', 'Ari', 441, true);
INSERT INTO public.constellation VALUES (4, 'Capricornus', 'Cap', 414, true);
INSERT INTO public.constellation VALUES (5, 'Cassiopeia', 'Cas', 598, false);
INSERT INTO public.constellation VALUES (6, 'Chamaeleon', 'Cha', 132, false);
INSERT INTO public.constellation VALUES (7, 'Cygnus', 'Cyg', 804, false);
INSERT INTO public.constellation VALUES (8, 'Gemini', 'Gem', 514, true);
INSERT INTO public.constellation VALUES (9, 'Hercueles', 'Her', 1225, false);
INSERT INTO public.constellation VALUES (10, 'Libra', 'Lib', 528, true);
INSERT INTO public.constellation VALUES (11, 'Orion', 'Ori', 594, false);
INSERT INTO public.constellation VALUES (12, 'Vela', 'Vel', 500, false);
INSERT INTO public.constellation VALUES (13, 'Lyra', 'Lyr', 286, true);
INSERT INTO public.constellation VALUES (2, 'Aquarius', 'Aqr', 980, true);
INSERT INTO public.constellation VALUES (15, 'Aquila', 'Aql', 652, false);
INSERT INTO public.constellation VALUES (16, 'Pegasus', 'Peg', 1121, false);
INSERT INTO public.constellation VALUES (17, 'Cetus', 'Cet', 1231, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'SA(s)b', 'A spiral galaxy located about 2.5 million light-years away.', 1500000000000, 2500000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'SA(s)cd', 'A spiral galaxy located about 3 million light-years away.', 50000000000, 2730000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'SA(s)bc pec', 'A spiral galaxy located about 23 million light-years away, with a distinctive spiral arm feature.', 160000000000, 31000000);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SB(rs)bc', 'Our own galaxy. A barred spiral galaxy with billions of stars.', 1150000000000, 0);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'SB(s)m', 'An irregular dwarf galaxy located about 160,000 light-years away.', 138000000000, 160000);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 'S pec', 'A ring galaxy located about 500 million light-years away.', 2400000000, 500000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 14, 73476000000000000000000, 3475);
INSERT INTO public.moon VALUES (2, 'Phobos', 15, 10700000000000000, 22.2);
INSERT INTO public.moon VALUES (3, 'Deimos', 15, 1500000000000000, 12.6);
INSERT INTO public.moon VALUES (4, 'Io', 16, 8931900, 3643.2);
INSERT INTO public.moon VALUES (5, 'Europa', 16, 4799800, 3121.6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 16, 14819000, 5268.2);
INSERT INTO public.moon VALUES (7, 'Callisto', 16, 10759000, 4820.6);
INSERT INTO public.moon VALUES (8, 'Himalia', 16, 420, 139.6);
INSERT INTO public.moon VALUES (9, 'Themisto', 16, 0.038, 9);
INSERT INTO public.moon VALUES (10, 'Amalthea', 16, 208, 167);
INSERT INTO public.moon VALUES (11, 'Titan', 17, 135000000000000000000000, 5149);
INSERT INTO public.moon VALUES (13, 'Ariel', 18, 125100, 1157.8);
INSERT INTO public.moon VALUES (14, 'Titania', 18, 340000, 1576.8);
INSERT INTO public.moon VALUES (15, 'Desdemona', 18, 9.3, 64);
INSERT INTO public.moon VALUES (16, 'Ophelia', 18, 43, 10.2);
INSERT INTO public.moon VALUES (17, 'Triton', 19, 2139000, 2705.2);
INSERT INTO public.moon VALUES (18, 'Larissa', 19, 380, 194);
INSERT INTO public.moon VALUES (19, 'Psamathe', 19, 2.9, 11);
INSERT INTO public.moon VALUES (20, 'Thalassa', 19, 35, 81.4);
INSERT INTO public.moon VALUES (12, 'Dione', 17, 1100000000000000000000, 1123);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (12, 'Mercury', 8, 5, 3.7, 2439.7, 0, false, false);
INSERT INTO public.planet VALUES (13, 'Venus', 8, 5, 8.87, 6051.8, 0, true, false);
INSERT INTO public.planet VALUES (14, 'Earth', 8, 5, 9.80665, 6361, 1, true, false);
INSERT INTO public.planet VALUES (15, 'Mars', 8, 5, 3.72076, 3389.5, 2, true, false);
INSERT INTO public.planet VALUES (16, 'Jupiter', 8, 5, 24.79, 6991.1, 80, true, true);
INSERT INTO public.planet VALUES (17, 'Saturn', 8, 5, 10.44, 58232, 84, true, true);
INSERT INTO public.planet VALUES (18, 'Uranus', 8, 5, 8.69, 25362, 27, true, true);
INSERT INTO public.planet VALUES (19, 'Neptune', 8, 5, 11.15, 24622, 14, true, true);
INSERT INTO public.planet VALUES (20, 'Kepler-186f', 9, 4, NULL, 10304, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (21, 'TRAPPIST-1e', 10, 8, 9.12, 5788, NULL, true, NULL);
INSERT INTO public.planet VALUES (22, 'Tau Ceti e', 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (23, 'HD 209458 b', 11, NULL, 9.4, 94379, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (24, '51 Pegasi b', 12, 6, 213, 7868, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Andromedae', 2, 1, 60);
INSERT INTO public.star VALUES (2, 'Vega', 1, 13, 455);
INSERT INTO public.star VALUES (3, 'Altair', 1, 15, 100);
INSERT INTO public.star VALUES (4, 'Deneb', 1, 7, 10);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 11, 8);
INSERT INTO public.star VALUES (6, 'Bellatrix', 1, 11, 25.2);
INSERT INTO public.star VALUES (7, 'Pollux', 1, 8, 724);
INSERT INTO public.star VALUES (8, 'Sun', 1, NULL, 4600);
INSERT INTO public.star VALUES (9, 'Kepler-186', 1, 7, 4000);
INSERT INTO public.star VALUES (10, 'Trappist-1', 1, 2, 7600);
INSERT INTO public.star VALUES (11, 'HD 209458', 1, 16, 3500);
INSERT INTO public.star VALUES (12, '51 Pegasi', 1, 16, 6100);
INSERT INTO public.star VALUES (13, 'Tau Ceti', 1, 17, 8000);


--
-- Name: constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_id_seq', 17, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 24, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 13, true);


--
-- Name: constellation constellation_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_abbreviation_key UNIQUE (abbreviation);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

