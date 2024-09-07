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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30),
    star_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_stars_billion integer,
    size_light_years numeric,
    distance_to_earth_light_years integer
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
    name character varying(30) NOT NULL,
    size_km numeric,
    planet_id integer NOT NULL,
    has_atmosphere boolean
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
    name character varying(30) NOT NULL,
    num_moons integer,
    size_km numeric,
    has_life boolean,
    description text,
    is_spherical boolean,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    num_planets integer,
    size_km numeric,
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 1);
INSERT INTO public.asteroid VALUES (5, 'Eros', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 400, 100000, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000, 220000, 2500000);
INSERT INTO public.galaxy VALUES (3, 'Triandgulum', 40000, 60000, 2730000);
INSERT INTO public.galaxy VALUES (4, 'LArge Magellanic Cloud', 10000, 14000, 163000);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 3000, 7000, 200000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 100000, 60000, 23000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3475, 1, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 3, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 3, false);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268, 4, false);
INSERT INTO public.moon VALUES (5, 'Callisto', 4821, 4, false);
INSERT INTO public.moon VALUES (6, 'Io', 3643, 4, true);
INSERT INTO public.moon VALUES (7, 'Europa', 3122, 4, true);
INSERT INTO public.moon VALUES (8, 'Titan', 5149, 5, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 1527, 5, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1470, 5, false);
INSERT INTO public.moon VALUES (11, 'Dione', 1123, 5, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 1062, 5, false);
INSERT INTO public.moon VALUES (13, 'Titania', 1578, 11, false);
INSERT INTO public.moon VALUES (14, 'Oberon', 1522, 11, false);
INSERT INTO public.moon VALUES (15, 'Umbriel', 1169, 11, false);
INSERT INTO public.moon VALUES (16, 'Ariel', 1157, 11, false);
INSERT INTO public.moon VALUES (17, 'Miranda', 471, 11, false);
INSERT INTO public.moon VALUES (18, 'Triton', 2706, 12, true);
INSERT INTO public.moon VALUES (19, 'Proteus', 420, 12, false);
INSERT INTO public.moon VALUES (20, 'Nereid', 340, 12, false);
INSERT INTO public.moon VALUES (21, 'Charon', 1212, 13, false);
INSERT INTO public.moon VALUES (22, 'Nix', 42, 13, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, true, 'The only known planet to harbor life, featuring diverse ecosystems and a vibrant biosphere.', true, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 2, 6779, false, 'The "Red Planet," known for its rusty surface, polar ice caps, and the possibility of past or present water.', true, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 95, 139822, false, 'The largest planet in our solar system, a gas giant with swirling storms and a faint ring system.', true, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 146, 116464, false, 'A gas giant with a prominent ring system composed of ice and rock particles.', true, 1);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', NULL, 16754, false, 'An exoplanet orbiting the closest star to our Sun, located in the habitable zone but with unknown conditions.', true, 3);
INSERT INTO public.planet VALUES (8, 'Kepler-452b', NULL, 20448, false, 'An exoplanet often called "Earth''s Cousin" due to its similar size and location in the habitable zone of its star.', true, 5);
INSERT INTO public.planet VALUES (9, 'Mercury', 0, 4879, false, 'The smallest and closest planet to the Sun, with a heavily cratered surface and extreme temperature variations.', true, 1);
INSERT INTO public.planet VALUES (10, 'Venus', 0, 12104, false, 'The hottest planet in our solar system, with a thick atmosphere of carbon dioxide and sulfuric acid clouds.', true, 1);
INSERT INTO public.planet VALUES (11, 'Uranus', 27, 50724, false, 'An ice giant tilted on its side, with a bluish atmosphere and faint rings.', true, 1);
INSERT INTO public.planet VALUES (12, 'Neptune', 14, 49244, false, 'The farthest planet from the Sun, an ice giant with strong winds and a deep blue color.', true, 1);
INSERT INTO public.planet VALUES (13, 'Pluto', 5, 2377, false, 'A dwarf planet in the Kuiper Belt, with a heart-shaped nitrogen glacier and a thin atmosphere.', true, 1);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1e', NULL, 11070, false, 'A potentially habitable exoplanet orbiting an ultra-cool dwarf star, with a possible surface ocean.', true, 8);
INSERT INTO public.planet VALUES (15, 'Kepler-186f', NULL, 14213, false, 'The first Earth-size exoplanet discovered in the habitable zone of another star.', true, 9);
INSERT INTO public.planet VALUES (16, 'Gliese 667Cc', NULL, 17162, false, 'A super-Earth exoplanet orbiting a red dwarf star, potentially habitable with a possible surface ocean.', true, 10);
INSERT INTO public.planet VALUES (17, 'Kepler-22b', NULL, 34512, false, 'A potentially habitable super-Earth exoplanet orbiting a Sun-like star.', true, 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 1391000, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 2, 200000, 1);
INSERT INTO public.star VALUES (4, 'Mirach', 5, 80000000, 2);
INSERT INTO public.star VALUES (5, 'Alpheratz', 3, 3600000, 2);
INSERT INTO public.star VALUES (6, 'R136a1', 0, 40000000, 4);
INSERT INTO public.star VALUES (7, 'Sirius A', 0, 2382000, 1);
INSERT INTO public.star VALUES (8, 'TRAPPIST-1', 7, 163800, 1);
INSERT INTO public.star VALUES (9, 'Kepler-186', 5, 754300, 1);
INSERT INTO public.star VALUES (10, 'Gliese 667C', 7, 450000, 1);
INSERT INTO public.star VALUES (11, 'Kepler-22', 2, 1379400, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: asteroid asteroid_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_id_unique UNIQUE (asteroid_id);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

