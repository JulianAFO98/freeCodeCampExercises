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
    name character varying(80) NOT NULL,
    orbit_time integer,
    galaxy_id integer
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
    size_in_ly numeric(10,2),
    year_of_appointment integer NOT NULL,
    visible_from_earth boolean,
    cant_planets integer
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
    size_in_km integer,
    description text,
    planet_id integer
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
    description text,
    ring boolean,
    star_id integer
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
    diameter_in_km integer NOT NULL,
    age_in_million_of_years integer,
    galaxy_id integer
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

INSERT INTO public.asteroid VALUES (1, 'Tontin', 80, 1);
INSERT INTO public.asteroid VALUES (2, 'Ceres', 1680, 1);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1685, 2);
INSERT INTO public.asteroid VALUES (4, 'Vesta', 1325, 3);
INSERT INTO public.asteroid VALUES (5, 'Hygiea', 2040, 4);
INSERT INTO public.asteroid VALUES (6, 'Eros', 643, 5);
INSERT INTO public.asteroid VALUES (7, 'Itokawa', 556, 6);
INSERT INTO public.asteroid VALUES (8, 'Apophis', 325, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 52850.00, 1609, true, 1175458);
INSERT INTO public.galaxy VALUES (2, 'andromeda', 23456.00, 1723, true, 71296);
INSERT INTO public.galaxy VALUES (3, 'Terminus', 150000.00, 1500, false, 1409712);
INSERT INTO public.galaxy VALUES (4, 'Dextirion', 20000.00, 1890, true, 1603099);
INSERT INTO public.galaxy VALUES (5, 'Devenus', 56744.00, 1200, true, 323873);
INSERT INTO public.galaxy VALUES (6, 'Golden light', 20000.00, 2023, false, 638498);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Pipi', 700, 'Una luna quejosa', 1);
INSERT INTO public.moon VALUES (2, 'Luna', 3474, 'La única luna natural de la Tierra', 3);
INSERT INTO public.moon VALUES (3, 'Phobos', 22, 'Una luna pequeña y rocosa de Marte', 4);
INSERT INTO public.moon VALUES (4, 'Deimos', 12, 'La luna más pequeña de Marte', 4);
INSERT INTO public.moon VALUES (5, 'Io', 3642, 'Una luna volcánica del planeta Júpiter', 5);
INSERT INTO public.moon VALUES (6, 'Europa', 3121, 'Una luna helada con un océano subterráneo', 5);
INSERT INTO public.moon VALUES (7, 'Ganimedes', 5262, 'La luna más grande del sistema solar', 5);
INSERT INTO public.moon VALUES (8, 'Calisto', 4820, 'Una luna antigua con una superficie llena de cráteres', 5);
INSERT INTO public.moon VALUES (9, 'Titán', 5150, 'Una luna nublada con lagos de metano', 6);
INSERT INTO public.moon VALUES (10, 'Encélado', 504, 'Una luna con chorros de agua en su polo sur', 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 396, 'Conocida como la luna de la estrella de la muerte', 6);
INSERT INTO public.moon VALUES (12, 'Tritón', 2706, 'Una luna que orbita en dirección opuesta a Neptuno', 8);
INSERT INTO public.moon VALUES (13, 'Charon', 1212, 'La luna más grande de Plutón', 9);
INSERT INTO public.moon VALUES (14, 'Umbriel', 1190, 'Una luna oscura de Urano', 7);
INSERT INTO public.moon VALUES (15, 'Ariel', 1158, 'Una luna brillante con grietas en su superficie', 7);
INSERT INTO public.moon VALUES (16, 'Miranda', 472, 'La luna más pequeña de Urano', 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 1523, 'Una luna con cráteres oscuros de Urano', 7);
INSERT INTO public.moon VALUES (18, 'Titania', 1578, 'La luna más grande de Urano', 7);
INSERT INTO public.moon VALUES (19, 'Nereida', 340, 'Una luna irregular de Neptuno', 8);
INSERT INTO public.moon VALUES (20, 'Proteus', 420, 'Una luna cercana y oscura de Neptuno', 8);
INSERT INTO public.moon VALUES (21, 'Halley', 55, 'Una luna ficticia con un núcleo de hielo', 10);
INSERT INTO public.moon VALUES (22, 'Selene', 1450, 'Una luna imaginaria con vastos mares', 12);
INSERT INTO public.moon VALUES (23, 'Thebe', 99, 'Una luna interior de Júpiter', 5);
INSERT INTO public.moon VALUES (24, 'Amaltea', 167, 'Una luna en forma de patata de Júpiter', 5);
INSERT INTO public.moon VALUES (25, 'Dione', 1123, 'Una luna helada con grietas brillantes', 6);
INSERT INTO public.moon VALUES (26, 'Rhea', 1528, 'Una luna llena de cráteres alrededor de Saturno', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Juan', 'Un planeta caballo', true, 6);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Un planeta pequeño y rocoso', false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Un planeta brillante con una atmósfera densa', true, 2);
INSERT INTO public.planet VALUES (4, 'Earth', 'Nuestro planeta hogar con agua líquida', true, 6);
INSERT INTO public.planet VALUES (5, 'Mars', 'El planeta rojo conocido por sus tormentas de polvo', false, 5);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'El planeta más grande con una gran mancha roja', true, 2);
INSERT INTO public.planet VALUES (7, 'Saturn', 'Conocido por sus impresionantes anillos', true, 6);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Un planeta inclinado con un tono azul', true, 5);
INSERT INTO public.planet VALUES (9, 'Neptune', 'Un planeta azul profundo con fuertes vientos', true, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Un planeta enano más allá de Neptuno', false, 5);
INSERT INTO public.planet VALUES (11, 'Ceres', 'El mayor objeto en el cinturón de asteroides', false, 1);
INSERT INTO public.planet VALUES (12, 'Eris', 'Un planeta enano más allá de Plutón', false, 6);
INSERT INTO public.planet VALUES (13, 'Haumea', 'Un planeta enano con forma alargada', false, 2);
INSERT INTO public.planet VALUES (14, 'Makemake', 'Un planeta enano del cinturón de Kuiper', false, 1);
INSERT INTO public.planet VALUES (15, 'Io', 'Una luna volcánica del planeta Júpiter', false, 6);
INSERT INTO public.planet VALUES (16, 'Europa', 'Una luna helada con un océano bajo su superficie', false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1392680, 4600, 1);
INSERT INTO public.star VALUES (2, 'Pipo', 78666, 7000, 2);
INSERT INTO public.star VALUES (3, 'Ratamur', 80065, 1700, 2);
INSERT INTO public.star VALUES (4, 'Devono', 60054, 700203, 2);
INSERT INTO public.star VALUES (5, 'Bomba', 180, 10000, 6);
INSERT INTO public.star VALUES (6, 'Milsa', 600, 73, 5);
INSERT INTO public.star VALUES (7, 'Oldest One', 10, 999999, 5);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

