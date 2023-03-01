--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-1.pgdg22.04+1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-1.pgdg22.04+1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "userId" integer NOT NULL,
    "visitCount" integer DEFAULT 0
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '1aa29dcb-6b21-4cb9-b638-c4b03a3d8391', 3, '2023-02-14 16:22:40.122862');
INSERT INTO public.sessions VALUES (2, '8eb75f2f-3aa7-4227-99e0-8415fb654c3f', 12, '2023-02-27 12:16:27.220923');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'iurzmr', '2023-02-27 14:28:42.079851', 12, 0);
INSERT INTO public.urls VALUES (2, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', '2Ng3xQ', '2023-02-27 14:30:17.901316', 12, 0);
INSERT INTO public.urls VALUES (3, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'fQGRxA', '2023-02-27 14:31:08.234806', 12, 0);
INSERT INTO public.urls VALUES (4, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', '9UH5Bl', '2023-02-27 14:33:36.12923', 12, 0);
INSERT INTO public.urls VALUES (5, 'https://twitter.com/home', 'cYR0OD', '2023-02-27 14:35:12.092326', 12, 0);
INSERT INTO public.urls VALUES (6, 'https://twitter.com/home', 'VboRx5', '2023-02-27 14:35:17.560071', 12, 0);
INSERT INTO public.urls VALUES (7, 'https://www.notion.so/bootcampra/Quarta-22-02-Live-Coding-pr-tica-modelagem-f89663893dfd435390150c9ec4a6b857', 'cpRkvg', '2023-02-27 14:35:32.637487', 12, 0);
INSERT INTO public.urls VALUES (8, 'https://www.notion.so/bootcampra/Quarta-22-02-Live-Coding-pr-tica-modelagem-f89663893dfd435390150c9ec4a6b857', 'al3E7v', '2023-02-27 14:39:01.306228', 12, 0);
INSERT INTO public.urls VALUES (9, 'https://www.notion.so/bootcampra/Quarta-22-02-Live-Coding-pr-tica-modelagem-f89663893dfd435390150c9ec4a6b857', 'PHbLEL', '2023-02-27 14:39:02.751859', 12, 0);
INSERT INTO public.urls VALUES (10, 'https://www.notion.so/bootcampra/Quarta-22-02-Live-Coding-pr-tica-modelagem-f89663893dfd435390150c9ec4a6b857', 'AeS0KF', '2023-02-27 14:39:03.391529', 12, 0);
INSERT INTO public.urls VALUES (11, 'https://www.notion.so/bootcampra/Quarta-22-02-Live-Coding-pr-tica-modelagem-f89663893dfd435390150c9ec4a6b857', 'tmUOn4', '2023-02-27 14:39:10.237813', 12, 0);
INSERT INTO public.urls VALUES (12, 'https://www.notion.so/bootcampra/Quarta-22-02-Live-Coding-pr-tica-modelagem-f89663893dfd435390150c9ec4a6b857', 'g8rJCF', '2023-02-27 14:39:15.314682', 12, 0);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'gavu', 'gavu@gavu.com', 'gavu', '2023-02-14 14:37:00.733207');
INSERT INTO public.users VALUES (3, 'gavuzao', 'gavuzao@gavu.com', '$2b$10$jVw2xiQ7s4T.IxxODhc8IOyP8bWeB38V.Dth5OymXXI5AFCkIK59.', '2023-02-14 14:42:35.375391');
INSERT INTO public.users VALUES (12, 'teste gavu', 'testegavu@gavu.com', '$2b$10$0GBVDuBt6l/lvQQdVZw.2OnMIrXnBq2CCcC76OEciWKl4wv.6A99S', '2023-02-27 12:16:10.10938');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 2, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

