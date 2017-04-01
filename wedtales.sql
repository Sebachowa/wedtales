--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    namespace character varying,
    body text,
    resource_id character varying NOT NULL,
    resource_type character varying NOT NULL,
    author_type character varying,
    author_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE active_admin_comments OWNER TO marc;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_admin_comments_id_seq OWNER TO marc;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO marc;

--
-- Name: attachinary_files; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE attachinary_files (
    id integer NOT NULL,
    attachinariable_type character varying,
    attachinariable_id integer,
    scope character varying,
    public_id character varying,
    version character varying,
    width integer,
    height integer,
    format character varying,
    resource_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE attachinary_files OWNER TO marc;

--
-- Name: attachinary_files_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE attachinary_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attachinary_files_id_seq OWNER TO marc;

--
-- Name: attachinary_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE attachinary_files_id_seq OWNED BY attachinary_files.id;


--
-- Name: guests; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE guests (
    id integer NOT NULL,
    full_name character varying,
    email character varying,
    phone_number character varying,
    plus integer,
    invitation_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE guests OWNER TO marc;

--
-- Name: guests_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE guests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guests_id_seq OWNER TO marc;

--
-- Name: guests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE guests_id_seq OWNED BY guests.id;


--
-- Name: invitations; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE invitations (
    id integer NOT NULL,
    user_id integer,
    og_title character varying,
    og_description text,
    groom_name character varying,
    bride_name character varying,
    groom_bio text,
    bride_bio text,
    location character varying,
    date timestamp without time zone,
    wedding_description text,
    rsvp boolean,
    template_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    draft boolean DEFAULT true,
    story_title character varying,
    custom_url character varying,
    latitude double precision,
    longitude double precision
);


ALTER TABLE invitations OWNER TO marc;

--
-- Name: invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE invitations_id_seq OWNER TO marc;

--
-- Name: invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE invitations_id_seq OWNED BY invitations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO marc;

--
-- Name: templates; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE templates (
    id integer NOT NULL,
    title character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stylesheet character varying
);


ALTER TABLE templates OWNER TO marc;

--
-- Name: templates_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE templates_id_seq OWNER TO marc;

--
-- Name: templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE templates_id_seq OWNED BY templates.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    provider character varying,
    uid character varying,
    facebook_picture_url character varying,
    first_name character varying,
    last_name character varying,
    token character varying,
    token_expiry timestamp without time zone,
    admin boolean DEFAULT false NOT NULL
);


ALTER TABLE users OWNER TO marc;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO marc;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY attachinary_files ALTER COLUMN id SET DEFAULT nextval('attachinary_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY guests ALTER COLUMN id SET DEFAULT nextval('guests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY invitations ALTER COLUMN id SET DEFAULT nextval('invitations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY templates ALTER COLUMN id SET DEFAULT nextval('templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: marc
--

COPY active_admin_comments (id, namespace, body, resource_id, resource_type, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marc
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: marc
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-03-31 04:43:41.076112	2017-03-31 04:43:41.076112
\.


--
-- Data for Name: attachinary_files; Type: TABLE DATA; Schema: public; Owner: marc
--

COPY attachinary_files (id, attachinariable_type, attachinariable_id, scope, public_id, version, width, height, format, resource_type, created_at, updated_at) FROM stdin;
1	Invitation	1	bride_photo	unmfyseo3bma81i6dlmc	1490936195	800	600	jpg	image	2017-03-31 04:57:05.219925	2017-03-31 04:57:05.219925
2	Invitation	1	groom_photo	lozyxi1ciq8cdywdi4gf	1490936188	800	600	jpg	image	2017-03-31 04:57:06.542617	2017-03-31 04:57:06.542617
3	Invitation	1	gallery	uopol8kkrtvffbs7bvsk	1490936211	800	600	jpg	image	2017-03-31 04:57:12.770297	2017-03-31 04:57:12.770297
4	Invitation	1	gallery	ssfmn8lu2j9mlmeaug3m	1490936216	800	600	jpg	image	2017-03-31 04:57:13.89348	2017-03-31 04:57:13.89348
5	Invitation	1	gallery	frx9eoc8gxdrm7ursxgr	1490936221	800	600	jpg	image	2017-03-31 04:57:21.038157	2017-03-31 04:57:21.038157
6	Invitation	2	bride_photo	ujvsiuy0vtig4hknimaa	1490943887	800	600	jpg	image	2017-03-31 07:04:52.885569	2017-03-31 07:04:52.885569
7	Invitation	2	groom_photo	prmth30zxzkzqtfertgl	1490943881	800	600	jpg	image	2017-03-31 07:04:54.305036	2017-03-31 07:04:54.305036
8	Invitation	2	gallery	rafornc1e7wdmc2oqu27	1490943869	800	600	jpg	image	2017-03-31 07:04:55.531498	2017-03-31 07:04:55.531498
9	Invitation	2	gallery	ceemt0dm2d2ekcpomtnw	1490943875	800	600	jpg	image	2017-03-31 07:05:01.845292	2017-03-31 07:05:01.845292
\.


--
-- Name: attachinary_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marc
--

SELECT pg_catalog.setval('attachinary_files_id_seq', 9, true);


--
-- Data for Name: guests; Type: TABLE DATA; Schema: public; Owner: marc
--

COPY guests (id, full_name, email, phone_number, plus, invitation_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: guests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marc
--

SELECT pg_catalog.setval('guests_id_seq', 1, false);


--
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: marc
--

COPY invitations (id, user_id, og_title, og_description, groom_name, bride_name, groom_bio, bride_bio, location, date, wedding_description, rsvp, template_id, created_at, updated_at, draft, story_title, custom_url, latitude, longitude) FROM stdin;
1	1	Welcome to our wedding ceremony!	We are getting married.	xxxxxxx	xxxxxxx	He is a handsome guy, smart, gentleman and enthusiastic.	She is a beautiful girl, sweet, gentlewomanly, and enthusiastic.	3610 Merrick St, Houston, Texas	2017-03-31 04:55:00	So today we’ve rounded up some of our favorites from the last open wedding vows thread. Here’s to hoping they inspire you to create meaningful marriage vows for yourselves, and not at 2AM.	t	1	2017-03-31 04:55:58.442379	2017-03-31 04:57:28.972584	f	Wedding Day	tester	29.6973933999999993	-95.4318100999999928
2	1	Welcome to our wedding ceremony!	This is the Description	THis is the grooms name	this is the brides name	He is a handsome guy, smart, gentleman and enthusiastic.	She is a beautiful girl, sweet, gentlewomanly, and enthusiastic.	3610 Merrick St, Houston, Texas	2017-03-31 07:03:00	So today we’ve rounded up some of our favorites from the last open wedding vows thread. Here’s to hoping they inspire you to create meaningful marriage vows for yourselves, and not at 2AM.	t	1	2017-03-31 07:03:45.157128	2017-03-31 07:05:24.363819	f	Wedding Day	test	\N	\N
3	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2017-03-31 09:07:51.009348	2017-03-31 09:07:51.009348	t	\N	\N	\N	\N
\.


--
-- Name: invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marc
--

SELECT pg_catalog.setval('invitations_id_seq', 3, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: marc
--

COPY schema_migrations (version) FROM stdin;
20170327102629
20170327104237
20170327104238
20170327104440
20170328044553
20170328070332
20170328070403
20170328101005
20170329045041
20170329045245
20170329050858
20170330044228
20170330044538
\.


--
-- Data for Name: templates; Type: TABLE DATA; Schema: public; Owner: marc
--

COPY templates (id, title, description, created_at, updated_at, stylesheet) FROM stdin;
1	temp1	you are stupid	2017-03-31 04:55:22.48717	2017-03-31 04:55:22.48717	template1
2	temp2	f off\r\n	2017-03-31 04:55:49.883882	2017-03-31 04:55:49.883882	template2
\.


--
-- Name: templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marc
--

SELECT pg_catalog.setval('templates_id_seq', 2, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: marc
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, provider, uid, facebook_picture_url, first_name, last_name, token, token_expiry, admin) FROM stdin;
1	xcx@gmail.com	$2a$11$zyEsQ25A15yDXAMNEmEy0ey2DPqb/U2Y.i3MGmwYiywHrjpFqWZnq	\N	\N	\N	1	2017-03-31 04:45:26.815145	2017-03-31 04:45:26.815145	127.0.0.1	127.0.0.1	2017-03-31 04:45:26.804729	2017-03-31 04:45:26.816835	\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marc
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachinary_files_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY attachinary_files
    ADD CONSTRAINT attachinary_files_pkey PRIMARY KEY (id);


--
-- Name: guests_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY guests
    ADD CONSTRAINT guests_pkey PRIMARY KEY (id);


--
-- Name: invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY invitations
    ADD CONSTRAINT invitations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: templates_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY templates
    ADD CONSTRAINT templates_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: by_scoped_parent; Type: INDEX; Schema: public; Owner: marc
--

CREATE INDEX by_scoped_parent ON attachinary_files USING btree (attachinariable_type, attachinariable_id, scope);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: marc
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: marc
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: marc
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_guests_on_invitation_id; Type: INDEX; Schema: public; Owner: marc
--

CREATE INDEX index_guests_on_invitation_id ON guests USING btree (invitation_id);


--
-- Name: index_invitations_on_template_id; Type: INDEX; Schema: public; Owner: marc
--

CREATE INDEX index_invitations_on_template_id ON invitations USING btree (template_id);


--
-- Name: index_invitations_on_user_id; Type: INDEX; Schema: public; Owner: marc
--

CREATE INDEX index_invitations_on_user_id ON invitations USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: marc
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: marc
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: fk_rails_249a5cb876; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY guests
    ADD CONSTRAINT fk_rails_249a5cb876 FOREIGN KEY (invitation_id) REFERENCES invitations(id);


--
-- Name: fk_rails_7eae413fe6; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY invitations
    ADD CONSTRAINT fk_rails_7eae413fe6 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_fc5c1df235; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY invitations
    ADD CONSTRAINT fk_rails_fc5c1df235 FOREIGN KEY (template_id) REFERENCES templates(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

