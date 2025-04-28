--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12 (Debian 15.12-1.pgdg120+1)
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: directus_access; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE public.directus_access OWNER TO admin;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO admin;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_activity_id_seq OWNER TO admin;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO admin;

--
-- Name: directus_comments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_comments OWNER TO admin;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO admin;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO admin;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO admin;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_fields_id_seq OWNER TO admin;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);


ALTER TABLE public.directus_files OWNER TO admin;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO admin;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO admin;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO admin;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO admin;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_notifications_id_seq OWNER TO admin;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO admin;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO admin;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


ALTER TABLE public.directus_permissions OWNER TO admin;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_permissions_id_seq OWNER TO admin;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_policies OWNER TO admin;

--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO admin;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_presets_id_seq OWNER TO admin;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO admin;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_relations_id_seq OWNER TO admin;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO admin;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_revisions_id_seq OWNER TO admin;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


ALTER TABLE public.directus_roles OWNER TO admin;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE public.directus_sessions OWNER TO admin;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json
);


ALTER TABLE public.directus_settings OWNER TO admin;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_settings_id_seq OWNER TO admin;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO admin;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO admin;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json
);


ALTER TABLE public.directus_users OWNER TO admin;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);


ALTER TABLE public.directus_versions OWNER TO admin;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json,
    was_active_before_deprecation boolean DEFAULT false NOT NULL,
    migrated_flow uuid
);


ALTER TABLE public.directus_webhooks OWNER TO admin;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_webhooks_id_seq OWNER TO admin;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: organization; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.organization (
    id uuid NOT NULL,
    date_created timestamp with time zone,
    name character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.organization OWNER TO admin;

--
-- Name: page_info; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.page_info (
    id uuid NOT NULL,
    favicon uuid,
    email character varying(255),
    contact_phone character varying(255),
    organization_id uuid,
    contact_address character varying(255),
    site_title character varying(255),
    logo_light uuid,
    logo_dark uuid
);


ALTER TABLE public.page_info OWNER TO admin;

--
-- Name: page_metadata; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.page_metadata (
    id uuid NOT NULL,
    meta_key character varying(255),
    meta_value character varying(255),
    page_id integer
);


ALTER TABLE public.page_metadata OWNER TO admin;

--
-- Name: pages; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255),
    slug character varying(255),
    organization_id uuid
);


ALTER TABLE public.pages OWNER TO admin;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_id_seq OWNER TO admin;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
c05b66ca-ba36-4b69-9579-e38578fbabff	1fc079ba-a8ab-4076-a89e-350390bba678	\N	6d2e8cb8-a1d3-4ff0-97ff-0de610613d8e	\N
1eabcd98-edd8-495e-9420-2e14f5d151cd	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
\.


-- --
-- -- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: admin
-- --

-- COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
-- 1	login	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:34:15.63+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_users	b7391416-e158-4593-b532-c9a345546025	http://localhost:8055
-- 2	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:45:16.866+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
-- 3	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:45:16.882+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
-- 4	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:45:16.895+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	organization	http://localhost:8055
-- 5	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:45:34.721+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
-- 6	update	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:45:37.772+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
-- 7	update	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:45:37.797+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
-- 8	update	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:45:37.82+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
-- 9	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:46:32.537+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	4	http://localhost:8055
-- 10	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:46:32.55+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	5	http://localhost:8055
-- 11	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:46:32.563+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	6	http://localhost:8055
-- 12	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:46:32.574+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	7	http://localhost:8055
-- 13	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:46:32.585+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	pages	http://localhost:8055
-- 14	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:46:40.157+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	8	http://localhost:8055
-- 15	update	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:46:48.592+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	8	http://localhost:8055
-- 16	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:46:59.861+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	9	http://localhost:8055
-- 17	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:47:23.697+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	10	http://localhost:8055
-- 18	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:48:11.585+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	11	http://localhost:8055
-- 19	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:48:11.598+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_metadata	http://localhost:8055
-- 20	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:48:19.5+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	12	http://localhost:8055
-- 21	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:48:27.986+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	13	http://localhost:8055
-- 22	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:49:00.501+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	14	http://localhost:8055
-- 23	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:49:00.633+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	15	http://localhost:8055
-- 24	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:49:45.093+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	16	http://localhost:8055
-- 25	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:49:45.105+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_info	http://localhost:8055
-- 26	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:49:54.105+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	17	http://localhost:8055
-- 27	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:50:01.59+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
-- 28	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:50:08.476+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	19	http://localhost:8055
-- 29	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:50:33.962+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	20	http://localhost:8055
-- 30	update	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:50:45.892+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	20	http://localhost:8055
-- 31	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:51:10.646+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	21	http://localhost:8055
-- 32	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:51:19.715+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	22	http://localhost:8055
-- 33	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:51:59.262+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	23	http://localhost:8055
-- 34	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 22:52:13.702+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	24	http://localhost:8055
-- 35	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 23:00:10.814+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_permissions	1	http://localhost:8055
-- 36	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 23:00:10.828+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_permissions	2	http://localhost:8055
-- 37	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 23:00:10.839+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_permissions	3	http://localhost:8055
-- 38	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 23:00:10.85+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_permissions	4	http://localhost:8055
-- 39	update	b7391416-e158-4593-b532-c9a345546025	2025-04-28 23:00:10.861+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
-- 40	update	b7391416-e158-4593-b532-c9a345546025	2025-04-28 23:00:10.881+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_access	1eabcd98-edd8-495e-9420-2e14f5d151cd	http://localhost:8055
-- 41	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 23:00:40.918+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	organization	1235e979-751f-4e58-85b1-b59cce923bba	http://localhost:8055
-- 42	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 23:00:55.631+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	pages	1	http://localhost:8055
-- 43	create	b7391416-e158-4593-b532-c9a345546025	2025-04-28 23:02:29.427+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	page_info	7508e507-a03c-4c0a-a669-db1e47b8e455	http://localhost:8055
-- 44	update	b7391416-e158-4593-b532-c9a345546025	2025-04-28 23:09:02.318+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
-- \.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
organization	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
pages	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
page_metadata	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
page_info	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
\.


--
-- Data for Name: directus_comments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: admin
--

-- COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
-- t	62956f33-7c99-4d5b-ba51-49e81a192838	endpoint-test	local	\N
-- \.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
3	organization	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
2	organization	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
4	pages	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
5	pages	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	2	half	\N	\N	\N	f	\N	\N	\N
6	pages	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
7	pages	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
8	pages	title	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
9	pages	slug	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
10	pages	organization_id	m2o	select-dropdown-m2o	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
11	page_metadata	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
12	page_metadata	meta_key	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
13	page_metadata	meta_value	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
14	page_metadata	page_id	m2o	\N	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
15	pages	page_metadata	o2m	list-o2m	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
16	page_info	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
17	page_info	favicon	file	file-image	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
18	page_info	email	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
19	page_info	contact_phone	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
20	page_info	organization_id	m2o	select-dropdown-m2o	\N	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
21	page_info	contact_address	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
22	page_info	site_title	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
23	page_info	logo_light	file	file-image	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
24	page_info	logo_dark	file	file-image	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
1	organization	id	uuid	input	\N	\N	\N	t	f	1	full	\N	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2025-04-28 21:44:10.592723+00
20201029A	Remove System Relations	2025-04-28 21:44:10.60804+00
20201029B	Remove System Collections	2025-04-28 21:44:10.620249+00
20201029C	Remove System Fields	2025-04-28 21:44:10.635302+00
20201105A	Add Cascade System Relations	2025-04-28 21:44:10.764167+00
20201105B	Change Webhook URL Type	2025-04-28 21:44:10.783603+00
20210225A	Add Relations Sort Field	2025-04-28 21:44:10.797386+00
20210304A	Remove Locked Fields	2025-04-28 21:44:10.806559+00
20210312A	Webhooks Collections Text	2025-04-28 21:44:10.824155+00
20210331A	Add Refresh Interval	2025-04-28 21:44:10.832893+00
20210415A	Make Filesize Nullable	2025-04-28 21:44:10.854466+00
20210416A	Add Collections Accountability	2025-04-28 21:44:10.867102+00
20210422A	Remove Files Interface	2025-04-28 21:44:10.875425+00
20210506A	Rename Interfaces	2025-04-28 21:44:10.975909+00
20210510A	Restructure Relations	2025-04-28 21:44:11.035001+00
20210518A	Add Foreign Key Constraints	2025-04-28 21:44:11.050909+00
20210519A	Add System Fk Triggers	2025-04-28 21:44:11.120598+00
20210521A	Add Collections Icon Color	2025-04-28 21:44:11.130106+00
20210525A	Add Insights	2025-04-28 21:44:11.176925+00
20210608A	Add Deep Clone Config	2025-04-28 21:44:11.186564+00
20210626A	Change Filesize Bigint	2025-04-28 21:44:11.218901+00
20210716A	Add Conditions to Fields	2025-04-28 21:44:11.228359+00
20210721A	Add Default Folder	2025-04-28 21:44:11.242846+00
20210802A	Replace Groups	2025-04-28 21:44:11.255369+00
20210803A	Add Required to Fields	2025-04-28 21:44:11.26419+00
20210805A	Update Groups	2025-04-28 21:44:11.27324+00
20210805B	Change Image Metadata Structure	2025-04-28 21:44:11.283125+00
20210811A	Add Geometry Config	2025-04-28 21:44:11.292009+00
20210831A	Remove Limit Column	2025-04-28 21:44:11.300863+00
20210903A	Add Auth Provider	2025-04-28 21:44:11.346024+00
20210907A	Webhooks Collections Not Null	2025-04-28 21:44:11.368096+00
20210910A	Move Module Setup	2025-04-28 21:44:11.380435+00
20210920A	Webhooks URL Not Null	2025-04-28 21:44:11.402453+00
20210924A	Add Collection Organization	2025-04-28 21:44:11.415285+00
20210927A	Replace Fields Group	2025-04-28 21:44:11.438205+00
20210927B	Replace M2M Interface	2025-04-28 21:44:11.446693+00
20210929A	Rename Login Action	2025-04-28 21:44:11.453514+00
20211007A	Update Presets	2025-04-28 21:44:11.471217+00
20211009A	Add Auth Data	2025-04-28 21:44:11.479906+00
20211016A	Add Webhook Headers	2025-04-28 21:44:11.488907+00
20211103A	Set Unique to User Token	2025-04-28 21:44:11.502901+00
20211103B	Update Special Geometry	2025-04-28 21:44:11.51036+00
20211104A	Remove Collections Listing	2025-04-28 21:44:11.519317+00
20211118A	Add Notifications	2025-04-28 21:44:11.553286+00
20211211A	Add Shares	2025-04-28 21:44:11.600837+00
20211230A	Add Project Descriptor	2025-04-28 21:44:11.610125+00
20220303A	Remove Default Project Color	2025-04-28 21:44:11.63187+00
20220308A	Add Bookmark Icon and Color	2025-04-28 21:44:11.641669+00
20220314A	Add Translation Strings	2025-04-28 21:44:11.650501+00
20220322A	Rename Field Typecast Flags	2025-04-28 21:44:11.660162+00
20220323A	Add Field Validation	2025-04-28 21:44:11.668974+00
20220325A	Fix Typecast Flags	2025-04-28 21:44:11.679499+00
20220325B	Add Default Language	2025-04-28 21:44:11.704542+00
20220402A	Remove Default Value Panel Icon	2025-04-28 21:44:11.725156+00
20220429A	Add Flows	2025-04-28 21:44:11.807923+00
20220429B	Add Color to Insights Icon	2025-04-28 21:44:11.81801+00
20220429C	Drop Non Null From IP of Activity	2025-04-28 21:44:11.827442+00
20220429D	Drop Non Null From Sender of Notifications	2025-04-28 21:44:11.836398+00
20220614A	Rename Hook Trigger to Event	2025-04-28 21:44:11.843785+00
20220801A	Update Notifications Timestamp Column	2025-04-28 21:44:11.865331+00
20220802A	Add Custom Aspect Ratios	2025-04-28 21:44:11.874296+00
20220826A	Add Origin to Accountability	2025-04-28 21:44:11.885955+00
20230401A	Update Material Icons	2025-04-28 21:44:11.909781+00
20230525A	Add Preview Settings	2025-04-28 21:44:11.918802+00
20230526A	Migrate Translation Strings	2025-04-28 21:44:11.944176+00
20230721A	Require Shares Fields	2025-04-28 21:44:11.958865+00
20230823A	Add Content Versioning	2025-04-28 21:44:12.005098+00
20230927A	Themes	2025-04-28 21:44:12.059198+00
20231009A	Update CSV Fields to Text	2025-04-28 21:44:12.070388+00
20231009B	Update Panel Options	2025-04-28 21:44:12.077753+00
20231010A	Add Extensions	2025-04-28 21:44:12.092037+00
20231215A	Add Focalpoints	2025-04-28 21:44:12.100899+00
20240122A	Add Report URL Fields	2025-04-28 21:44:12.109688+00
20240204A	Marketplace	2025-04-28 21:44:12.190182+00
20240305A	Change Useragent Type	2025-04-28 21:44:12.218099+00
20240311A	Deprecate Webhooks	2025-04-28 21:44:12.244519+00
20240422A	Public Registration	2025-04-28 21:44:12.257791+00
20240515A	Add Session Window	2025-04-28 21:44:12.266844+00
20240701A	Add Tus Data	2025-04-28 21:44:12.275674+00
20240716A	Update Files Date Fields	2025-04-28 21:44:12.292938+00
20240806A	Permissions Policies	2025-04-28 21:44:12.41164+00
20240817A	Update Icon Fields Length	2025-04-28 21:44:12.508646+00
20240909A	Separate Comments	2025-04-28 21:44:12.538116+00
20240909B	Consolidate Content Versioning	2025-04-28 21:44:12.547361+00
20240924A	Migrate Legacy Comments	2025-04-28 21:44:12.563569+00
20240924B	Populate Versioning Deltas	2025-04-28 21:44:12.572681+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
1	organization	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
2	page_info	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
3	page_metadata	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
4	pages	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
6d2e8cb8-a1d3-4ff0-97ff-0de610613d8e	Administrator	verified	$t:admin_description	\N	f	t	t
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	pages	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
2	pages	organization_id	organization	\N	\N	\N	\N	\N	nullify
3	page_metadata	page_id	pages	page_metadata	\N	\N	\N	\N	nullify
4	page_info	favicon	directus_files	\N	\N	\N	\N	\N	nullify
5	page_info	organization_id	organization	\N	\N	\N	\N	\N	nullify
6	page_info	logo_light	directus_files	\N	\N	\N	\N	\N	nullify
7	page_info	logo_dark	directus_files	\N	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: admin
--

-- COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
-- 1	2	directus_fields	1	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"organization"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"organization"}	\N	\N
-- 2	3	directus_fields	2	{"sort":2,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"organization"}	{"sort":2,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"organization"}	\N	\N
-- 3	4	directus_collections	organization	{"singleton":false,"collection":"organization"}	{"singleton":false,"collection":"organization"}	\N	\N
-- 4	5	directus_fields	3	{"sort":3,"interface":"input","special":null,"required":true,"collection":"organization","field":"name"}	{"sort":3,"interface":"input","special":null,"required":true,"collection":"organization","field":"name"}	\N	\N
-- 5	6	directus_fields	1	{"id":1,"collection":"organization","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"organization","field":"id","sort":1,"group":null}	\N	\N
-- 6	7	directus_fields	3	{"id":3,"collection":"organization","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"organization","field":"name","sort":2,"group":null}	\N	\N
-- 7	8	directus_fields	2	{"id":2,"collection":"organization","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"organization","field":"date_created","sort":3,"group":null}	\N	\N
-- 8	9	directus_fields	4	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"pages"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"pages"}	\N	\N
-- 9	10	directus_fields	5	{"sort":2,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"pages"}	{"sort":2,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"pages"}	\N	\N
-- 10	11	directus_fields	6	{"sort":3,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"pages"}	{"sort":3,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"pages"}	\N	\N
-- 11	12	directus_fields	7	{"sort":4,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"pages"}	{"sort":4,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"pages"}	\N	\N
-- 12	13	directus_collections	pages	{"singleton":false,"collection":"pages"}	{"singleton":false,"collection":"pages"}	\N	\N
-- 13	14	directus_fields	8	{"sort":5,"interface":"input","special":null,"collection":"pages","field":"title"}	{"sort":5,"interface":"input","special":null,"collection":"pages","field":"title"}	\N	\N
-- 14	15	directus_fields	8	{"id":8,"collection":"pages","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"title","required":true}	\N	\N
-- 15	16	directus_fields	9	{"sort":6,"interface":"input","special":null,"required":true,"collection":"pages","field":"slug"}	{"sort":6,"interface":"input","special":null,"required":true,"collection":"pages","field":"slug"}	\N	\N
-- 16	17	directus_fields	10	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"collection":"pages","field":"organization_id"}	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"collection":"pages","field":"organization_id"}	\N	\N
-- 17	18	directus_fields	11	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"page_metadata"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"page_metadata"}	\N	\N
-- 18	19	directus_collections	page_metadata	{"singleton":false,"collection":"page_metadata"}	{"singleton":false,"collection":"page_metadata"}	\N	\N
-- 19	20	directus_fields	12	{"sort":2,"interface":"input","special":null,"required":true,"collection":"page_metadata","field":"meta_key"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"page_metadata","field":"meta_key"}	\N	\N
-- 20	21	directus_fields	13	{"sort":3,"interface":"input","special":null,"required":true,"collection":"page_metadata","field":"meta_value"}	{"sort":3,"interface":"input","special":null,"required":true,"collection":"page_metadata","field":"meta_value"}	\N	\N
-- 21	22	directus_fields	14	{"sort":4,"special":["m2o"],"required":true,"collection":"page_metadata","field":"page_id"}	{"sort":4,"special":["m2o"],"required":true,"collection":"page_metadata","field":"page_id"}	\N	\N
-- 22	23	directus_fields	15	{"sort":8,"special":["o2m"],"interface":"list-o2m","collection":"pages","field":"page_metadata"}	{"sort":8,"special":["o2m"],"interface":"list-o2m","collection":"pages","field":"page_metadata"}	\N	\N
-- 23	24	directus_fields	16	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"page_info"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"page_info"}	\N	\N
-- 24	25	directus_collections	page_info	{"singleton":false,"collection":"page_info"}	{"singleton":false,"collection":"page_info"}	\N	\N
-- 25	26	directus_fields	17	{"sort":2,"interface":"file-image","special":["file"],"collection":"page_info","field":"favicon"}	{"sort":2,"interface":"file-image","special":["file"],"collection":"page_info","field":"favicon"}	\N	\N
-- 26	27	directus_fields	18	{"sort":3,"interface":"input","special":null,"collection":"page_info","field":"email"}	{"sort":3,"interface":"input","special":null,"collection":"page_info","field":"email"}	\N	\N
-- 27	28	directus_fields	19	{"sort":4,"interface":"input","special":null,"collection":"page_info","field":"contact_phone"}	{"sort":4,"interface":"input","special":null,"collection":"page_info","field":"contact_phone"}	\N	\N
-- 28	29	directus_fields	20	{"sort":5,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"page_info","field":"organization_id"}	{"sort":5,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"page_info","field":"organization_id"}	\N	\N
-- 29	30	directus_fields	20	{"id":20,"collection":"page_info","field":"organization_id","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"page_info","field":"organization_id","required":true}	\N	\N
-- 30	31	directus_fields	21	{"sort":6,"interface":"input","special":null,"collection":"page_info","field":"contact_address"}	{"sort":6,"interface":"input","special":null,"collection":"page_info","field":"contact_address"}	\N	\N
-- 31	32	directus_fields	22	{"sort":7,"interface":"input","special":null,"collection":"page_info","field":"site_title"}	{"sort":7,"interface":"input","special":null,"collection":"page_info","field":"site_title"}	\N	\N
-- 32	33	directus_fields	23	{"sort":8,"interface":"file-image","special":["file"],"collection":"page_info","field":"logo_light"}	{"sort":8,"interface":"file-image","special":["file"],"collection":"page_info","field":"logo_light"}	\N	\N
-- 33	34	directus_fields	24	{"sort":9,"interface":"file-image","special":["file"],"collection":"page_info","field":"logo_dark"}	{"sort":9,"interface":"file-image","special":["file"],"collection":"page_info","field":"logo_dark"}	\N	\N
-- 34	35	directus_permissions	1	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"organization","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"organization","action":"read"}	\N	\N
-- 35	36	directus_permissions	2	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"page_info","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"page_info","action":"read"}	\N	\N
-- 36	37	directus_permissions	3	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"page_metadata","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"page_metadata","action":"read"}	\N	\N
-- 37	38	directus_permissions	4	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"pages","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"pages","action":"read"}	\N	\N
-- 38	40	directus_access	1eabcd98-edd8-495e-9420-2e14f5d151cd	{"id":"1eabcd98-edd8-495e-9420-2e14f5d151cd","role":null,"user":null,"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","sort":1}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
-- 39	41	organization	1235e979-751f-4e58-85b1-b59cce923bba	{"name":"Space Studio"}	{"name":"Space Studio"}	\N	\N
-- 40	42	pages	1	{"title":"Index","slug":"index","organization_id":"1235e979-751f-4e58-85b1-b59cce923bba"}	{"title":"Index","slug":"index","organization_id":"1235e979-751f-4e58-85b1-b59cce923bba"}	\N	\N
-- 41	43	page_info	7508e507-a03c-4c0a-a669-db1e47b8e455	{"organization_id":"1235e979-751f-4e58-85b1-b59cce923bba","email":"correo@correo.com","contact_phone":"999999999","site_title":"Space Studio","contact_address":"Av. avenidosa"}	{"organization_id":"1235e979-751f-4e58-85b1-b59cce923bba","email":"correo@correo.com","contact_phone":"999999999","site_title":"Space Studio","contact_address":"Av. avenidosa"}	\N	\N
-- 42	44	directus_fields	1	{"id":1,"collection":"organization","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"organization","field":"id","hidden":false}	\N	\N
-- \.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
1fc079ba-a8ab-4076-a89e-350390bba678	Administrator	verified	$t:admin_description	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: admin
--

-- COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
-- BIG5pir5hd8x-M2tFpnBC009GvSTrpkp2gWozw6d3ujH52f2Jp1kh_CCc_8WZZIP	b7391416-e158-4593-b532-c9a345546025	2025-05-05 22:34:15.611+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
-- \.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter) FROM stdin;
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
b7391416-e158-4593-b532-c9a345546025	Admin	User	admin@example.com	$argon2id$v=19$m=65536,t=3,p=4$OgOfq8wz0VaRPAUwSHg5jQ$66ar19jjSM8rQ73yGQU1PV4PZqCJavc6QkPORp6iNwM	\N	\N	\N	\N	\N	\N	\N	active	1fc079ba-a8ab-4076-a89e-350390bba678	\N	2025-04-28 22:34:15.642+00	/content/organization/1235e979-751f-4e58-85b1-b59cce923bba	default	\N	\N	t	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
\.


--
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.organization (id, date_created, name) FROM stdin;
1235e979-751f-4e58-85b1-b59cce923bba	2025-04-28 23:00:40.915+00	Space Studio
\.


--
-- Data for Name: page_info; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.page_info (id, favicon, email, contact_phone, organization_id, contact_address, site_title, logo_light, logo_dark) FROM stdin;
7508e507-a03c-4c0a-a669-db1e47b8e455	\N	correo@correo.com	999999999	1235e979-751f-4e58-85b1-b59cce923bba	Av. avenidosa	Space Studio	\N	\N
\.


--
-- Data for Name: page_metadata; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.page_metadata (id, meta_key, meta_value, page_id) FROM stdin;
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.pages (id, date_created, user_updated, date_updated, title, slug, organization_id) FROM stdin;
1	2025-04-28 23:00:55.595+00	\N	\N	Index	index	1235e979-751f-4e58-85b1-b59cce923bba
\.


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 44, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 24, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 4, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 1, false);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 7, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 42, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, true);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_comments directus_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (id);


