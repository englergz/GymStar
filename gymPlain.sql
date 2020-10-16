--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.17
-- Dumped by pg_dump version 9.6.17

-- Started on 2020-09-10 16:20:00

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
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16477)
-- Name: reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reserva (
    id integer NOT NULL,
    nombre text,
    email character(250),
    celular text,
    hora text,
    fecha date,
    mensaje text
);


ALTER TABLE public.reserva OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16483)
-- Name: agenda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agenda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agenda_id_seq OWNER TO postgres;

--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 186
-- Name: agenda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agenda_id_seq OWNED BY public.reserva.id;


--
-- TOC entry 189 (class 1259 OID 16510)
-- Name: boletin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boletin (
    id integer NOT NULL,
    email character(400)
);


ALTER TABLE public.boletin OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16513)
-- Name: boletin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boletin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boletin_id_seq OWNER TO postgres;

--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 190
-- Name: boletin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boletin_id_seq OWNED BY public.boletin.id;


--
-- TOC entry 187 (class 1259 OID 16485)
-- Name: contacto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacto (
    id integer NOT NULL,
    nombre text,
    mensaje text,
    email character(250)
);


ALTER TABLE public.contacto OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16491)
-- Name: contacto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacto_id_seq OWNER TO postgres;

--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 188
-- Name: contacto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacto_id_seq OWNED BY public.contacto.id;


--
-- TOC entry 2018 (class 2604 OID 16515)
-- Name: boletin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boletin ALTER COLUMN id SET DEFAULT nextval('public.boletin_id_seq'::regclass);


--
-- TOC entry 2017 (class 2604 OID 16502)
-- Name: contacto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacto ALTER COLUMN id SET DEFAULT nextval('public.contacto_id_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 16501)
-- Name: reserva id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva ALTER COLUMN id SET DEFAULT nextval('public.agenda_id_seq'::regclass);


--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 186
-- Name: agenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agenda_id_seq', 49, true);


--
-- TOC entry 2146 (class 0 OID 16510)
-- Dependencies: 189
-- Data for Name: boletin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boletin (id, email) FROM stdin;
41	Lusecitaayd@hotmail.com                                                                                                                                                                                                                                                                                                                                                                                         
42	evelin@gmail.com                                                                                                                                                                                                                                                                                                                                                                                                
\.


--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 190
-- Name: boletin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boletin_id_seq', 42, true);


--
-- TOC entry 2144 (class 0 OID 16485)
-- Dependencies: 187
-- Data for Name: contacto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacto (id, nombre, mensaje, email) FROM stdin;
53	Vanessa 	Jjj	Lusecitaayd@hotmail.com                                                                                                                                                                                                                                   
\.


--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 188
-- Name: contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacto_id_seq', 55, true);


--
-- TOC entry 2142 (class 0 OID 16477)
-- Dependencies: 185
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reserva (id, nombre, email, celular, hora, fecha, mensaje) FROM stdin;
48	Evelin Betancourt	evelin@gmail.com                                                                                                                                                                                                                                          	3183088060	13:07	2020-09-14	Ejercicios pa' piernas.
49	Vanessa 	Lusecitaayd@hotmail.com                                                                                                                                                                                                                                   	3175997143	15:00	2020-09-11	
\.


--
-- TOC entry 2020 (class 2606 OID 16505)
-- Name: reserva agenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT agenda_pkey PRIMARY KEY (id);


--
-- TOC entry 2024 (class 2606 OID 16523)
-- Name: boletin boletin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boletin
    ADD CONSTRAINT boletin_pkey PRIMARY KEY (id);


--
-- TOC entry 2022 (class 2606 OID 16507)
-- Name: contacto contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacto
    ADD CONSTRAINT contacto_pkey PRIMARY KEY (id);


-- Completed on 2020-09-10 16:20:01

--
-- PostgreSQL database dump complete
--

