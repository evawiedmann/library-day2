--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.authors OWNER TO "Guest";

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO "Guest";

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.books (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.books OWNER TO "Guest";

--
-- Name: books_authors; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.books_authors (
    id integer NOT NULL,
    author_id integer,
    book_id integer
);


ALTER TABLE public.books_authors OWNER TO "Guest";

--
-- Name: books_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.books_authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_authors_id_seq OWNER TO "Guest";

--
-- Name: books_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.books_authors_id_seq OWNED BY public.books_authors.id;


--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO "Guest";

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: books_patrons; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.books_patrons (
    id integer NOT NULL,
    patron_id integer,
    book_id integer
);


ALTER TABLE public.books_patrons OWNER TO "Guest";

--
-- Name: books_patrons_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.books_patrons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_patrons_id_seq OWNER TO "Guest";

--
-- Name: books_patrons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.books_patrons_id_seq OWNED BY public.books_patrons.id;


--
-- Name: patrons; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.patrons (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.patrons OWNER TO "Guest";

--
-- Name: patrons_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.patrons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patrons_id_seq OWNER TO "Guest";

--
-- Name: patrons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.patrons_id_seq OWNED BY public.patrons.id;


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: books_authors id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.books_authors ALTER COLUMN id SET DEFAULT nextval('public.books_authors_id_seq'::regclass);


--
-- Name: books_patrons id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.books_patrons ALTER COLUMN id SET DEFAULT nextval('public.books_patrons_id_seq'::regclass);


--
-- Name: patrons id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.patrons ALTER COLUMN id SET DEFAULT nextval('public.patrons_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.authors (id, name) FROM stdin;
1	author1
2	author2
3	author3
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.books (id, name) FROM stdin;
1	book1
2	book2
3	book3
4	book4
5	book5
\.


--
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.books_authors (id, author_id, book_id) FROM stdin;
8	2	1
15	3	1
\.


--
-- Data for Name: books_patrons; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.books_patrons (id, patron_id, book_id) FROM stdin;
\.


--
-- Data for Name: patrons; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.patrons (id, name) FROM stdin;
1	patron1
2	patron2
3	patron3
4	patron4
5	patron5
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.authors_id_seq', 3, true);


--
-- Name: books_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.books_authors_id_seq', 15, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.books_id_seq', 5, true);


--
-- Name: books_patrons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.books_patrons_id_seq', 3, true);


--
-- Name: patrons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.patrons_id_seq', 5, true);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books_authors books_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.books_authors
    ADD CONSTRAINT books_authors_pkey PRIMARY KEY (id);


--
-- Name: books_patrons books_patrons_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.books_patrons
    ADD CONSTRAINT books_patrons_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: patrons patrons_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.patrons
    ADD CONSTRAINT patrons_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