--
-- Name: page_info page_info_organization_id_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.page_info
    ADD CONSTRAINT page_info_organization_id_unique UNIQUE (organization_id);


--
-- Name: page_info page_info_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.page_info
    ADD CONSTRAINT page_info_pkey PRIMARY KEY (id);


--
-- Name: page_metadata page_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.page_metadata
    ADD CONSTRAINT page_metadata_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_comments directus_comments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_comments directus_comments_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_webhooks directus_webhooks_migrated_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES public.directus_flows(id) ON DELETE SET NULL;


--
-- Name: page_info page_info_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.page_info
    ADD CONSTRAINT page_info_favicon_foreign FOREIGN KEY (favicon) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: page_info page_info_logo_dark_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.page_info
    ADD CONSTRAINT page_info_logo_dark_foreign FOREIGN KEY (logo_dark) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: page_info page_info_logo_light_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.page_info
    ADD CONSTRAINT page_info_logo_light_foreign FOREIGN KEY (logo_light) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: page_info page_info_organization_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.page_info
    ADD CONSTRAINT page_info_organization_id_foreign FOREIGN KEY (organization_id) REFERENCES public.organization(id) ON DELETE SET NULL;


--
-- Name: page_metadata page_metadata_page_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.page_metadata
    ADD CONSTRAINT page_metadata_page_id_foreign FOREIGN KEY (page_id) REFERENCES public.pages(id) ON DELETE SET NULL;


--
-- Name: pages pages_organization_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_organization_id_foreign FOREIGN KEY (organization_id) REFERENCES public.organization(id) ON DELETE SET NULL;


--
-- Name: pages pages_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- PostgreSQL database dump complete
--

