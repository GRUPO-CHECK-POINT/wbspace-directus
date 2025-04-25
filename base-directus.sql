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
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Organization; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Organization" (
    id uuid NOT NULL,
    date_created timestamp with time zone,
    name character varying(255)
);


ALTER TABLE public."Organization" OWNER TO admin;

--
-- Name: Pages; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Pages" (
    id uuid NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    title character varying(255),
    slug character varying(255),
    organization_id uuid
);


ALTER TABLE public."Pages" OWNER TO admin;

--
-- Name: Pages_blocks; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Pages_blocks" (
    id integer NOT NULL,
    "Pages_id" uuid,
    item character varying(255),
    collection character varying(255)
);


ALTER TABLE public."Pages_blocks" OWNER TO admin;

--
-- Name: Pages_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Pages_blocks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Pages_blocks_id_seq" OWNER TO admin;

--
-- Name: Pages_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Pages_blocks_id_seq" OWNED BY public."Pages_blocks".id;


--
-- Name: card_group_widget; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.card_group_widget (
    id uuid NOT NULL,
    headline text,
    content text
);


ALTER TABLE public.card_group_widget OWNER TO admin;

--
-- Name: cardgroup_cards; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cardgroup_cards (
    id uuid NOT NULL,
    headline character varying(255),
    link character varying(255),
    card_style character varying(255) DEFAULT 'none'::character varying,
    content text,
    image uuid,
    cardgroup_widget uuid
);


ALTER TABLE public.cardgroup_cards OWNER TO admin;

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
-- Name: hero_widget; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.hero_widget (
    id uuid NOT NULL,
    headline character varying(255),
    content text,
    buttons json,
    image uuid,
    background_color character varying(255) DEFAULT 'none'::character varying,
    display_orientation character varying(255)
);


ALTER TABLE public.hero_widget OWNER TO admin;

--
-- Name: navigation_items; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.navigation_items (
    id uuid NOT NULL,
    sort integer,
    text character varying(255),
    slug character varying(255),
    highlighted boolean DEFAULT false
);


ALTER TABLE public.navigation_items OWNER TO admin;

--
-- Name: page_info; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.page_info (
    id integer NOT NULL,
    favicon uuid,
    email character varying(255),
    contact_phone character varying(255),
    organization_id uuid,
    contact_adress character varying(255),
    site_title character varying(255),
    logo_light uuid,
    logo_dark uuid
);


ALTER TABLE public.page_info OWNER TO admin;

--
-- Name: page_info_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.page_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.page_info_id_seq OWNER TO admin;

--
-- Name: page_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.page_info_id_seq OWNED BY public.page_info.id;


--
-- Name: page_metadata; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.page_metadata (
    id integer NOT NULL,
    meta_key character varying(255),
    meta_value character varying(255),
    page_id uuid
);


ALTER TABLE public.page_metadata OWNER TO admin;

--
-- Name: page_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.page_metadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.page_metadata_id_seq OWNER TO admin;

--
-- Name: page_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.page_metadata_id_seq OWNED BY public.page_metadata.id;


--
-- Name: Pages_blocks id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Pages_blocks" ALTER COLUMN id SET DEFAULT nextval('public."Pages_blocks_id_seq"'::regclass);


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
-- Name: page_info id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.page_info ALTER COLUMN id SET DEFAULT nextval('public.page_info_id_seq'::regclass);


--
-- Name: page_metadata id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.page_metadata ALTER COLUMN id SET DEFAULT nextval('public.page_metadata_id_seq'::regclass);


--
-- Data for Name: Organization; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Organization" (id, date_created, name) FROM stdin;
d1df35e3-b2da-4780-bdf7-45e5fb383ae5	2025-04-25 16:30:37.539+00	Space Studio
\.


--
-- Data for Name: Pages; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Pages" (id, user_created, date_created, date_updated, title, slug, organization_id) FROM stdin;
bead27a0-859d-45bd-bac7-f0c74b8e39d8	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:35:38.019+00	\N	Example Page	index	d1df35e3-b2da-4780-bdf7-45e5fb383ae5
\.


--
-- Data for Name: Pages_blocks; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Pages_blocks" (id, "Pages_id", item, collection) FROM stdin;
1	bead27a0-859d-45bd-bac7-f0c74b8e39d8	4cda05aa-34ca-4554-8664-2bea7f0f1182	hero_widget
\.


--
-- Data for Name: card_group_widget; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.card_group_widget (id, headline, content) FROM stdin;
\.


