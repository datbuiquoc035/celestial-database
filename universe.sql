--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric(20,1),
    type text,
    event_horizon_diameter numeric(10,1),
    discovered_by text,
    year_discovered integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(40) NOT NULL,
    type character varying(20),
    distance_light_years integer,
    diameter_light_years integer,
    number_of_stars character varying(30),
    galaxy_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    orbital_period numeric(4,1),
    mass numeric(10,1),
    radius numeric(10,1),
    surface_composition text
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
    star_id integer NOT NULL,
    type text,
    orbital_period numeric(10,1),
    mass numeric(10,1),
    radius numeric(10,1),
    atmosphere text,
    name character varying(40) NOT NULL,
    has_life boolean,
    has_ring boolean
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
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    type text,
    mass numeric(10,1),
    radius numeric(10,1),
    temperature integer,
    luminosity integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 1, 4300000.0, 'Supermassive', 44000000.0, 'Bruce Balick & Robert Brown', 1974);
INSERT INTO public.black_hole VALUES (2, 'M87*', 5, 6500000000.0, 'Supermassive', 120000000.0, 'Event Horizon Telescope', 2019);
INSERT INTO public.black_hole VALUES (3, 'Cygnus X-1', 1, 14.8, 'Stellar', 60.0, 'Charles T. Bolton', 1971);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'Spiral', 0, 100000, '100-400 billion', 1);
INSERT INTO public.galaxy VALUES ('Andromeda', 'Spiral', 2537000, 220000, '1 trillion', 2);
INSERT INTO public.galaxy VALUES ('Triangulum', 'Spiral', 2730000, 60000, '40 billion', 3);
INSERT INTO public.galaxy VALUES ('Large Magellanic', 'Irregular', 163000, 14000, '30 billion', 4);
INSERT INTO public.galaxy VALUES ('Messier 87', 'Eliptical', 53000000, 120000, '1.2 trillion', 5);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 'Spiral', 31000000, 50000, '800 billion', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 27.3, 0.0, 0.3, 'Rock, Regolith');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0.3, 0.0, 0.0, 'Dust, Carbonaceous');
INSERT INTO public.moon VALUES (3, 'Europa', 3, 3.6, 0.0, 0.2, 'Ice, Silicate');
INSERT INTO public.moon VALUES (4, 'Titan', 3, 15.9, 0.0, 0.4, 'Ice, Nitrogen atmosphere');
INSERT INTO public.moon VALUES (5, 'M87-M1', 6, 300.0, 0.0, 0.2, 'Ammonia, Ice');
INSERT INTO public.moon VALUES (6, 'Kepler-Moon', 5, 40.0, 0.0, 0.2, 'Unknown');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 16.7, 0.0, 0.4, 'Ice, Rock');
INSERT INTO public.moon VALUES (8, 'Io', 3, 1.8, 0.0, 0.4, 'Sulfur, Volcanoes');
INSERT INTO public.moon VALUES (9, 'Ganymede', 3, 7.2, 0.0, 0.4, 'Ice, Rock');
INSERT INTO public.moon VALUES (10, 'Proxima Moon', 4, 5.5, 0.0, 0.2, 'Unknown');
INSERT INTO public.moon VALUES (11, 'Gliese-Moon', 6, 10.4, 0.0, 0.2, 'CO2 Ice, Rock');
INSERT INTO public.moon VALUES (12, 'WASP-Moon A', 7, 5.0, 0.0, 0.2, 'Silicate');
INSERT INTO public.moon VALUES (13, 'WASP-Moon B', 7, 8.0, 0.0, 0.3, 'Volcanic Rock');
INSERT INTO public.moon VALUES (14, 'OGLE-Moon', 8, 80.0, 0.0, 0.3, 'Unknown');
INSERT INTO public.moon VALUES (15, 'HD-Moon A', 9, 4.2, 0.0, 0.2, 'Dust, Hydrogen ice');
INSERT INTO public.moon VALUES (16, 'HD-Moon B', 9, 6.5, 0.0, 0.2, 'Frozen carbon');
INSERT INTO public.moon VALUES (17, 'TRAPPIST Moon 1', 10, 1.2, 0.0, 0.2, 'Silicate');
INSERT INTO public.moon VALUES (18, 'TRAPPIST Moon 2', 10, 2.6, 0.0, 0.2, 'CO2 Ice');
INSERT INTO public.moon VALUES (19, 'M87-Moon', 14, 300.0, 0.0, 0.2, 'Ammonia, Ice');
INSERT INTO public.moon VALUES (20, 'Andromeda Moon', 15, 35.0, 0.0, 0.3, 'Regolith, Ice');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Terrestrial', 365.0, 1.0, 1.0, 'Nitrogen-Oxygen', 'Earth', true, false);
INSERT INTO public.planet VALUES (2, 1, 'Terrestrial', 687.0, 0.1, 0.5, 'CO2', 'Mars', false, false);
INSERT INTO public.planet VALUES (3, 1, 'Gas Giant', 4332.0, 317.8, 11.2, 'Hydrogen-Helium', 'Jupiter', false, true);
INSERT INTO public.planet VALUES (4, 2, 'Terrestrial', 11.2, 1.3, 1.1, 'Unknown', 'Proxima B', NULL, false);
INSERT INTO public.planet VALUES (5, 3, 'Super-Earth', 289.9, 2.4, 2.5, 'Unknown', 'Kepler-22B', NULL, false);
INSERT INTO public.planet VALUES (6, 6, 'Ice Giant', 8000.0, 17.2, 4.3, 'Methane-Ammonia', 'M87-X', false, true);
INSERT INTO public.planet VALUES (7, 4, 'Terrestrial', 36.6, 3.1, 1.5, 'CO2-Nitrogen', 'Gliese 581g', NULL, false);
INSERT INTO public.planet VALUES (8, 5, 'Hot Jupiter', 1.1, 450.0, 15.0, 'Hydrogen', 'WASP-12b', false, true);
INSERT INTO public.planet VALUES (9, 3, 'Gas Giant', 3000.0, 130.0, 10.5, 'Unknown', 'OGLE-2005-BLG', NULL, false);
INSERT INTO public.planet VALUES (10, 5, 'Hot Jupiter', 3.5, 220.0, 13.0, 'Hydrogen-Helium', 'HD 209458 b', false, true);
INSERT INTO public.planet VALUES (11, 4, 'Terrestrial', 6.1, 0.7, 0.9, 'CO2', 'TRAPPIST-1e', true, false);
INSERT INTO public.planet VALUES (12, 2, 'Mini-Neptune', 1.6, 6.5, 2.7, 'Water vapor', 'GJ 1214b', NULL, false);
INSERT INTO public.planet VALUES (13, 2, 'Super-Earth', 33.0, 8.6, 2.6, 'Hydrogen-Nitrogen', 'K2-18b', true, false);
INSERT INTO public.planet VALUES (14, 2, 'Terrestrial', 20.0, 4.0, 1.9, 'Unknown', 'Tau Ceti f', NULL, false);
INSERT INTO public.planet VALUES (15, 7, 'Terrestrial', 410.0, 1.0, 1.0, 'Oxygen-Nitrogen', 'Andromeda Prime', true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1.0, 1.0, 5778, 1);
INSERT INTO public.star VALUES (2, 'Proxima Cent.', 1, 'M-type', 0.1, 0.1, 3042, 0);
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 'A-type', 2.0, 1.7, 9940, 25);
INSERT INTO public.star VALUES (4, 'Andromeda A', 2, 'G-type', 1.1, 1.1, 5800, 1);
INSERT INTO public.star VALUES (5, 'Triangulum B', 3, 'K-type', 0.9, 0.8, 4800, 1);
INSERT INTO public.star VALUES (6, 'M87 Core Star', 5, 'B-type', 4.5, 3.2, 12000, 1000);
INSERT INTO public.star VALUES (7, 'Andromeda Prime', 2, 'G-type', 1.1, 1.0, 5770, 1);


--
-- Name: black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_id_seq', 1, false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

