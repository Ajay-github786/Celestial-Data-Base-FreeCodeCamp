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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    size_in_kps numeric(4,3),
    helio_radial_valocity integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_atmosphere boolean,
    distance_from_planet_in_mlkms integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_moons boolean,
    no_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_planets boolean,
    no_of_planets integer,
    spectrum_color character varying(15)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'IT is a short period comet, visible from earth every 75-79 years. Its the only naked eye comet that can appear twice in a human life time.');
INSERT INTO public.comet VALUES (2, 'Ceaser', 'It was a seven-day cometary outburst seen in July 44 BC It was interpreted by Romans as the sign of the deifycation of recently assassinated emperor.');
INSERT INTO public.comet VALUES (3, 'Shoemaker', 'It broke apart in yr 1992 and collided with Jupiter in July 1994 providing the first direct observation of an extraterrestrial collision of Solar System Objects');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MILKY WAY', 'It contains the Sun and its solar system, and therefore Earth.', 'NaN', 550);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Its name stems from the area of the Earths sky where it appears.', 'NaN', -301);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 'It has a spectacular dark band of absorbing dust in front of its bright nucleus.', 'NaN', 410);
INSERT INTO public.galaxy VALUES (4, 'Fireworks', 'Its name is due to its bright and spotty appearnce.', 'NaN', 48);
INSERT INTO public.galaxy VALUES (5, 'Hocky Stick', 'Its name is due to its appearnce resembling to Hocky Stick.', 'NaN', 0);
INSERT INTO public.galaxy VALUES (6, 'Peekaboo', 'Its relatively nearby, is considered one of the most metal-poor, least chemically enriched.', 'NaN', 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 4, 'Moon', 'It is the only place beyond Earth where humans have set foot.', true, 0);
INSERT INTO public.moon VALUES (3, 5, 'Phobos', 'It is the larger of Mars two moons orbitting Mars 3 times a dayt.', false, 0);
INSERT INTO public.moon VALUES (4, 5, 'Deimos', 'It is the smaller of Mars &apos; two moons, orbitting Mars in 30.3 hrs.', false, 0);
INSERT INTO public.moon VALUES (5, 6, 'Io', 'It is the most volcanically active world in our solar system', true, 0);
INSERT INTO public.moon VALUES (6, 6, 'Europa', 'It is thought to have an iron core, a rock mantle and an ocean of salty water.', true, 1);
INSERT INTO public.moon VALUES (7, 6, 'Ganymede', 'It is the largest moon in our solar system and has its own magnetic field.', true, 1);
INSERT INTO public.moon VALUES (8, 6, 'Callisto', 'It is the third largest moon in our solar system and has most heavily cratered surface in our solar system.', true, 2);
INSERT INTO public.moon VALUES (9, 7, 'Atlas', 'It is an inner moon of Saturn, orbiting around the outer edge of A ring.', true, 0);
INSERT INTO public.moon VALUES (10, 7, 'Bebhionn', 'It is one of the four members of the gellic group of moons of Saturn.', false, 17);
INSERT INTO public.moon VALUES (11, 7, 'Calypso', 'It is a Trojan of the larger moon Tethys.', false, 0);
INSERT INTO public.moon VALUES (13, 7, 'Dione', 'It is a small moon of 562 kms. in mean radius.', NULL, 0);
INSERT INTO public.moon VALUES (14, 7, 'Helene', 'It is a small and faint moon of Trojan category.', NULL, 0);
INSERT INTO public.moon VALUES (15, 7, 'Methone', 'It is a tiny and  moon of 1.6 kms mean radius.', NULL, 0);
INSERT INTO public.moon VALUES (16, 7, 'Mimas', 'It is the smallest and innermost  moon of Saturn..', NULL, 0);
INSERT INTO public.moon VALUES (17, 7, 'Mundilfari', 'It has a mean radius of 3.5 kms, thought to be an object captured by Saturn&apos; gravity.', NULL, 19);
INSERT INTO public.moon VALUES (18, 8, 'Ariel', 'It is thought to consist mostly of  roughly equal amount of water and ice and silicate rocks.', NULL, 0);
INSERT INTO public.moon VALUES (19, 8, 'Belinda', 'It was discovered in 1986 in images taken by Voyager 2.', NULL, 0);
INSERT INTO public.moon VALUES (20, 8, 'Oberon', 'It was discovered in 1787 by William Herschell.', NULL, 1);
INSERT INTO public.moon VALUES (21, 8, 'Rosalind', 'It was discovered in 1986 by Voyager 2.', NULL, 1);
INSERT INTO public.moon VALUES (22, 8, 'Titania', 'It is Uranus&apos;s largest moon. It was found to geologically active.', NULL, 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 5, 'MERCURY', 'Its the smallest planet in our solar system and closest to the Sun.', false, 0);
INSERT INTO public.planet VALUES (2, 5, 'VENUS', 'Its the hotest planet in our solar system and spins in the opposite direction.', false, 0);
INSERT INTO public.planet VALUES (4, 5, 'EARTH', 'Its the only planet we know so far to have living things and has liquid water on its surface.', true, 1);
INSERT INTO public.planet VALUES (5, 5, 'MARS', 'Its a dusty, cold, desert world with a very thin atmosphere.', true, 2);
INSERT INTO public.planet VALUES (6, 5, 'JUPITER', 'Its more then twice as massive then the other planets of our solar system combined.', true, 79);
INSERT INTO public.planet VALUES (7, 5, 'SATURN', 'Its adorned with a dazzeling, complex system of icy rings.', true, 83);
INSERT INTO public.planet VALUES (8, 5, 'URANUS', 'Its the seventh planet form the Sun and rotates at a nearly 90 degree angle.', true, 5);
INSERT INTO public.planet VALUES (9, 5, 'NEPTUNE', 'Its the eighth and most distant planet form the Sun.', true, 14);
INSERT INTO public.planet VALUES (10, 5, 'PLUTO', 'Its a dwarf planet in the Kuiper belt and is smaller then Earth Moon.', true, 5);
INSERT INTO public.planet VALUES (11, 5, 'CERES', 'Dwarf planet Ceres is the largest object in the asteroid belt between Mars and Jupiter.', false, 0);
INSERT INTO public.planet VALUES (12, 5, 'MAKEMAKE', 'This dwarf planet is in the Kuiper belt having icy bodies.', true, 1);
INSERT INTO public.planet VALUES (13, 5, 'HAUMEA', 'This dwarf planet is in the Kuiper belt having icy bodies.', true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 1, 'Adhil', 'Its a solitary star in the northern constellation of Andromeda.', false, 0, 'Orange-To-Red');
INSERT INTO public.star VALUES (5, 1, 'Sun', 'Sun is a star at the center of our Solar System and its a ball of gas and plasma.', true, 8, 'White');
INSERT INTO public.star VALUES (6, 1, 'Atlas', 'Atlas is a star located in Milky Way galaxy. However its not in our Solar System', false, 0, 'blue');
INSERT INTO public.star VALUES (7, 3, '35 Comae Berenices', 'it is a star located in Black Eye galaxy.', false, 0, 'blue');
INSERT INTO public.star VALUES (9, 3, 'Arcturus', 'it is a star located in Black Eye galaxy.', false, 0, 'Orange');
INSERT INTO public.star VALUES (10, 1, 'Proxima Centauri', 'it is a red dwarf stawith a mass of 12% of Sun.', true, 3, 'Orange');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

