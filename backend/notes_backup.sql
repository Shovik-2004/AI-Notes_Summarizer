--
-- PostgreSQL database dump
--

-- Dumped from database version 14.18 (Homebrew)
-- Dumped by pg_dump version 14.18 (Homebrew)

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
-- Name: notes; Type: TABLE; Schema: public; Owner: shovik
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    content text,
    summary text,
    user_id integer
);


ALTER TABLE public.notes OWNER TO shovik;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: shovik
--

CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO shovik;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shovik
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: shovik
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    password character varying
);


ALTER TABLE public.users OWNER TO shovik;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: shovik
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO shovik;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shovik
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: shovik
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: shovik
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: shovik
--

COPY public.notes (id, content, summary, user_id) FROM stdin;
1	Artificial Intelligence (AI) is transforming industries across the globe. From healthcare to finance, AI is enabling smarter decision-making, automating repetitive tasks, and improving customer experiences. In healthcare, AI is used to diagnose diseases and suggest personalized treatments. Financial institutions rely on AI for fraud detection and risk management. In retail, AI helps analyze customer behavior and optimize inventory. Even education is evolving, with AI-driven tutoring systems and personalized learning paths. As AI continues to advance, ethical concerns and responsible deployment are becoming critical. Understanding the impact of AI today is essential to harness its potential while minimizing risks.	❌ Failed to summarize: HTTPSConnectionPool(host='api-inference.huggingface.co', port=443): Max retries exceeded with url: /models/facebook/bart-large-cnn (Caused by NameResolutionError("<urllib3.connection.HTTPSConnection object at 0x10881bdf0>: Failed to resolve 'api-inference.huggingface.co' ([Errno 8] nodename nor servname provided, or not known)"))	1
2	Artificial Intelligence (AI) is transforming industries across the globe. From healthcare to finance, AI is enabling smarter decision-making, automating repetitive tasks, and improving customer experiences. In healthcare, AI is used to diagnose diseases and suggest personalized treatments. Financial institutions rely on AI for fraud detection and risk management. In retail, AI helps analyze customer behavior and optimize inventory. Even education is evolving, with AI-driven tutoring systems and personalized learning paths. As AI continues to advance, ethical concerns and responsible deployment are becoming critical. Understanding the impact of AI today is essential to harness its potential while minimizing risks.	Artificial Intelligence (AI) is transforming industries across the globe. From healthcare to finance, AI is enabling smarter decision-making and automating repetitive tasks. As AI continues to advance, ethical concerns and responsible deployment are becoming critical.	1
3	Artificial Intelligence (AI) refers to the simulation of human intelligence processes by machines, especially computer systems. It enables machines to perform tasks that typically require human cognition, such as learning, reasoning, problem-solving, understanding language, and perception. AI has rapidly evolved in recent years, driven by advancements in machine learning, deep learning, and vast amounts of data. From virtual assistants like Siri and Alexa to self-driving cars, AI is transforming industries including healthcare, finance, education, manufacturing, and entertainment. In healthcare, AI helps diagnose diseases, predict patient outcomes, and personalize treatment plans. In finance, it powers fraud detection systems and algorithmic trading. AI also plays a pivotal role in natural language processing, powering chatbots and language translation tools. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. The future of AI holds promise for even more sophisticated applications, like general AI, which could match or surpass human capabilities. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks. As AI continues to integrate into daily life, it offers opportunities for innovation, efficiency, and smarter decision-making, reshaping how we live and work in an increasingly digital world.	Artificial Intelligence is transforming industries including healthcare, finance, education, manufacturing, and entertainment. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks.	1
4	Artificial Intelligence (AI) refers to the simulation of human intelligence processes by machines, especially computer systems. It enables machines to perform tasks that typically require human cognition, such as learning, reasoning, problem-solving, understanding language, and perception. AI has rapidly evolved in recent years, driven by advancements in machine learning, deep learning, and vast amounts of data. From virtual assistants like Siri and Alexa to self-driving cars, AI is transforming industries including healthcare, finance, education, manufacturing, and entertainment. In healthcare, AI helps diagnose diseases, predict patient outcomes, and personalize treatment plans. In finance, it powers fraud detection systems and algorithmic trading. AI also plays a pivotal role in natural language processing, powering chatbots and language translation tools. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. The future of AI holds promise for even more sophisticated applications, like general AI, which could match or surpass human capabilities. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks. As AI continues to integrate into daily life, it offers opportunities for innovation, efficiency, and smarter decision-making, reshaping how we live and work in an increasingly digital world.	Artificial Intelligence is transforming industries including healthcare, finance, education, manufacturing, and entertainment. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks.	3
5	Artificial Intelligence (AI) refers to the simulation of human intelligence processes by machines, especially computer systems. It enables machines to perform tasks that typically require human cognition, such as learning, reasoning, problem-solving, understanding language, and perception. AI has rapidly evolved in recent years, driven by advancements in machine learning, deep learning, and vast amounts of data. From virtual assistants like Siri and Alexa to self-driving cars, AI is transforming industries including healthcare, finance, education, manufacturing, and entertainment. In healthcare, AI helps diagnose diseases, predict patient outcomes, and personalize treatment plans. In finance, it powers fraud detection systems and algorithmic trading. AI also plays a pivotal role in natural language processing, powering chatbots and language translation tools. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. The future of AI holds promise for even more sophisticated applications, like general AI, which could match or surpass human capabilities. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks. As AI continues to integrate into daily life, it offers opportunities for innovation, efficiency, and smarter decision-making, reshaping how we live and work in an increasingly digital world.	Artificial Intelligence is transforming industries including healthcare, finance, education, manufacturing, and entertainment. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks.	3
6	Artificial Intelligence (AI) refers to the simulation of human intelligence processes by machines, especially computer systems. It enables machines to perform tasks that typically require human cognition, such as learning, reasoning, problem-solving, understanding language, and perception. AI has rapidly evolved in recent years, driven by advancements in machine learning, deep learning, and vast amounts of data. From virtual assistants like Siri and Alexa to self-driving cars, AI is transforming industries including healthcare, finance, education, manufacturing, and entertainment. In healthcare, AI helps diagnose diseases, predict patient outcomes, and personalize treatment plans. In finance, it powers fraud detection systems and algorithmic trading. AI also plays a pivotal role in natural language processing, powering chatbots and language translation tools. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. The future of AI holds promise for even more sophisticated applications, like general AI, which could match or surpass human capabilities. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks. As AI continues to integrate into daily life, it offers opportunities for innovation, efficiency, and smarter decision-making, reshaping how we live and work in an increasingly digital world.	Artificial Intelligence is transforming industries including healthcare, finance, education, manufacturing, and entertainment. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks.	3
7	Artificial Intelligence (AI) refers to the simulation of human intelligence processes by machines, especially computer systems. It enables machines to perform tasks that typically require human cognition, such as learning, reasoning, problem-solving, understanding language, and perception. AI has rapidly evolved in recent years, driven by advancements in machine learning, deep learning, and vast amounts of data. From virtual assistants like Siri and Alexa to self-driving cars, AI is transforming industries including healthcare, finance, education, manufacturing, and entertainment. In healthcare, AI helps diagnose diseases, predict patient outcomes, and personalize treatment plans. In finance, it powers fraud detection systems and algorithmic trading. AI also plays a pivotal role in natural language processing, powering chatbots and language translation tools. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. The future of AI holds promise for even more sophisticated applications, like general AI, which could match or surpass human capabilities. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks. As AI continues to integrate into daily life, it offers opportunities for innovation, efficiency, and smarter decision-making, reshaping how we live and work in an increasingly digital world.	Artificial Intelligence is transforming industries including healthcare, finance, education, manufacturing, and entertainment. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks.	3
8	Artificial Intelligence (AI) refers to the simulation of human intelligence processes by machines, especially computer systems. It enables machines to perform tasks that typically require human cognition, such as learning, reasoning, problem-solving, understanding language, and perception. AI has rapidly evolved in recent years, driven by advancements in machine learning, deep learning, and vast amounts of data. From virtual assistants like Siri and Alexa to self-driving cars, AI is transforming industries including healthcare, finance, education, manufacturing, and entertainment. In healthcare, AI helps diagnose diseases, predict patient outcomes, and personalize treatment plans. In finance, it powers fraud detection systems and algorithmic trading. AI also plays a pivotal role in natural language processing, powering chatbots and language translation tools. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. The future of AI holds promise for even more sophisticated applications, like general AI, which could match or surpass human capabilities. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks. As AI continues to integrate into daily life, it offers opportunities for innovation, efficiency, and smarter decision-making, reshaping how we live and work in an increasingly digital world.	Artificial Intelligence is transforming industries including healthcare, finance, education, manufacturing, and entertainment. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks.	3
9	Artificial Intelligence (AI) refers to the simulation of human intelligence processes by machines, especially computer systems. It enables machines to perform tasks that typically require human cognition, such as learning, reasoning, problem-solving, understanding language, and perception. AI has rapidly evolved in recent years, driven by advancements in machine learning, deep learning, and vast amounts of data. From virtual assistants like Siri and Alexa to self-driving cars, AI is transforming industries including healthcare, finance, education, manufacturing, and entertainment. In healthcare, AI helps diagnose diseases, predict patient outcomes, and personalize treatment plans. In finance, it powers fraud detection systems and algorithmic trading. AI also plays a pivotal role in natural language processing, powering chatbots and language translation tools. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. The future of AI holds promise for even more sophisticated applications, like general AI, which could match or surpass human capabilities. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks. As AI continues to integrate into daily life, it offers opportunities for innovation, efficiency, and smarter decision-making, reshaping how we live and work in an increasingly digital world.	Artificial Intelligence is transforming industries including healthcare, finance, education, manufacturing, and entertainment. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks.	3
10	Artificial Intelligence (AI) refers to the simulation of human intelligence processes by machines, especially computer systems. It enables machines to perform tasks that typically require human cognition, such as learning, reasoning, problem-solving, understanding language, and perception. AI has rapidly evolved in recent years, driven by advancements in machine learning, deep learning, and vast amounts of data. From virtual assistants like Siri and Alexa to self-driving cars, AI is transforming industries including healthcare, finance, education, manufacturing, and entertainment. In healthcare, AI helps diagnose diseases, predict patient outcomes, and personalize treatment plans. In finance, it powers fraud detection systems and algorithmic trading. AI also plays a pivotal role in natural language processing, powering chatbots and language translation tools. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. The future of AI holds promise for even more sophisticated applications, like general AI, which could match or surpass human capabilities. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks. As AI continues to integrate into daily life, it offers opportunities for innovation, efficiency, and smarter decision-making, reshaping how we live and work in an increasingly digital world.	Artificial Intelligence is transforming industries including healthcare, finance, education, manufacturing, and entertainment. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks.	3
11	The cow is a gentle and domesticated animal that holds great significance in many cultures, especially in India. It is considered sacred and often referred to as “Gau Mata” in Hindu tradition. Cows are herbivores and primarily feed on grass, grains, and vegetables. They are known for their calm and peaceful nature. The cow has a large body, four legs, a long tail, and two horns. It is found all over the world and is an important part of the agricultural economy.\n\nCows provide us with milk, which is a vital source of nutrition. From milk, we get various dairy products like butter, cheese, ghee, curd, and cream. Cow dung is used as a natural fertilizer and also as fuel in rural areas. Even cow urine is believed to have medicinal value in traditional practices. Farmers often keep cows for plowing fields and producing manure.\n\nIn India, killing cows is banned in many states due to religious and cultural beliefs. People celebrate festivals like Gopashtami to honor cows. They are treated with respect and often seen as symbols of motherhood and prosperity. Overall, cows play a vital role in rural livelihoods and continue to be an integral part of human civilization.\n	The cow is a gentle and domesticated animal that holds great significance in many cultures. It is considered sacred and often referred to as ‘Gau Mata’ in Hindu tradition. Cows are herbivores and primarily feed on grass, grains, and vegetables.	3
12	Artificial Intelligence (AI) refers to the simulation of human intelligence processes by machines, especially computer systems. It enables machines to perform tasks that typically require human cognition, such as learning, reasoning, problem-solving, understanding language, and perception. AI has rapidly evolved in recent years, driven by advancements in machine learning, deep learning, and vast amounts of data. From virtual assistants like Siri and Alexa to self-driving cars, AI is transforming industries including healthcare, finance, education, manufacturing, and entertainment. In healthcare, AI helps diagnose diseases, predict patient outcomes, and personalize treatment plans. In finance, it powers fraud detection systems and algorithmic trading. AI also plays a pivotal role in natural language processing, powering chatbots and language translation tools. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. The future of AI holds promise for even more sophisticated applications, like general AI, which could match or surpass human capabilities. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks. As AI continues to integrate into daily life, it offers opportunities for innovation, efficiency, and smarter decision-making, reshaping how we live and work in an increasingly digital world.	Artificial Intelligence is transforming industries including healthcare, finance, education, manufacturing, and entertainment. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks.	1
13	Artificial Intelligence (AI) refers to the simulation of human intelligence processes by machines, especially computer systems. It enables machines to perform tasks that typically require human cognition, such as learning, reasoning, problem-solving, understanding language, and perception. AI has rapidly evolved in recent years, driven by advancements in machine learning, deep learning, and vast amounts of data. From virtual assistants like Siri and Alexa to self-driving cars, AI is transforming industries including healthcare, finance, education, manufacturing, and entertainment. In healthcare, AI helps diagnose diseases, predict patient outcomes, and personalize treatment plans. In finance, it powers fraud detection systems and algorithmic trading. AI also plays a pivotal role in natural language processing, powering chatbots and language translation tools. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. The future of AI holds promise for even more sophisticated applications, like general AI, which could match or surpass human capabilities. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks. As AI continues to integrate into daily life, it offers opportunities for innovation, efficiency, and smarter decision-making, reshaping how we live and work in an increasingly digital world.	Artificial Intelligence is transforming industries including healthcare, finance, education, manufacturing, and entertainment. Despite its immense benefits, AI raises ethical concerns such as job displacement, data privacy, and algorithmic bias. To ensure AI remains beneficial, it is essential to establish clear ethical guidelines and regulatory frameworks.	3
14	The cow is a gentle and domesticated animal that holds great significance in many cultures, especially in India. It is considered sacred and often referred to as “Gau Mata” in Hindu tradition. Cows are herbivores and primarily feed on grass, grains, and vegetables. They are known for their calm and peaceful nature. The cow has a large body, four legs, a long tail, and two horns. It is found all over the world and is an important part of the agricultural economy.\n\nCows provide us with milk, which is a vital source of nutrition. From milk, we get various dairy products like butter, cheese, ghee, curd, and cream. Cow dung is used as a natural fertilizer and also as fuel in rural areas. Even cow urine is believed to have medicinal value in traditional practices. Farmers often keep cows for plowing fields and producing manure.\n\nIn India, killing cows is banned in many states due to religious and cultural beliefs. People celebrate festivals like Gopashtami to honor cows. They are treated with respect and often seen as symbols of motherhood and prosperity. Overall, cows play a vital role in rural livelihoods and continue to be an integral part of human civilization.	The cow is a gentle and domesticated animal that holds great significance in many cultures. It is considered sacred and often referred to as ‘Gau Mata’ in Hindu tradition. Cows are herbivores and primarily feed on grass, grains, and vegetables.	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: shovik
--

COPY public.users (id, username, password) FROM stdin;
1	shovik	$2b$12$.cVES15m/atO2hw/7WOKDezoOxVUDm3zL1UlX3FAPmR8AalBH/BKq
2		$2b$12$x3GimhYKh.IjgzhnFiVg/u0aPkJEQsqDwoMWAACAaEAqAwc6Yffii
3	shb	$2b$12$LUKkhU2e9kEawYTPXWXkPuDftipPP.BEa9vK6cIMJ0f60gWZfez5.
\.


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shovik
--

SELECT pg_catalog.setval('public.notes_id_seq', 14, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shovik
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: shovik
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: shovik
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_notes_id; Type: INDEX; Schema: public; Owner: shovik
--

CREATE INDEX ix_notes_id ON public.notes USING btree (id);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: shovik
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: ix_users_username; Type: INDEX; Schema: public; Owner: shovik
--

CREATE UNIQUE INDEX ix_users_username ON public.users USING btree (username);


--
-- Name: notes notes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shovik
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