--
-- Data for Name: cardgroup_cards; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cardgroup_cards (id, headline, link, card_style, content, image, cardgroup_widget) FROM stdin;
\.


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
b146ae4f-c600-4d6f-9e44-06ca53908f7c	3114f504-2306-495b-9948-3ef8dc55cc2b	\N	cae9b6c2-bf70-43d2-a1ba-2ece3ee0bb55	\N
9d1d34eb-21fd-491e-93b3-373dcf1edf0e	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
1	login	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:24:46.795+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_users	6d7e99a3-efa7-4a30-b10c-78bc39674473	http://localhost:8055
2	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:26:18.946+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
3	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:26:18.954+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
4	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:26:18.96+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Organization	http://localhost:8055
5	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:26:41.951+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
6	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:26:43.978+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
7	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:26:43.99+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
8	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:26:44.002+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
9	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:28:18.213+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	4	http://localhost:8055
10	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:28:18.218+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	5	http://localhost:8055
11	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:28:18.224+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	6	http://localhost:8055
12	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:28:18.23+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	7	http://localhost:8055
13	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:28:18.235+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages	http://localhost:8055
14	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:28:51.988+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	8	http://localhost:8055
15	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:29:26.414+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	9	http://localhost:8055
16	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:30:53.587+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	10	http://localhost:8055
17	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:30:53.593+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	hero_widget	http://localhost:8055
18	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:31:20.185+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	11	http://localhost:8055
19	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:31:54.861+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	12	http://localhost:8055
20	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:37:51.952+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	13	http://localhost:8055
21	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:38:10.15+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	14	http://localhost:8055
22	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:41:16.834+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	15	http://localhost:8055
23	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:43:03.331+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	16	http://localhost:8055
24	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:12.974+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	17	http://localhost:8055
25	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:13.077+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
26	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:13.082+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_block	http://localhost:8055
27	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:13.132+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	19	http://localhost:8055
28	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:13.209+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	20	http://localhost:8055
29	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:13.289+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	21	http://localhost:8055
30	delete	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:18.774+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	17	http://localhost:8055
31	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:37.55+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	22	http://localhost:8055
32	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:37.649+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	23	http://localhost:8055
33	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:37.654+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_blocks	http://localhost:8055
34	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:37.703+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	24	http://localhost:8055
35	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:37.781+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	25	http://localhost:8055
36	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:44:37.866+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	26	http://localhost:8055
37	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:15.102+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
38	delete	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:25.374+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_block	http://localhost:8055
39	delete	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:25.379+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
40	delete	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:25.382+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	19	http://localhost:8055
41	delete	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:25.384+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	20	http://localhost:8055
42	delete	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:25.385+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	21	http://localhost:8055
54	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:44.504+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Organization	http://localhost:8055
55	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:44.516+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages	http://localhost:8055
56	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:44.524+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_blocks	http://localhost:8055
43	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:30.786+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Organization	http://localhost:8055
44	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:30.794+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages	http://localhost:8055
45	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:30.801+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	hero_widget	http://localhost:8055
46	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:30.808+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_blocks	http://localhost:8055
47	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:37.697+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Widgets	http://localhost:8055
48	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:43.113+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Widgets	http://localhost:8055
49	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:43.204+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Organization	http://localhost:8055
50	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:43.211+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages	http://localhost:8055
51	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:43.218+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	hero_widget	http://localhost:8055
52	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:43.224+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_blocks	http://localhost:8055
53	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:44.503+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	hero_widget	http://localhost:8055
57	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:50.253+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Widgets	http://localhost:8055
58	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:50.263+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	hero_widget	http://localhost:8055
59	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:53.51+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	hero_widget	http://localhost:8055
60	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:53.523+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Organization	http://localhost:8055
61	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:53.53+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages	http://localhost:8055
62	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:53.539+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Widgets	http://localhost:8055
63	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:45:53.549+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_blocks	http://localhost:8055
64	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:46:00.203+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	hero_widget	http://localhost:8055
65	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:49:42.394+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
66	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:49:42.4+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_metadata	http://localhost:8055
67	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:51:47.826+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
68	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:52:11.257+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
69	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:53:25.955+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
70	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:53:38.316+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Organization	http://localhost:8055
71	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:53:38.323+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages	http://localhost:8055
72	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:53:38.333+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_metadata	http://localhost:8055
73	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:53:38.34+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Widgets	http://localhost:8055
74	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:53:38.347+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_blocks	http://localhost:8055
75	delete	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:54:30.676+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
76	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:55:16.963+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
77	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:55:17.043+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
78	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:55:36.539+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	4	http://localhost:8055
79	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:55:36.55+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	5	http://localhost:8055
80	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:55:36.558+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	6	http://localhost:8055
81	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:55:36.567+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	7	http://localhost:8055
82	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:55:36.575+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	8	http://localhost:8055
83	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:55:36.584+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	9	http://localhost:8055
84	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:55:36.592+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	22	http://localhost:8055
85	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:55:36.602+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
86	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 15:55:36.61+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
87	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:21:50.253+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_permissions	1	http://localhost:8055
88	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:21:50.269+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_permissions	2	http://localhost:8055
89	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:21:50.275+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_permissions	3	http://localhost:8055
90	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:21:50.281+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_permissions	4	http://localhost:8055
91	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:21:50.285+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_permissions	5	http://localhost:8055
92	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:21:50.291+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_permissions	6	http://localhost:8055
93	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:21:50.296+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
94	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:21:50.305+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_access	9d1d34eb-21fd-491e-93b3-373dcf1edf0e	http://localhost:8055
95	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:30:37.542+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	Organization	d1df35e3-b2da-4780-bdf7-45e5fb383ae5	http://localhost:8055
96	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:30:48.213+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
97	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:35:30.39+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_files	f112d310-f655-499d-a04a-6caad323d899	http://localhost:8055
98	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:35:38.023+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	hero_widget	4cda05aa-34ca-4554-8664-2bea7f0f1182	http://localhost:8055
99	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:35:38.029+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	Pages_blocks	1	http://localhost:8055
100	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:35:38.035+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	Pages	bead27a0-859d-45bd-bac7-f0c74b8e39d8	http://localhost:8055
101	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:44:54.686+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
102	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:44:54.697+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_info	http://localhost:8055
103	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:48:30.813+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
104	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:48:43.33+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
105	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:49:07.178+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	37	http://localhost:8055
106	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:49:58.799+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
107	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:51:15.865+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
108	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:51:28.725+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
109	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:51:54.219+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
110	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:52:05.158+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	42	http://localhost:8055
111	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:52:44.386+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	page_info	1	http://localhost:8055
112	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:53:00.378+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_permissions	7	http://localhost:8055
113	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:53:00.386+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
114	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:53:00.395+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_access	9d1d34eb-21fd-491e-93b3-373dcf1edf0e	http://localhost:8055
115	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 17:14:11.307+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	hero_widget	4cda05aa-34ca-4554-8664-2bea7f0f1182	http://localhost:8055
116	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 17:14:49.941+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	hero_widget	4cda05aa-34ca-4554-8664-2bea7f0f1182	http://localhost:8055
117	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:50:30.639+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_info	http://localhost:8055
118	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:50:30.706+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Organization	http://localhost:8055
119	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:50:30.713+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages	http://localhost:8055
120	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:50:30.719+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_metadata	http://localhost:8055
121	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:50:30.725+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Widgets	http://localhost:8055
122	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:50:30.733+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_blocks	http://localhost:8055
123	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:50:36.845+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Organization	http://localhost:8055
124	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:50:36.854+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages	http://localhost:8055
125	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:50:36.86+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_metadata	http://localhost:8055
126	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:50:36.867+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_info	http://localhost:8055
127	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:50:36.873+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Widgets	http://localhost:8055
128	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:50:36.878+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_blocks	http://localhost:8055
129	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:51:06.299+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	43	http://localhost:8055
130	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:51:06.305+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	card_group_widget	http://localhost:8055
131	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:57:20.592+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	44	http://localhost:8055
132	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:57:29.099+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
133	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:59:43.462+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	46	http://localhost:8055
134	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:59:43.467+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	cardgroup_cards	http://localhost:8055
135	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:03:39.035+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	47	http://localhost:8055
136	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:03:54.027+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	48	http://localhost:8055
137	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:06:34.031+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	49	http://localhost:8055
138	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:06:49.633+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	49	http://localhost:8055
139	delete	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:07:22.622+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	49	http://localhost:8055
140	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:09:39.064+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	50	http://localhost:8055
141	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:09:53.722+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	51	http://localhost:8055
142	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:10:04.017+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	52	http://localhost:8055
143	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:11:28.007+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	53	http://localhost:8055
144	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:11:28.109+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	54	http://localhost:8055
147	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:14.344+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	55	http://localhost:8055
148	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:14.435+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	56	http://localhost:8055
149	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:28.889+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	hero_widget	http://localhost:8055
150	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:28.897+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	card_group_widget	http://localhost:8055
151	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:28.944+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Organization	http://localhost:8055
152	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:28.951+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages	http://localhost:8055
153	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:28.96+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_metadata	http://localhost:8055
154	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:28.966+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_info	http://localhost:8055
155	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:28.971+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Widgets	http://localhost:8055
156	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:28.976+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_blocks	http://localhost:8055
157	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:28.983+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	cardgroup_cards	http://localhost:8055
158	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:43.454+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	hero_widget	http://localhost:8055
160	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:43.468+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	card_group_widget	http://localhost:8055
162	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:43.479+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	cardgroup_cards	http://localhost:8055
171	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:18:42.575+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	58	http://localhost:8055
172	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:18:42.581+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	59	http://localhost:8055
173	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:18:42.585+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	navigation_items	http://localhost:8055
145	delete	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:11:47.523+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	54	http://localhost:8055
146	delete	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:12:41.625+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	53	http://localhost:8055
159	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:43.461+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Organization	http://localhost:8055
161	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:43.474+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages	http://localhost:8055
163	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:43.485+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_metadata	http://localhost:8055
164	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:43.496+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_info	http://localhost:8055
165	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:43.506+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Widgets	http://localhost:8055
166	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:13:43.522+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_blocks	http://localhost:8055
167	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:14:33.778+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	57	http://localhost:8055
168	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:14:33.783+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	navigation_items	http://localhost:8055
169	delete	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:18:27.23+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	navigation_items	http://localhost:8055
170	delete	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:18:27.235+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	57	http://localhost:8055
174	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:18:58.327+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	60	http://localhost:8055
175	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:19:17.097+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	61	http://localhost:8055
176	create	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:21:45.954+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_fields	62	http://localhost:8055
177	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:21:57.791+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	hero_widget	http://localhost:8055
178	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:21:57.8+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	card_group_widget	http://localhost:8055
179	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:21:57.806+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	cardgroup_cards	http://localhost:8055
180	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:21:57.814+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	navigation_items	http://localhost:8055
181	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:21:57.866+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Organization	http://localhost:8055
182	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:21:57.873+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages	http://localhost:8055
183	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:21:57.88+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_metadata	http://localhost:8055
184	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:21:57.887+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	page_info	http://localhost:8055
185	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:21:57.894+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Widgets	http://localhost:8055
186	update	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 20:21:57.902+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	directus_collections	Pages_blocks	http://localhost:8055
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
hero_widget	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	Widgets	open	\N	f
card_group_widget	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	2	Widgets	open	\N	f
cardgroup_cards	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	3	Widgets	open	\N	f
navigation_items	\N	\N	\N	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	4	Widgets	open	\N	f
Organization	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	\N	open	\N	f
Pages	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	2	\N	open	\N	f
page_metadata	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	3	\N	open	\N	f
page_info	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	4	\N	open	\N	f
Widgets	folder	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	5	\N	open	\N	f
Pages_blocks	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	6	\N	open	\N	f
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

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
46	cardgroup_cards	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
3	Organization	name	\N	input	{"placeholder":"Organization Name"}	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
2	Organization	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
10	hero_widget	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
11	hero_widget	headline	\N	input	{"placeholder":"Hero headline"}	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
12	hero_widget	content	\N	input-rich-text-html	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
13	hero_widget	buttons	cast-json	list	{"fields":[{"field":"label","name":"label","type":"string","meta":{"field":"label","type":"string","interface":"input","options":{"placeholder":"Button label"}}},{"field":"href","name":"href","type":"string","meta":{"field":"href","type":"string","interface":"input","options":{"placeholder":"Button link"}}},{"field":"button_color","name":"button_color","type":"string","meta":{"field":"button_color","type":"string","interface":"select-radio","options":{"choices":[{"text":"Base","value":"base"},{"text":"Primary","value":"primary"},{"text":"Secondary","value":"secondary"},{"text":"Accent","value":"accent"},{"text":"Neutral","value":"neutral"},{"text":"Info","value":"info"},{"text":"Success","value":"success"},{"text":"Warning","value":"warning"},{"text":"Error","value":"error"}]}}},{"field":"button_style","name":"button_style","type":"string","meta":{"field":"button_style","type":"string","interface":"select-radio","options":{"choices":[{"text":"Default","value":" "},{"text":"Outline","value":"outline"},{"text":"Dash","value":"dash"},{"text":"Soft","value":"soft"},{"text":"Ghost ","value":"ghost"},{"text":"Link","value":"link"}]}}}]}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
14	hero_widget	image	file	file-image	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
15	hero_widget	background_color	\N	select-radio	{"choices":[{"text":"None","value":"none"},{"text":"Base-100","value":"base-100"},{"text":"Base-200","value":"base-200"},{"text":"Base-300","value":"base-300"},{"text":"Primary","value":"primary"},{"text":"Secondary","value":"secondary"},{"text":"Accent","value":"accent"},{"text":"Neutral","value":"neutral"},{"text":"Info","value":"info"},{"text":"Success","value":"success"},{"text":"Warning","value":"warning"},{"text":"Error","value":"error"}]}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
16	hero_widget	display_orientation	\N	select-radio	{"choices":[{"text":"Normal","value":"normal"},{"text":"Reverse","value":"reverse"}]}	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
23	Pages_blocks	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
24	Pages_blocks	Pages_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
25	Pages_blocks	item	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
26	Pages_blocks	collection	\N	\N	\N	\N	\N	f	t	4	full	\N	\N	\N	f	\N	\N	\N
28	page_metadata	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
29	page_metadata	meta_key	\N	input	{"placeholder":"Metatag Key"}	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
30	page_metadata	meta_value	\N	input	{"placeholder":"Metatag Value"}	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
32	page_metadata	page_id	m2o	\N	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
4	Pages	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
5	Pages	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	2	half	\N	\N	\N	f	\N	\N	\N
6	Pages	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
7	Pages	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
8	Pages	title	\N	input	{"placeholder":"Web Page Title"}	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
9	Pages	slug	\N	input	{"placeholder":"Page Slug"}	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
22	Pages	blocks	m2a	list-m2a	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
33	Pages	page_metadata	o2m	list-o2m	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
27	Pages	organization_id	m2o	select-dropdown-m2o	\N	\N	\N	f	f	9	full	\N	\N	\N	t	\N	\N	\N
1	Organization	id	uuid	input	\N	\N	\N	t	f	1	full	\N	\N	\N	f	\N	\N	\N
34	page_info	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
35	page_info	favicon	file	file-image	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
36	page_info	email	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
37	page_info	contact_phone	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
38	page_info	organization_id	m2o	select-dropdown-m2o	\N	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
39	page_info	contact_adress	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
40	page_info	site_title	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
41	page_info	logo_light	file	file-image	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
42	page_info	logo_dark	file	file-image	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
43	card_group_widget	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
44	card_group_widget	headline	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
45	card_group_widget	content	\N	input-multiline	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
47	cardgroup_cards	headline	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
48	cardgroup_cards	link	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
50	cardgroup_cards	card_style	\N	select-radio	{"choices":[{"text":"None","value":"none"},{"text":"Style 1 ","value":"1"},{"text":"Style 2","value":"2"},{"text":"Style 3","value":"3"},{"text":"Style 4","value":"4"},{"text":"Style 5","value":"5"}]}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
51	cardgroup_cards	content	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
52	cardgroup_cards	image	file	file-image	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
55	cardgroup_cards	cardgroup_widget	m2o	select-dropdown-m2o	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
56	card_group_widget	cardgroup_cards	o2m	list-o2m	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
58	navigation_items	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
59	navigation_items	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
60	navigation_items	text	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
61	navigation_items	slug	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
62	navigation_items	highlighted	cast-boolean	boolean	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
f112d310-f655-499d-a04a-6caad323d899	local	f112d310-f655-499d-a04a-6caad323d899.png	1745549897659.png	1745549897659	image/png	\N	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 16:35:30.387+00	\N	2025-04-25 16:35:30.426+00	\N	122086	500	500	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-04-25 16:35:30.425+00
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
20201028A	Remove Collection Foreign Keys	2025-04-25 15:22:50.438513+00
20201029A	Remove System Relations	2025-04-25 15:22:50.448392+00
20201029B	Remove System Collections	2025-04-25 15:22:50.460551+00
20201029C	Remove System Fields	2025-04-25 15:22:50.474882+00
20201105A	Add Cascade System Relations	2025-04-25 15:22:50.547757+00
20201105B	Change Webhook URL Type	2025-04-25 15:22:50.560488+00
20210225A	Add Relations Sort Field	2025-04-25 15:22:50.569291+00
20210304A	Remove Locked Fields	2025-04-25 15:22:50.575703+00
20210312A	Webhooks Collections Text	2025-04-25 15:22:50.586586+00
20210331A	Add Refresh Interval	2025-04-25 15:22:50.592182+00
20210415A	Make Filesize Nullable	2025-04-25 15:22:50.604981+00
20210416A	Add Collections Accountability	2025-04-25 15:22:50.612289+00
20210422A	Remove Files Interface	2025-04-25 15:22:50.616284+00
20210506A	Rename Interfaces	2025-04-25 15:22:50.650604+00
20210510A	Restructure Relations	2025-04-25 15:22:50.68801+00
20210518A	Add Foreign Key Constraints	2025-04-25 15:22:50.697609+00
20210519A	Add System Fk Triggers	2025-04-25 15:22:50.739791+00
20210521A	Add Collections Icon Color	2025-04-25 15:22:50.745435+00
20210525A	Add Insights	2025-04-25 15:22:50.78317+00
20210608A	Add Deep Clone Config	2025-04-25 15:22:50.788979+00
20210626A	Change Filesize Bigint	2025-04-25 15:22:50.811638+00
20210716A	Add Conditions to Fields	2025-04-25 15:22:50.817582+00
20210721A	Add Default Folder	2025-04-25 15:22:50.828006+00
20210802A	Replace Groups	2025-04-25 15:22:50.83551+00
20210803A	Add Required to Fields	2025-04-25 15:22:50.841772+00
20210805A	Update Groups	2025-04-25 15:22:50.84737+00
20210805B	Change Image Metadata Structure	2025-04-25 15:22:50.85415+00
20210811A	Add Geometry Config	2025-04-25 15:22:50.859485+00
20210831A	Remove Limit Column	2025-04-25 15:22:50.864742+00
20210903A	Add Auth Provider	2025-04-25 15:22:50.893998+00
20210907A	Webhooks Collections Not Null	2025-04-25 15:22:50.908895+00
20210910A	Move Module Setup	2025-04-25 15:22:50.916779+00
20210920A	Webhooks URL Not Null	2025-04-25 15:22:50.9295+00
20210924A	Add Collection Organization	2025-04-25 15:22:50.937194+00
20210927A	Replace Fields Group	2025-04-25 15:22:50.949633+00
20210927B	Replace M2M Interface	2025-04-25 15:22:50.954139+00
20210929A	Rename Login Action	2025-04-25 15:22:50.957609+00
20211007A	Update Presets	2025-04-25 15:22:50.96791+00
20211009A	Add Auth Data	2025-04-25 15:22:50.9739+00
20211016A	Add Webhook Headers	2025-04-25 15:22:50.979646+00
20211103A	Set Unique to User Token	2025-04-25 15:22:50.98908+00
20211103B	Update Special Geometry	2025-04-25 15:22:50.994166+00
20211104A	Remove Collections Listing	2025-04-25 15:22:50.99949+00
20211118A	Add Notifications	2025-04-25 15:22:51.02181+00
20211211A	Add Shares	2025-04-25 15:22:51.058432+00
20211230A	Add Project Descriptor	2025-04-25 15:22:51.064023+00
20220303A	Remove Default Project Color	2025-04-25 15:22:51.077359+00
20220308A	Add Bookmark Icon and Color	2025-04-25 15:22:51.082992+00
20220314A	Add Translation Strings	2025-04-25 15:22:51.08823+00
20220322A	Rename Field Typecast Flags	2025-04-25 15:22:51.09496+00
20220323A	Add Field Validation	2025-04-25 15:22:51.100469+00
20220325A	Fix Typecast Flags	2025-04-25 15:22:51.108296+00
20220325B	Add Default Language	2025-04-25 15:22:51.124776+00
20220402A	Remove Default Value Panel Icon	2025-04-25 15:22:51.140031+00
20220429A	Add Flows	2025-04-25 15:22:51.197385+00
20220429B	Add Color to Insights Icon	2025-04-25 15:22:51.203077+00
20220429C	Drop Non Null From IP of Activity	2025-04-25 15:22:51.20848+00
20220429D	Drop Non Null From Sender of Notifications	2025-04-25 15:22:51.213798+00
20220614A	Rename Hook Trigger to Event	2025-04-25 15:22:51.218282+00
20220801A	Update Notifications Timestamp Column	2025-04-25 15:22:51.230321+00
20220802A	Add Custom Aspect Ratios	2025-04-25 15:22:51.235639+00
20220826A	Add Origin to Accountability	2025-04-25 15:22:51.243491+00
20230401A	Update Material Icons	2025-04-25 15:22:51.256331+00
20230525A	Add Preview Settings	2025-04-25 15:22:51.261848+00
20230526A	Migrate Translation Strings	2025-04-25 15:22:51.280369+00
20230721A	Require Shares Fields	2025-04-25 15:22:51.289355+00
20230823A	Add Content Versioning	2025-04-25 15:22:51.31779+00
20230927A	Themes	2025-04-25 15:22:51.34379+00
20231009A	Update CSV Fields to Text	2025-04-25 15:22:51.349947+00
20231009B	Update Panel Options	2025-04-25 15:22:51.354807+00
20231010A	Add Extensions	2025-04-25 15:22:51.364214+00
20231215A	Add Focalpoints	2025-04-25 15:22:51.369731+00
20240122A	Add Report URL Fields	2025-04-25 15:22:51.376183+00
20240204A	Marketplace	2025-04-25 15:22:51.425057+00
20240305A	Change Useragent Type	2025-04-25 15:22:51.441728+00
20240311A	Deprecate Webhooks	2025-04-25 15:22:51.455653+00
20240422A	Public Registration	2025-04-25 15:22:51.464812+00
20240515A	Add Session Window	2025-04-25 15:22:51.47034+00
20240701A	Add Tus Data	2025-04-25 15:22:51.476038+00
20240716A	Update Files Date Fields	2025-04-25 15:22:51.486839+00
20240806A	Permissions Policies	2025-04-25 15:22:51.553607+00
20240817A	Update Icon Fields Length	2025-04-25 15:22:51.60389+00
20240909A	Separate Comments	2025-04-25 15:22:51.623922+00
20240909B	Consolidate Content Versioning	2025-04-25 15:22:51.629467+00
20240924A	Migrate Legacy Comments	2025-04-25 15:22:51.640569+00
20240924B	Populate Versioning Deltas	2025-04-25 15:22:51.648148+00
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
1	Organization	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
2	Pages	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
3	Pages_blocks	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
4	hero_widget	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
5	page_metadata	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
6	directus_files	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
7	page_info	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
cae9b6c2-bf70-43d2-a1ba-2ece3ee0bb55	Administrator	verified	$t:admin_description	\N	f	t	t
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
1	Pages	user_created	directus_users	\N	\N	\N	\N	\N	nullify
2	hero_widget	image	directus_files	\N	\N	\N	\N	\N	nullify
5	Pages_blocks	item	\N	\N	collection	hero_widget	Pages_id	\N	nullify
6	Pages_blocks	Pages_id	Pages	blocks	\N	\N	item	\N	nullify
7	Pages	organization_id	Organization	\N	\N	\N	\N	\N	nullify
9	page_metadata	page_id	Pages	page_metadata	\N	\N	\N	\N	nullify
10	page_info	favicon	directus_files	\N	\N	\N	\N	\N	nullify
11	page_info	organization_id	Organization	\N	\N	\N	\N	\N	nullify
12	page_info	logo_light	directus_files	\N	\N	\N	\N	\N	nullify
13	page_info	logo_dark	directus_files	\N	\N	\N	\N	\N	nullify
14	cardgroup_cards	image	directus_files	\N	\N	\N	\N	\N	nullify
16	cardgroup_cards	cardgroup_widget	card_group_widget	cardgroup_cards	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	2	directus_fields	1	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"Organization"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"Organization"}	\N	\N
2	3	directus_fields	2	{"sort":2,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Organization"}	{"sort":2,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Organization"}	\N	\N
3	4	directus_collections	Organization	{"singleton":false,"collection":"Organization"}	{"singleton":false,"collection":"Organization"}	\N	\N
4	5	directus_fields	3	{"sort":3,"interface":"input","special":null,"options":{"placeholder":"Organization Name"},"required":true,"collection":"Organization","field":"name"}	{"sort":3,"interface":"input","special":null,"options":{"placeholder":"Organization Name"},"required":true,"collection":"Organization","field":"name"}	\N	\N
5	6	directus_fields	1	{"id":1,"collection":"Organization","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Organization","field":"id","sort":1,"group":null}	\N	\N
6	7	directus_fields	3	{"id":3,"collection":"Organization","field":"name","special":null,"interface":"input","options":{"placeholder":"Organization Name"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"Organization","field":"name","sort":2,"group":null}	\N	\N
7	8	directus_fields	2	{"id":2,"collection":"Organization","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Organization","field":"date_created","sort":3,"group":null}	\N	\N
8	9	directus_fields	4	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"Pages"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"Pages"}	\N	\N
9	10	directus_fields	5	{"sort":2,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Pages"}	{"sort":2,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Pages"}	\N	\N
10	11	directus_fields	6	{"sort":3,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Pages"}	{"sort":3,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Pages"}	\N	\N
11	12	directus_fields	7	{"sort":4,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Pages"}	{"sort":4,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Pages"}	\N	\N
12	13	directus_collections	Pages	{"singleton":false,"collection":"Pages"}	{"singleton":false,"collection":"Pages"}	\N	\N
13	14	directus_fields	8	{"sort":5,"interface":"input","special":null,"required":true,"options":{"placeholder":"Web Page Title"},"collection":"Pages","field":"title"}	{"sort":5,"interface":"input","special":null,"required":true,"options":{"placeholder":"Web Page Title"},"collection":"Pages","field":"title"}	\N	\N
14	15	directus_fields	9	{"sort":6,"interface":"input","special":null,"required":true,"options":{"placeholder":"Page Slug"},"collection":"Pages","field":"slug"}	{"sort":6,"interface":"input","special":null,"required":true,"options":{"placeholder":"Page Slug"},"collection":"Pages","field":"slug"}	\N	\N
15	16	directus_fields	10	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"hero_widget"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"hero_widget"}	\N	\N
16	17	directus_collections	hero_widget	{"singleton":false,"collection":"hero_widget"}	{"singleton":false,"collection":"hero_widget"}	\N	\N
17	18	directus_fields	11	{"sort":2,"interface":"input","special":null,"options":{"placeholder":"Hero headline"},"collection":"hero_widget","field":"headline"}	{"sort":2,"interface":"input","special":null,"options":{"placeholder":"Hero headline"},"collection":"hero_widget","field":"headline"}	\N	\N
18	19	directus_fields	12	{"sort":3,"interface":"input-rich-text-html","special":null,"collection":"hero_widget","field":"content"}	{"sort":3,"interface":"input-rich-text-html","special":null,"collection":"hero_widget","field":"content"}	\N	\N
23	24	directus_fields	17	{"sort":7,"interface":"list-m2a","special":["m2a"],"collection":"Pages","field":"block"}	{"sort":7,"interface":"list-m2a","special":["m2a"],"collection":"Pages","field":"block"}	\N	\N
24	25	directus_fields	18	{"sort":1,"hidden":true,"field":"id","collection":"Pages_block"}	{"sort":1,"hidden":true,"field":"id","collection":"Pages_block"}	\N	\N
25	26	directus_collections	Pages_block	{"hidden":true,"icon":"import_export","collection":"Pages_block"}	{"hidden":true,"icon":"import_export","collection":"Pages_block"}	\N	\N
26	27	directus_fields	19	{"sort":2,"hidden":true,"collection":"Pages_block","field":"Pages_id"}	{"sort":2,"hidden":true,"collection":"Pages_block","field":"Pages_id"}	\N	\N
27	28	directus_fields	20	{"sort":3,"hidden":true,"collection":"Pages_block","field":"item"}	{"sort":3,"hidden":true,"collection":"Pages_block","field":"item"}	\N	\N
28	29	directus_fields	21	{"sort":4,"hidden":true,"collection":"Pages_block","field":"collection"}	{"sort":4,"hidden":true,"collection":"Pages_block","field":"collection"}	\N	\N
29	31	directus_fields	22	{"sort":7,"interface":"list-m2a","special":["m2a"],"collection":"Pages","field":"blocks"}	{"sort":7,"interface":"list-m2a","special":["m2a"],"collection":"Pages","field":"blocks"}	\N	\N
30	32	directus_fields	23	{"sort":1,"hidden":true,"field":"id","collection":"Pages_blocks"}	{"sort":1,"hidden":true,"field":"id","collection":"Pages_blocks"}	\N	\N
19	20	directus_fields	13	{"sort":4,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"label","name":"label","type":"string","meta":{"field":"label","type":"string","interface":"input","options":{"placeholder":"Button label"}}},{"field":"href","name":"href","type":"string","meta":{"field":"href","type":"string","interface":"input","options":{"placeholder":"Button link"}}},{"field":"button_color","name":"button_color","type":"string","meta":{"field":"button_color","type":"string","interface":"select-radio","options":{"choices":[{"text":"Base","value":"base"},{"text":"Primary","value":"primary"},{"text":"Secondary","value":"secondary"},{"text":"Accent","value":"accent"},{"text":"Neutral","value":"neutral"},{"text":"Info","value":"info"},{"text":"Success","value":"success"},{"text":"Warning","value":"warning"},{"text":"Error","value":"error"}]}}},{"field":"button_style","name":"button_style","type":"string","meta":{"field":"button_style","type":"string","interface":"select-radio","options":{"choices":[{"text":"Default","value":" "},{"text":"Outline","value":"outline"},{"text":"Dash","value":"dash"},{"text":"Soft","value":"soft"},{"text":"Ghost ","value":"ghost"},{"text":"Link","value":"link"}]}}}]},"collection":"hero_widget","field":"buttons"}	{"sort":4,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"label","name":"label","type":"string","meta":{"field":"label","type":"string","interface":"input","options":{"placeholder":"Button label"}}},{"field":"href","name":"href","type":"string","meta":{"field":"href","type":"string","interface":"input","options":{"placeholder":"Button link"}}},{"field":"button_color","name":"button_color","type":"string","meta":{"field":"button_color","type":"string","interface":"select-radio","options":{"choices":[{"text":"Base","value":"base"},{"text":"Primary","value":"primary"},{"text":"Secondary","value":"secondary"},{"text":"Accent","value":"accent"},{"text":"Neutral","value":"neutral"},{"text":"Info","value":"info"},{"text":"Success","value":"success"},{"text":"Warning","value":"warning"},{"text":"Error","value":"error"}]}}},{"field":"button_style","name":"button_style","type":"string","meta":{"field":"button_style","type":"string","interface":"select-radio","options":{"choices":[{"text":"Default","value":" "},{"text":"Outline","value":"outline"},{"text":"Dash","value":"dash"},{"text":"Soft","value":"soft"},{"text":"Ghost ","value":"ghost"},{"text":"Link","value":"link"}]}}}]},"collection":"hero_widget","field":"buttons"}	\N	\N
20	21	directus_fields	14	{"sort":5,"interface":"file-image","special":["file"],"collection":"hero_widget","field":"image"}	{"sort":5,"interface":"file-image","special":["file"],"collection":"hero_widget","field":"image"}	\N	\N
21	22	directus_fields	15	{"sort":6,"interface":"select-radio","special":null,"options":{"choices":[{"text":"None","value":"none"},{"text":"Base-100","value":"base-100"},{"text":"Base-200","value":"base-200"},{"text":"Base-300","value":"base-300"},{"text":"Primary","value":"primary"},{"text":"Secondary","value":"secondary"},{"text":"Accent","value":"accent"},{"text":"Neutral","value":"neutral"},{"text":"Info","value":"info"},{"text":"Success","value":"success"},{"text":"Warning","value":"warning"},{"text":"Error","value":"error"}]},"collection":"hero_widget","field":"background_color"}	{"sort":6,"interface":"select-radio","special":null,"options":{"choices":[{"text":"None","value":"none"},{"text":"Base-100","value":"base-100"},{"text":"Base-200","value":"base-200"},{"text":"Base-300","value":"base-300"},{"text":"Primary","value":"primary"},{"text":"Secondary","value":"secondary"},{"text":"Accent","value":"accent"},{"text":"Neutral","value":"neutral"},{"text":"Info","value":"info"},{"text":"Success","value":"success"},{"text":"Warning","value":"warning"},{"text":"Error","value":"error"}]},"collection":"hero_widget","field":"background_color"}	\N	\N
22	23	directus_fields	16	{"sort":7,"interface":"select-radio","special":null,"options":{"choices":[{"text":"Normal","value":"normal"},{"text":"Reverse","value":"reverse"}]},"collection":"hero_widget","field":"display_orientation"}	{"sort":7,"interface":"select-radio","special":null,"options":{"choices":[{"text":"Normal","value":"normal"},{"text":"Reverse","value":"reverse"}]},"collection":"hero_widget","field":"display_orientation"}	\N	\N
36	43	directus_collections	Organization	{"collection":"Organization","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
37	44	directus_collections	Pages	{"collection":"Pages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
38	45	directus_collections	hero_widget	{"collection":"hero_widget","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
39	46	directus_collections	Pages_blocks	{"collection":"Pages_blocks","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
40	47	directus_collections	Widgets	{"collection":"Widgets","icon":"folder","note":null,"color":null,"translations":null}	{"collection":"Widgets","icon":"folder","note":null,"color":null,"translations":null}	\N	\N
41	48	directus_collections	Widgets	{"collection":"Widgets","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"hero_widget","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"hero_widget"}	\N	\N
42	49	directus_collections	Organization	{"collection":"Organization","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
43	50	directus_collections	Pages	{"collection":"Pages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
44	51	directus_collections	hero_widget	{"collection":"hero_widget","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
31	33	directus_collections	Pages_blocks	{"hidden":true,"icon":"import_export","collection":"Pages_blocks"}	{"hidden":true,"icon":"import_export","collection":"Pages_blocks"}	\N	\N
32	34	directus_fields	24	{"sort":2,"hidden":true,"collection":"Pages_blocks","field":"Pages_id"}	{"sort":2,"hidden":true,"collection":"Pages_blocks","field":"Pages_id"}	\N	\N
33	35	directus_fields	25	{"sort":3,"hidden":true,"collection":"Pages_blocks","field":"item"}	{"sort":3,"hidden":true,"collection":"Pages_blocks","field":"item"}	\N	\N
34	36	directus_fields	26	{"sort":4,"hidden":true,"collection":"Pages_blocks","field":"collection"}	{"sort":4,"hidden":true,"collection":"Pages_blocks","field":"collection"}	\N	\N
35	37	directus_fields	27	{"sort":8,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"collection":"Pages","field":"organization_id"}	{"sort":8,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"collection":"Pages","field":"organization_id"}	\N	\N
47	54	directus_collections	Organization	{"collection":"Organization","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
48	55	directus_collections	Pages	{"collection":"Pages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
49	56	directus_collections	Pages_blocks	{"collection":"Pages_blocks","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
45	52	directus_collections	Pages_blocks	{"collection":"Pages_blocks","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
46	53	directus_collections	hero_widget	{"collection":"hero_widget","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Pages","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Pages"}	\N	\N
50	57	directus_collections	Widgets	{"collection":"Widgets","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Pages","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Pages"}	\N	\N
51	58	directus_collections	hero_widget	{"collection":"hero_widget","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Pages","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Pages"}	\N	\N
52	59	directus_collections	hero_widget	{"collection":"hero_widget","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Pages","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Pages"}	\N	\N
53	60	directus_collections	Organization	{"collection":"Organization","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
54	61	directus_collections	Pages	{"collection":"Pages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
55	62	directus_collections	Widgets	{"collection":"Widgets","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
56	63	directus_collections	Pages_blocks	{"collection":"Pages_blocks","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
57	64	directus_collections	hero_widget	{"collection":"hero_widget","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Widgets","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Widgets"}	\N	\N
58	65	directus_fields	28	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"page_metadata"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"page_metadata"}	\N	\N
59	66	directus_collections	page_metadata	{"singleton":false,"collection":"page_metadata"}	{"singleton":false,"collection":"page_metadata"}	\N	\N
60	67	directus_fields	29	{"sort":2,"interface":"input","special":null,"required":true,"options":{"placeholder":"Metatag Key"},"collection":"page_metadata","field":"meta_key"}	{"sort":2,"interface":"input","special":null,"required":true,"options":{"placeholder":"Metatag Key"},"collection":"page_metadata","field":"meta_key"}	\N	\N
61	68	directus_fields	30	{"sort":3,"interface":"input","special":null,"options":{"placeholder":"Metatag Value"},"required":true,"collection":"page_metadata","field":"meta_value"}	{"sort":3,"interface":"input","special":null,"options":{"placeholder":"Metatag Value"},"required":true,"collection":"page_metadata","field":"meta_value"}	\N	\N
62	69	directus_fields	31	{"sort":4,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"page_metadata","field":"page_id"}	{"sort":4,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"page_metadata","field":"page_id"}	\N	\N
63	70	directus_collections	Organization	{"collection":"Organization","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
64	71	directus_collections	Pages	{"collection":"Pages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
65	72	directus_collections	page_metadata	{"collection":"page_metadata","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
85	94	directus_access	9d1d34eb-21fd-491e-93b3-373dcf1edf0e	{"id":"9d1d34eb-21fd-491e-93b3-373dcf1edf0e","role":null,"user":null,"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","sort":1}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
66	73	directus_collections	Widgets	{"collection":"Widgets","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
67	74	directus_collections	Pages_blocks	{"collection":"Pages_blocks","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
68	76	directus_fields	32	{"sort":4,"special":["m2o"],"collection":"page_metadata","field":"page_id"}	{"sort":4,"special":["m2o"],"collection":"page_metadata","field":"page_id"}	\N	\N
69	77	directus_fields	33	{"sort":9,"special":["o2m"],"interface":"list-o2m","collection":"Pages","field":"page_metadata"}	{"sort":9,"special":["o2m"],"interface":"list-o2m","collection":"Pages","field":"page_metadata"}	\N	\N
70	78	directus_fields	4	{"id":4,"collection":"Pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Pages","field":"id","sort":1,"group":null}	\N	\N
71	79	directus_fields	5	{"id":5,"collection":"Pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Pages","field":"user_created","sort":2,"group":null}	\N	\N
72	80	directus_fields	6	{"id":6,"collection":"Pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Pages","field":"date_created","sort":3,"group":null}	\N	\N
73	81	directus_fields	7	{"id":7,"collection":"Pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Pages","field":"date_updated","sort":4,"group":null}	\N	\N
74	82	directus_fields	8	{"id":8,"collection":"Pages","field":"title","special":null,"interface":"input","options":{"placeholder":"Web Page Title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"Pages","field":"title","sort":5,"group":null}	\N	\N
75	83	directus_fields	9	{"id":9,"collection":"Pages","field":"slug","special":null,"interface":"input","options":{"placeholder":"Page Slug"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"Pages","field":"slug","sort":6,"group":null}	\N	\N
76	84	directus_fields	22	{"id":22,"collection":"Pages","field":"blocks","special":["m2a"],"interface":"list-m2a","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Pages","field":"blocks","sort":7,"group":null}	\N	\N
77	85	directus_fields	33	{"id":33,"collection":"Pages","field":"page_metadata","special":["o2m"],"interface":"list-o2m","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Pages","field":"page_metadata","sort":8,"group":null}	\N	\N
78	86	directus_fields	27	{"id":27,"collection":"Pages","field":"organization_id","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"Pages","field":"organization_id","sort":9,"group":null}	\N	\N
79	87	directus_permissions	1	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Organization","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Organization","action":"read"}	\N	\N
80	88	directus_permissions	2	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Pages","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Pages","action":"read"}	\N	\N
81	89	directus_permissions	3	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Pages_blocks","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Pages_blocks","action":"read"}	\N	\N
82	90	directus_permissions	4	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"hero_widget","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"hero_widget","action":"read"}	\N	\N
83	91	directus_permissions	5	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"page_metadata","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"page_metadata","action":"read"}	\N	\N
84	92	directus_permissions	6	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}	\N	\N
86	95	Organization	d1df35e3-b2da-4780-bdf7-45e5fb383ae5	{"name":"Space Studio"}	{"name":"Space Studio"}	\N	\N
87	96	directus_fields	1	{"id":1,"collection":"Organization","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Organization","field":"id","hidden":false}	\N	\N
88	97	directus_files	f112d310-f655-499d-a04a-6caad323d899	{"title":"1745549897659","filename_download":"1745549897659.png","type":"image/png","storage":"local"}	{"title":"1745549897659","filename_download":"1745549897659.png","type":"image/png","storage":"local"}	\N	\N
89	98	hero_widget	4cda05aa-34ca-4554-8664-2bea7f0f1182	{"headline":"Hello World","content":"<p>Hello World from Directus CMS</p>","buttons":[{"label":"Hello ","href":"/","button_color":"base","button_style":" "}],"image":"f112d310-f655-499d-a04a-6caad323d899"}	{"headline":"Hello World","content":"<p>Hello World from Directus CMS</p>","buttons":[{"label":"Hello ","href":"/","button_color":"base","button_style":" "}],"image":"f112d310-f655-499d-a04a-6caad323d899"}	90	\N
91	100	Pages	bead27a0-859d-45bd-bac7-f0c74b8e39d8	{"title":"Example Page","slug":"index","blocks":{"create":[{"collection":"hero_widget","item":{"headline":"Hello World","content":"<p>Hello World from Directus CMS</p>","buttons":[{"label":"Hello ","href":"/","button_color":"base","button_style":" "}],"image":"f112d310-f655-499d-a04a-6caad323d899"}}],"update":[],"delete":[]},"organization_id":"d1df35e3-b2da-4780-bdf7-45e5fb383ae5"}	{"title":"Example Page","slug":"index","blocks":{"create":[{"collection":"hero_widget","item":{"headline":"Hello World","content":"<p>Hello World from Directus CMS</p>","buttons":[{"label":"Hello ","href":"/","button_color":"base","button_style":" "}],"image":"f112d310-f655-499d-a04a-6caad323d899"}}],"update":[],"delete":[]},"organization_id":"d1df35e3-b2da-4780-bdf7-45e5fb383ae5"}	\N	\N
90	99	Pages_blocks	1	{"collection":"hero_widget","item":{"headline":"Hello World","content":"<p>Hello World from Directus CMS</p>","buttons":[{"label":"Hello ","href":"/","button_color":"base","button_style":" "}],"image":"f112d310-f655-499d-a04a-6caad323d899"},"Pages_id":"bead27a0-859d-45bd-bac7-f0c74b8e39d8"}	{"collection":"hero_widget","item":{"headline":"Hello World","content":"<p>Hello World from Directus CMS</p>","buttons":[{"label":"Hello ","href":"/","button_color":"base","button_style":" "}],"image":"f112d310-f655-499d-a04a-6caad323d899"},"Pages_id":"bead27a0-859d-45bd-bac7-f0c74b8e39d8"}	91	\N
92	101	directus_fields	34	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"page_info"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"page_info"}	\N	\N
93	102	directus_collections	page_info	{"singleton":false,"collection":"page_info"}	{"singleton":false,"collection":"page_info"}	\N	\N
94	103	directus_fields	35	{"sort":2,"interface":"file-image","special":["file"],"collection":"page_info","field":"favicon"}	{"sort":2,"interface":"file-image","special":["file"],"collection":"page_info","field":"favicon"}	\N	\N
95	104	directus_fields	36	{"sort":3,"interface":"input","special":null,"collection":"page_info","field":"email"}	{"sort":3,"interface":"input","special":null,"collection":"page_info","field":"email"}	\N	\N
96	105	directus_fields	37	{"sort":4,"interface":"input","special":null,"collection":"page_info","field":"contact_phone"}	{"sort":4,"interface":"input","special":null,"collection":"page_info","field":"contact_phone"}	\N	\N
97	106	directus_fields	38	{"sort":5,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"collection":"page_info","field":"organization_id"}	{"sort":5,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"collection":"page_info","field":"organization_id"}	\N	\N
98	107	directus_fields	39	{"sort":6,"interface":"input","special":null,"collection":"page_info","field":"contact_adress"}	{"sort":6,"interface":"input","special":null,"collection":"page_info","field":"contact_adress"}	\N	\N
99	108	directus_fields	40	{"sort":7,"interface":"input","special":null,"collection":"page_info","field":"site_title"}	{"sort":7,"interface":"input","special":null,"collection":"page_info","field":"site_title"}	\N	\N
100	109	directus_fields	41	{"sort":8,"interface":"file-image","special":["file"],"collection":"page_info","field":"logo_light"}	{"sort":8,"interface":"file-image","special":["file"],"collection":"page_info","field":"logo_light"}	\N	\N
101	110	directus_fields	42	{"sort":9,"interface":"file-image","special":["file"],"collection":"page_info","field":"logo_dark"}	{"sort":9,"interface":"file-image","special":["file"],"collection":"page_info","field":"logo_dark"}	\N	\N
102	111	page_info	1	{"favicon":"f112d310-f655-499d-a04a-6caad323d899","email":"correo@correo.com","contact_phone":"999999999","organization_id":"d1df35e3-b2da-4780-bdf7-45e5fb383ae5","contact_adress":"Av.Avenidosa","site_title":"Hello World"}	{"favicon":"f112d310-f655-499d-a04a-6caad323d899","email":"correo@correo.com","contact_phone":"999999999","organization_id":"d1df35e3-b2da-4780-bdf7-45e5fb383ae5","contact_adress":"Av.Avenidosa","site_title":"Hello World"}	\N	\N
103	112	directus_permissions	7	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"page_info","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"page_info","action":"read"}	\N	\N
104	114	directus_access	9d1d34eb-21fd-491e-93b3-373dcf1edf0e	{"id":"9d1d34eb-21fd-491e-93b3-373dcf1edf0e","role":null,"user":null,"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","sort":1}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
105	115	hero_widget	4cda05aa-34ca-4554-8664-2bea7f0f1182	{"id":"4cda05aa-34ca-4554-8664-2bea7f0f1182","headline":"Hello World","content":"<p>Hello World from Directus CMS</p>","buttons":[{"label":"Hello ","href":"/","button_color":"primary","button_style":"outline"}],"image":"f112d310-f655-499d-a04a-6caad323d899","background_color":"none","display_orientation":null}	{"buttons":[{"label":"Hello ","href":"/","button_color":"primary","button_style":"outline"}]}	\N	\N
106	116	hero_widget	4cda05aa-34ca-4554-8664-2bea7f0f1182	{"id":"4cda05aa-34ca-4554-8664-2bea7f0f1182","headline":"Hello World","content":"<p>Hello World from Directus CMS</p>","buttons":[{"label":"Hello ","href":"/","button_color":"secondary","button_style":" "}],"image":"f112d310-f655-499d-a04a-6caad323d899","background_color":"none","display_orientation":null}	{"buttons":[{"label":"Hello ","href":"/","button_color":"secondary","button_style":" "}]}	\N	\N
107	117	directus_collections	page_info	{"collection":"page_info","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"page_metadata","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"page_metadata"}	\N	\N
108	118	directus_collections	Organization	{"collection":"Organization","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
109	119	directus_collections	Pages	{"collection":"Pages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
110	120	directus_collections	page_metadata	{"collection":"page_metadata","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
111	121	directus_collections	Widgets	{"collection":"Widgets","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
112	122	directus_collections	Pages_blocks	{"collection":"Pages_blocks","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
113	123	directus_collections	Organization	{"collection":"Organization","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
114	124	directus_collections	Pages	{"collection":"Pages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
115	125	directus_collections	page_metadata	{"collection":"page_metadata","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
116	126	directus_collections	page_info	{"collection":"page_info","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
117	127	directus_collections	Widgets	{"collection":"Widgets","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
118	128	directus_collections	Pages_blocks	{"collection":"Pages_blocks","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
119	129	directus_fields	43	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"card_group_widget"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"card_group_widget"}	\N	\N
120	130	directus_collections	card_group_widget	{"singleton":false,"collection":"card_group_widget"}	{"singleton":false,"collection":"card_group_widget"}	\N	\N
121	131	directus_fields	44	{"sort":2,"interface":"input","special":null,"collection":"card_group_widget","field":"headline"}	{"sort":2,"interface":"input","special":null,"collection":"card_group_widget","field":"headline"}	\N	\N
122	132	directus_fields	45	{"sort":3,"interface":"input-multiline","special":null,"collection":"card_group_widget","field":"content"}	{"sort":3,"interface":"input-multiline","special":null,"collection":"card_group_widget","field":"content"}	\N	\N
123	133	directus_fields	46	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"cardgroup_cards"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"cardgroup_cards"}	\N	\N
124	134	directus_collections	cardgroup_cards	{"singleton":false,"collection":"cardgroup_cards"}	{"singleton":false,"collection":"cardgroup_cards"}	\N	\N
125	135	directus_fields	47	{"sort":2,"interface":"input","special":null,"collection":"cardgroup_cards","field":"headline"}	{"sort":2,"interface":"input","special":null,"collection":"cardgroup_cards","field":"headline"}	\N	\N
126	136	directus_fields	48	{"sort":3,"interface":"input","special":null,"collection":"cardgroup_cards","field":"link"}	{"sort":3,"interface":"input","special":null,"collection":"cardgroup_cards","field":"link"}	\N	\N
127	137	directus_fields	49	{"sort":4,"interface":"select-radio","special":null,"options":{"choices":[{"text":"None","value":"none"},{"text":"Style 1","value":"1"},{"text":"Style 2","value":"2"},{"text":"Style 3","value":"3"},{"text":"Style 4","value":"4"},{"text":"Style 5 ","value":"5"}]},"collection":"cardgroup_cards","field":"cardgroup_cards"}	{"sort":4,"interface":"select-radio","special":null,"options":{"choices":[{"text":"None","value":"none"},{"text":"Style 1","value":"1"},{"text":"Style 2","value":"2"},{"text":"Style 3","value":"3"},{"text":"Style 4","value":"4"},{"text":"Style 5 ","value":"5"}]},"collection":"cardgroup_cards","field":"cardgroup_cards"}	\N	\N
128	138	directus_fields	49	{"id":49,"collection":"cardgroup_cards","field":"cardgroup_cards","special":null,"interface":"select-radio","options":{"choices":[{"text":"None","value":"none"},{"text":"Style 1","value":"1"},{"text":"Style 2","value":"2"},{"text":"Style 3","value":"3"},{"text":"Style 4","value":"4"},{"text":"Style 5 ","value":"5"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"cardgroup_cards","field":"cardgroup_cards","required":true}	\N	\N
129	140	directus_fields	50	{"sort":4,"interface":"select-radio","special":null,"options":{"choices":[{"text":"None","value":"none"},{"text":"Style 1 ","value":"1"},{"text":"Style 2","value":"2"},{"text":"Style 3","value":"3"},{"text":"Style 4","value":"4"},{"text":"Style 5","value":"5"}]},"collection":"cardgroup_cards","field":"card_style"}	{"sort":4,"interface":"select-radio","special":null,"options":{"choices":[{"text":"None","value":"none"},{"text":"Style 1 ","value":"1"},{"text":"Style 2","value":"2"},{"text":"Style 3","value":"3"},{"text":"Style 4","value":"4"},{"text":"Style 5","value":"5"}]},"collection":"cardgroup_cards","field":"card_style"}	\N	\N
130	141	directus_fields	51	{"sort":5,"interface":"input-multiline","special":null,"collection":"cardgroup_cards","field":"content"}	{"sort":5,"interface":"input-multiline","special":null,"collection":"cardgroup_cards","field":"content"}	\N	\N
131	142	directus_fields	52	{"sort":6,"interface":"file-image","special":["file"],"collection":"cardgroup_cards","field":"image"}	{"sort":6,"interface":"file-image","special":["file"],"collection":"cardgroup_cards","field":"image"}	\N	\N
132	143	directus_fields	53	{"sort":7,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"cardgroup_cards","field":"cardgroup_id"}	{"sort":7,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"cardgroup_cards","field":"cardgroup_id"}	\N	\N
133	144	directus_fields	54	{"sort":8,"special":["o2m"],"interface":"list-o2m","collection":"cardgroup_cards","field":"cardgroup_cards"}	{"sort":8,"special":["o2m"],"interface":"list-o2m","collection":"cardgroup_cards","field":"cardgroup_cards"}	\N	\N
134	147	directus_fields	55	{"sort":7,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"cardgroup_cards","field":"cardgroup_widget"}	{"sort":7,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"cardgroup_cards","field":"cardgroup_widget"}	\N	\N
135	148	directus_fields	56	{"sort":4,"special":["o2m"],"interface":"list-o2m","collection":"card_group_widget","field":"cardgroup_cards"}	{"sort":4,"special":["o2m"],"interface":"list-o2m","collection":"card_group_widget","field":"cardgroup_cards"}	\N	\N
136	149	directus_collections	hero_widget	{"collection":"hero_widget","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Widgets","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Widgets"}	\N	\N
137	150	directus_collections	card_group_widget	{"collection":"card_group_widget","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Widgets","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Widgets"}	\N	\N
138	151	directus_collections	Organization	{"collection":"Organization","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
139	152	directus_collections	Pages	{"collection":"Pages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
140	153	directus_collections	page_metadata	{"collection":"page_metadata","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
141	154	directus_collections	page_info	{"collection":"page_info","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
142	155	directus_collections	Widgets	{"collection":"Widgets","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
143	156	directus_collections	Pages_blocks	{"collection":"Pages_blocks","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
144	157	directus_collections	cardgroup_cards	{"collection":"cardgroup_cards","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
145	158	directus_collections	hero_widget	{"collection":"hero_widget","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Widgets","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Widgets"}	\N	\N
146	159	directus_collections	Organization	{"collection":"Organization","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
148	161	directus_collections	Pages	{"collection":"Pages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
150	163	directus_collections	page_metadata	{"collection":"page_metadata","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
151	164	directus_collections	page_info	{"collection":"page_info","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
152	165	directus_collections	Widgets	{"collection":"Widgets","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
153	166	directus_collections	Pages_blocks	{"collection":"Pages_blocks","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
154	167	directus_fields	57	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"navigation_items"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"navigation_items"}	\N	\N
155	168	directus_collections	navigation_items	{"singleton":false,"collection":"navigation_items"}	{"singleton":false,"collection":"navigation_items"}	\N	\N
147	160	directus_collections	card_group_widget	{"collection":"card_group_widget","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Widgets","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Widgets"}	\N	\N
149	162	directus_collections	cardgroup_cards	{"collection":"cardgroup_cards","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Widgets","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Widgets"}	\N	\N
156	171	directus_fields	58	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"navigation_items"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"navigation_items"}	\N	\N
157	172	directus_fields	59	{"sort":2,"interface":"input","hidden":true,"field":"sort","collection":"navigation_items"}	{"sort":2,"interface":"input","hidden":true,"field":"sort","collection":"navigation_items"}	\N	\N
158	173	directus_collections	navigation_items	{"sort_field":"sort","singleton":false,"collection":"navigation_items"}	{"sort_field":"sort","singleton":false,"collection":"navigation_items"}	\N	\N
159	174	directus_fields	60	{"sort":3,"interface":"input","special":null,"collection":"navigation_items","field":"text"}	{"sort":3,"interface":"input","special":null,"collection":"navigation_items","field":"text"}	\N	\N
160	175	directus_fields	61	{"sort":4,"interface":"input","special":null,"collection":"navigation_items","field":"slug"}	{"sort":4,"interface":"input","special":null,"collection":"navigation_items","field":"slug"}	\N	\N
161	176	directus_fields	62	{"sort":5,"interface":"boolean","special":["cast-boolean"],"collection":"navigation_items","field":"highlighted"}	{"sort":5,"interface":"boolean","special":["cast-boolean"],"collection":"navigation_items","field":"highlighted"}	\N	\N
162	177	directus_collections	hero_widget	{"collection":"hero_widget","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Widgets","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Widgets"}	\N	\N
163	178	directus_collections	card_group_widget	{"collection":"card_group_widget","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Widgets","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Widgets"}	\N	\N
164	179	directus_collections	cardgroup_cards	{"collection":"cardgroup_cards","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Widgets","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Widgets"}	\N	\N
165	180	directus_collections	navigation_items	{"collection":"navigation_items","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"Widgets","collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":"Widgets"}	\N	\N
166	181	directus_collections	Organization	{"collection":"Organization","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
167	182	directus_collections	Pages	{"collection":"Pages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
168	183	directus_collections	page_metadata	{"collection":"page_metadata","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
169	184	directus_collections	page_info	{"collection":"page_info","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
170	185	directus_collections	Widgets	{"collection":"Widgets","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
171	186	directus_collections	Pages_blocks	{"collection":"Pages_blocks","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
3114f504-2306-495b-9948-3ef8dc55cc2b	Administrator	verified	$t:admin_description	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
U1KyRjnSUj1Wp7jbCbT0mFlc9cYIgLOThhxuUa0e2tU86AfGvp3IyvpiFRoMrqj_	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-25 19:47:56.656+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	\N	http://localhost:8055	DodZN_Gjg563AlVZpUB4ewXH1jfNH-FzoDOgbYgSvbJxUpFCrA5y_e9NvPOZrOB-
DodZN_Gjg563AlVZpUB4ewXH1jfNH-FzoDOgbYgSvbJxUpFCrA5y_e9NvPOZrOB-	6d7e99a3-efa7-4a30-b10c-78bc39674473	2025-04-26 19:47:46.656+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
\.


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
6d7e99a3-efa7-4a30-b10c-78bc39674473	Admin	User	admin@example.com	$argon2id$v=19$m=65536,t=3,p=4$2WrgIYlHqBs30K5u/vHd3Q$VSb8Jj8uC7fMR9DnKd61tsHatB9BhvPE/WKmWHPDU/I	\N	\N	\N	\N	\N	\N	\N	active	3114f504-2306-495b-9948-3ef8dc55cc2b	\N	2025-04-25 19:47:46.673+00	/settings/data-model	default	\N	\N	t	\N	\N	\N	\N	\N
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
-- Data for Name: hero_widget; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.hero_widget (id, headline, content, buttons, image, background_color, display_orientation) FROM stdin;
4cda05aa-34ca-4554-8664-2bea7f0f1182	Hello World	<p>Hello World from Directus CMS</p>	[{"label":"Hello ","href":"/","button_color":"secondary","button_style":" "}]	f112d310-f655-499d-a04a-6caad323d899	none	\N
\.


--
-- Data for Name: navigation_items; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.navigation_items (id, sort, text, slug, highlighted) FROM stdin;
\.


--
-- Data for Name: page_info; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.page_info (id, favicon, email, contact_phone, organization_id, contact_adress, site_title, logo_light, logo_dark) FROM stdin;
1	f112d310-f655-499d-a04a-6caad323d899	correo@correo.com	999999999	d1df35e3-b2da-4780-bdf7-45e5fb383ae5	Av.Avenidosa	Hello World	\N	\N
\.


--
-- Data for Name: page_metadata; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.page_metadata (id, meta_key, meta_value, page_id) FROM stdin;
\.


--
-- Name: Pages_blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Pages_blocks_id_seq"', 1, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 186, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 62, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 7, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 1, false);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 16, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 171, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: page_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.page_info_id_seq', 1, true);


--
-- Name: page_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.page_metadata_id_seq', 1, false);


--
-- Name: Organization Organization_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Organization"
    ADD CONSTRAINT "Organization_pkey" PRIMARY KEY (id);


--
-- Name: Pages_blocks Pages_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Pages_blocks"
    ADD CONSTRAINT "Pages_blocks_pkey" PRIMARY KEY (id);


--
-- Name: Pages Pages_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Pages"
    ADD CONSTRAINT "Pages_pkey" PRIMARY KEY (id);


--
-- Name: card_group_widget card_group_widget_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.card_group_widget
    ADD CONSTRAINT card_group_widget_pkey PRIMARY KEY (id);


--
-- Name: cardgroup_cards cardgroup_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cardgroup_cards
    ADD CONSTRAINT cardgroup_cards_pkey PRIMARY KEY (id);


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
-- Name: hero_widget hero_widget_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.hero_widget
    ADD CONSTRAINT hero_widget_pkey PRIMARY KEY (id);


--
-- Name: navigation_items navigation_items_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.navigation_items
    ADD CONSTRAINT navigation_items_pkey PRIMARY KEY (id);


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
-- Name: Pages pages_slug_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Pages"
    ADD CONSTRAINT pages_slug_unique UNIQUE (slug);


--
-- Name: cardgroup_cards cardgroup_cards_cardgroup_widget_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cardgroup_cards
    ADD CONSTRAINT cardgroup_cards_cardgroup_widget_foreign FOREIGN KEY (cardgroup_widget) REFERENCES public.card_group_widget(id) ON DELETE SET NULL;


--
-- Name: cardgroup_cards cardgroup_cards_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cardgroup_cards
    ADD CONSTRAINT cardgroup_cards_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


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
-- Name: hero_widget hero_widget_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.hero_widget
    ADD CONSTRAINT hero_widget_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


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
    ADD CONSTRAINT page_info_organization_id_foreign FOREIGN KEY (organization_id) REFERENCES public."Organization"(id) ON DELETE SET NULL;


--
-- Name: page_metadata page_metadata_page_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.page_metadata
    ADD CONSTRAINT page_metadata_page_id_foreign FOREIGN KEY (page_id) REFERENCES public."Pages"(id) ON DELETE SET NULL;


--
-- Name: Pages_blocks pages_blocks_pages_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Pages_blocks"
    ADD CONSTRAINT pages_blocks_pages_id_foreign FOREIGN KEY ("Pages_id") REFERENCES public."Pages"(id) ON DELETE SET NULL;


--
-- Name: Pages pages_organization_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Pages"
    ADD CONSTRAINT pages_organization_id_foreign FOREIGN KEY (organization_id) REFERENCES public."Organization"(id) ON DELETE SET NULL;


--
-- Name: Pages pages_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Pages"
    ADD CONSTRAINT pages_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- PostgreSQL database dump complete
--

