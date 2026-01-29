--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    diameter_km integer NOT NULL,
    potentially_hazardous boolean,
    discovery_year integer
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
    name character varying(100) NOT NULL,
    galaxy_types character varying(50) NOT NULL,
    description text,
    distance_from_earth numeric,
    is_active boolean,
    spiral_arms integer DEFAULT 0 NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    has_atmosphere boolean,
    discovery_year integer
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    diameter integer
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    light_years integer,
    discovery_year integer
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 946, false, 1801);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, false, 1807);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, false, 1802);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 434, false, 1849);
INSERT INTO public.asteroid VALUES (5, 'Interamnia', 326, false, NULL);
INSERT INTO public.asteroid VALUES (6, 'Apophis', 370, true, 2004);
INSERT INTO public.asteroid VALUES (7, 'Bennu', 492, true, 1999);
INSERT INTO public.asteroid VALUES (8, 'Ryugu', 900, false, 1999);
INSERT INTO public.asteroid VALUES (9, 'Eros', 17, false, 1898);
INSERT INTO public.asteroid VALUES (10, 'Itokawa', 0, false, 1998);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral barred', 'Our home galaxy', 0, true, 2);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest major galaxy to Milky Way', 2500000, true, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Third-largest in Local Group', 3000000, true, 2);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 'Strong radio source', 13000000, false, 0);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 'Very distinctive dust lane', 29300000, true, 2);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 'Interacting with companion', 23000000, true, 2);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel', 'Spiral', 'M101 – very large and bright', 21000000, true, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (23, 'Moon', 17, 3474, false, 0);
INSERT INTO public.moon VALUES (24, 'Phobos', 18, 22, false, 1877);
INSERT INTO public.moon VALUES (25, 'Deimos', 18, 12, false, 1877);
INSERT INTO public.moon VALUES (26, 'Io', 19, 3643, false, 1610);
INSERT INTO public.moon VALUES (27, 'Europa', 19, 3122, false, 1610);
INSERT INTO public.moon VALUES (28, 'Ganymede', 19, 5268, false, 1610);
INSERT INTO public.moon VALUES (29, 'Callisto', 19, 4821, false, 1610);
INSERT INTO public.moon VALUES (30, 'Titan', 20, 5150, true, 1655);
INSERT INTO public.moon VALUES (31, 'Rhea', 20, 1527, false, 1672);
INSERT INTO public.moon VALUES (32, 'Iapetus', 20, 1470, false, 1671);
INSERT INTO public.moon VALUES (33, 'Dione', 20, 1123, false, 1684);
INSERT INTO public.moon VALUES (34, 'Tethys', 20, 1062, false, 1684);
INSERT INTO public.moon VALUES (35, 'Enceladus', 20, 504, false, 1789);
INSERT INTO public.moon VALUES (36, 'Mimas', 20, 396, false, 1789);
INSERT INTO public.moon VALUES (37, 'Hyperion', 20, 270, false, 1848);
INSERT INTO public.moon VALUES (38, 'Phoebe', 20, 213, false, 1899);
INSERT INTO public.moon VALUES (39, 'Janus', 20, 179, false, 1966);
INSERT INTO public.moon VALUES (40, 'Epimetheus', 20, 116, false, 1966);
INSERT INTO public.moon VALUES (41, 'Telesto', 20, 25, false, 1980);
INSERT INTO public.moon VALUES (42, 'Calypso', 20, 23, false, 1980);
INSERT INTO public.moon VALUES (43, 'Cordelia', 21, 40, false, 1986);
INSERT INTO public.moon VALUES (44, 'Ophelia', 21, 43, false, 1986);
INSERT INTO public.moon VALUES (45, 'Larissa', 22, 194, false, 1989);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (15, 'Mercury', 1, false, 4879);
INSERT INTO public.planet VALUES (16, 'Venus', 1, false, 12104);
INSERT INTO public.planet VALUES (17, 'Earth', 1, true, 12742);
INSERT INTO public.planet VALUES (18, 'Mars', 1, false, 6779);
INSERT INTO public.planet VALUES (19, 'Jupiter', 1, false, 139820);
INSERT INTO public.planet VALUES (20, 'Saturn', 1, false, 116460);
INSERT INTO public.planet VALUES (21, 'Uranus', 1, false, 50724);
INSERT INTO public.planet VALUES (22, 'Neptune', 1, false, 49244);
INSERT INTO public.planet VALUES (23, 'Proxima b', 2, false, -12001);
INSERT INTO public.planet VALUES (24, 'Proxima c', 2, false, -30001);
INSERT INTO public.planet VALUES (25, 'Barnard''s Star b', 1, false, -12001);
INSERT INTO public.planet VALUES (26, 'Ross 128 b', 1, false, -12001);
INSERT INTO public.planet VALUES (27, 'Teegarden b', 1, false, -11001);
INSERT INTO public.planet VALUES (28, 'TRAPPIST-1e', 1, false, -11801);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0, 0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4, 1915);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 4, -400);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 1, 4, 1966);
INSERT INTO public.star VALUES (5, 'Sirius A', 1, 9, -2000);
INSERT INTO public.star VALUES (6, 'Sirius B', 1, 9, 1968);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 1, -641, 0);
INSERT INTO public.star VALUES (8, 'Vega', 1, 25, 0);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 45, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 28, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

