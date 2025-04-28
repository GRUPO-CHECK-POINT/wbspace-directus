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
-- Name: testing; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA testing;


ALTER SCHEMA testing OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: directus_access; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE testing.directus_access OWNER TO admin;

--
-- Name: directus_activity; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_activity (
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


ALTER TABLE testing.directus_activity OWNER TO admin;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: testing; Owner: admin
--

CREATE SEQUENCE testing.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE testing.directus_activity_id_seq OWNER TO admin;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: testing; Owner: admin
--

ALTER SEQUENCE testing.directus_activity_id_seq OWNED BY testing.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_collections (
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


ALTER TABLE testing.directus_collections OWNER TO admin;

--
-- Name: directus_comments; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE testing.directus_comments OWNER TO admin;

--
-- Name: directus_dashboards; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE testing.directus_dashboards OWNER TO admin;

--
-- Name: directus_extensions; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE testing.directus_extensions OWNER TO admin;

--
-- Name: directus_fields; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_fields (
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


ALTER TABLE testing.directus_fields OWNER TO admin;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: testing; Owner: admin
--

CREATE SEQUENCE testing.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE testing.directus_fields_id_seq OWNER TO admin;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: testing; Owner: admin
--

ALTER SEQUENCE testing.directus_fields_id_seq OWNED BY testing.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_files (
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


ALTER TABLE testing.directus_files OWNER TO admin;

--
-- Name: directus_flows; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_flows (
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


ALTER TABLE testing.directus_flows OWNER TO admin;

--
-- Name: directus_folders; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE testing.directus_folders OWNER TO admin;

--
-- Name: directus_migrations; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE testing.directus_migrations OWNER TO admin;

--
-- Name: directus_notifications; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_notifications (
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


ALTER TABLE testing.directus_notifications OWNER TO admin;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: testing; Owner: admin
--

CREATE SEQUENCE testing.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE testing.directus_notifications_id_seq OWNER TO admin;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: testing; Owner: admin
--

ALTER SEQUENCE testing.directus_notifications_id_seq OWNED BY testing.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_operations (
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


ALTER TABLE testing.directus_operations OWNER TO admin;

--
-- Name: directus_panels; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_panels (
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


ALTER TABLE testing.directus_panels OWNER TO admin;

--
-- Name: directus_permissions; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


ALTER TABLE testing.directus_permissions OWNER TO admin;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: testing; Owner: admin
--

CREATE SEQUENCE testing.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE testing.directus_permissions_id_seq OWNER TO admin;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: testing; Owner: admin
--

ALTER SEQUENCE testing.directus_permissions_id_seq OWNED BY testing.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE testing.directus_policies OWNER TO admin;

--
-- Name: directus_presets; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_presets (
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


ALTER TABLE testing.directus_presets OWNER TO admin;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: testing; Owner: admin
--

CREATE SEQUENCE testing.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE testing.directus_presets_id_seq OWNER TO admin;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: testing; Owner: admin
--

ALTER SEQUENCE testing.directus_presets_id_seq OWNED BY testing.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_relations (
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


ALTER TABLE testing.directus_relations OWNER TO admin;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: testing; Owner: admin
--

CREATE SEQUENCE testing.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE testing.directus_relations_id_seq OWNER TO admin;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: testing; Owner: admin
--

ALTER SEQUENCE testing.directus_relations_id_seq OWNED BY testing.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE testing.directus_revisions OWNER TO admin;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: testing; Owner: admin
--

CREATE SEQUENCE testing.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE testing.directus_revisions_id_seq OWNER TO admin;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: testing; Owner: admin
--

ALTER SEQUENCE testing.directus_revisions_id_seq OWNED BY testing.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


ALTER TABLE testing.directus_roles OWNER TO admin;

--
-- Name: directus_sessions; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE testing.directus_sessions OWNER TO admin;

--
-- Name: directus_settings; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_settings (
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


ALTER TABLE testing.directus_settings OWNER TO admin;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: testing; Owner: admin
--

CREATE SEQUENCE testing.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE testing.directus_settings_id_seq OWNER TO admin;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: testing; Owner: admin
--

ALTER SEQUENCE testing.directus_settings_id_seq OWNED BY testing.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_shares (
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


ALTER TABLE testing.directus_shares OWNER TO admin;

--
-- Name: directus_translations; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE testing.directus_translations OWNER TO admin;

--
-- Name: directus_users; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_users (
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


ALTER TABLE testing.directus_users OWNER TO admin;

--
-- Name: directus_versions; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_versions (
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


ALTER TABLE testing.directus_versions OWNER TO admin;

--
-- Name: directus_webhooks; Type: TABLE; Schema: testing; Owner: admin
--

CREATE TABLE testing.directus_webhooks (
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


ALTER TABLE testing.directus_webhooks OWNER TO admin;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: testing; Owner: admin
--

CREATE SEQUENCE testing.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE testing.directus_webhooks_id_seq OWNER TO admin;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: testing; Owner: admin
--

ALTER SEQUENCE testing.directus_webhooks_id_seq OWNED BY testing.directus_webhooks.id;


--
-- Name: directus_activity id; Type: DEFAULT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_activity ALTER COLUMN id SET DEFAULT nextval('testing.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_fields ALTER COLUMN id SET DEFAULT nextval('testing.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_notifications ALTER COLUMN id SET DEFAULT nextval('testing.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_permissions ALTER COLUMN id SET DEFAULT nextval('testing.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_presets ALTER COLUMN id SET DEFAULT nextval('testing.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_relations ALTER COLUMN id SET DEFAULT nextval('testing.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_revisions ALTER COLUMN id SET DEFAULT nextval('testing.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_settings ALTER COLUMN id SET DEFAULT nextval('testing.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('testing.directus_webhooks_id_seq'::regclass);


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_access (id, role, "user", policy, sort) FROM stdin;
5b75a116-9c76-4b11-8857-835d60ad9114	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
59993153-3a50-4987-8ecb-5d0bb07c4693	86d6d2f3-958e-4314-a213-a0250e038674	\N	3fab4f94-43cf-46d6-a274-aa609c392791	\N
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
\.


--
-- Data for Name: directus_comments; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
t	e13d296a-f62b-4d91-9374-796bd5b1cd00	endpoint-test	local	\N
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2025-04-28 19:14:32.698896+00
20201029A	Remove System Relations	2025-04-28 19:14:32.711374+00
20201029B	Remove System Collections	2025-04-28 19:14:32.720456+00
20201029C	Remove System Fields	2025-04-28 19:14:32.735307+00
20201105A	Add Cascade System Relations	2025-04-28 19:14:32.851341+00
20201105B	Change Webhook URL Type	2025-04-28 19:14:32.870816+00
20210225A	Add Relations Sort Field	2025-04-28 19:14:32.884151+00
20210304A	Remove Locked Fields	2025-04-28 19:14:32.89288+00
20210312A	Webhooks Collections Text	2025-04-28 19:14:32.909248+00
20210331A	Add Refresh Interval	2025-04-28 19:14:32.917962+00
20210415A	Make Filesize Nullable	2025-04-28 19:14:32.936832+00
20210416A	Add Collections Accountability	2025-04-28 19:14:32.948389+00
20210422A	Remove Files Interface	2025-04-28 19:14:32.956064+00
20210506A	Rename Interfaces	2025-04-28 19:14:33.047893+00
20210510A	Restructure Relations	2025-04-28 19:14:33.101602+00
20210518A	Add Foreign Key Constraints	2025-04-28 19:14:33.117109+00
20210519A	Add System Fk Triggers	2025-04-28 19:14:33.181898+00
20210521A	Add Collections Icon Color	2025-04-28 19:14:33.190919+00
20210525A	Add Insights	2025-04-28 19:14:33.231504+00
20210608A	Add Deep Clone Config	2025-04-28 19:14:33.239901+00
20210626A	Change Filesize Bigint	2025-04-28 19:14:33.269215+00
20210716A	Add Conditions to Fields	2025-04-28 19:14:33.277752+00
20210721A	Add Default Folder	2025-04-28 19:14:33.290565+00
20210802A	Replace Groups	2025-04-28 19:14:33.302356+00
20210803A	Add Required to Fields	2025-04-28 19:14:33.310886+00
20210805A	Update Groups	2025-04-28 19:14:33.319092+00
20210805B	Change Image Metadata Structure	2025-04-28 19:14:33.328391+00
20210811A	Add Geometry Config	2025-04-28 19:14:33.336611+00
20210831A	Remove Limit Column	2025-04-28 19:14:33.344618+00
20210903A	Add Auth Provider	2025-04-28 19:14:33.386567+00
20210907A	Webhooks Collections Not Null	2025-04-28 19:14:33.407105+00
20210910A	Move Module Setup	2025-04-28 19:14:33.418447+00
20210920A	Webhooks URL Not Null	2025-04-28 19:14:33.438428+00
20210924A	Add Collection Organization	2025-04-28 19:14:33.450018+00
20210927A	Replace Fields Group	2025-04-28 19:14:33.470703+00
20210927B	Replace M2M Interface	2025-04-28 19:14:33.478108+00
20210929A	Rename Login Action	2025-04-28 19:14:33.484259+00
20211007A	Update Presets	2025-04-28 19:14:33.49959+00
20211009A	Add Auth Data	2025-04-28 19:14:33.50795+00
20211016A	Add Webhook Headers	2025-04-28 19:14:33.516401+00
20211103A	Set Unique to User Token	2025-04-28 19:14:33.528067+00
20211103B	Update Special Geometry	2025-04-28 19:14:33.535338+00
20211104A	Remove Collections Listing	2025-04-28 19:14:33.543333+00
20211118A	Add Notifications	2025-04-28 19:14:33.573103+00
20211211A	Add Shares	2025-04-28 19:14:33.615654+00
20211230A	Add Project Descriptor	2025-04-28 19:14:33.624123+00
20220303A	Remove Default Project Color	2025-04-28 19:14:33.643277+00
20220308A	Add Bookmark Icon and Color	2025-04-28 19:14:33.651944+00
20220314A	Add Translation Strings	2025-04-28 19:14:33.660209+00
20220322A	Rename Field Typecast Flags	2025-04-28 19:14:33.669787+00
20220323A	Add Field Validation	2025-04-28 19:14:33.677907+00
20220325A	Fix Typecast Flags	2025-04-28 19:14:33.686274+00
20220325B	Add Default Language	2025-04-28 19:14:33.709545+00
20220402A	Remove Default Value Panel Icon	2025-04-28 19:14:33.730213+00
20220429A	Add Flows	2025-04-28 19:14:33.805508+00
20220429B	Add Color to Insights Icon	2025-04-28 19:14:33.814495+00
20220429C	Drop Non Null From IP of Activity	2025-04-28 19:14:33.823186+00
20220429D	Drop Non Null From Sender of Notifications	2025-04-28 19:14:33.83138+00
20220614A	Rename Hook Trigger to Event	2025-04-28 19:14:33.838888+00
20220801A	Update Notifications Timestamp Column	2025-04-28 19:14:33.858243+00
20220802A	Add Custom Aspect Ratios	2025-04-28 19:14:33.866969+00
20220826A	Add Origin to Accountability	2025-04-28 19:14:33.879084+00
20230401A	Update Material Icons	2025-04-28 19:14:33.9006+00
20230525A	Add Preview Settings	2025-04-28 19:14:33.909303+00
20230526A	Migrate Translation Strings	2025-04-28 19:14:33.933157+00
20230721A	Require Shares Fields	2025-04-28 19:14:33.947341+00
20230823A	Add Content Versioning	2025-04-28 19:14:33.986868+00
20230927A	Themes	2025-04-28 19:14:34.035343+00
20231009A	Update CSV Fields to Text	2025-04-28 19:14:34.044906+00
20231009B	Update Panel Options	2025-04-28 19:14:34.052424+00
20231010A	Add Extensions	2025-04-28 19:14:34.06429+00
20231215A	Add Focalpoints	2025-04-28 19:14:34.072547+00
20240122A	Add Report URL Fields	2025-04-28 19:14:34.081534+00
20240204A	Marketplace	2025-04-28 19:14:34.159342+00
20240305A	Change Useragent Type	2025-04-28 19:14:34.186614+00
20240311A	Deprecate Webhooks	2025-04-28 19:14:34.209889+00
20240422A	Public Registration	2025-04-28 19:14:34.223719+00
20240515A	Add Session Window	2025-04-28 19:14:34.232244+00
20240701A	Add Tus Data	2025-04-28 19:14:34.240517+00
20240716A	Update Files Date Fields	2025-04-28 19:14:34.255926+00
20240806A	Permissions Policies	2025-04-28 19:14:34.358846+00
20240817A	Update Icon Fields Length	2025-04-28 19:14:34.446702+00
20240909A	Separate Comments	2025-04-28 19:14:34.472726+00
20240909B	Consolidate Content Versioning	2025-04-28 19:14:34.481133+00
20240924A	Migrate Legacy Comments	2025-04-28 19:14:34.496935+00
20240924B	Populate Versioning Deltas	2025-04-28 19:14:34.506449+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
3fab4f94-43cf-46d6-a274-aa609c392791	Administrator	verified	$t:admin_description	\N	f	t	t
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_roles (id, name, icon, description, parent) FROM stdin;
86d6d2f3-958e-4314-a213-a0250e038674	Administrator	verified	$t:admin_description	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter) FROM stdin;
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
032030e4-7671-4fbc-8490-36d007ce5bcc	Admin	User	admin@example.com	$argon2id$v=19$m=65536,t=3,p=4$tYImeHKC/nrhRcrMmc4WqA$RgZhabx2t0s8LU1+P4m4/CyTd5d53lkb2/MG43KZnKM	\N	\N	\N	\N	\N	\N	\N	active	86d6d2f3-958e-4314-a213-a0250e038674	\N	\N	\N	default	\N	\N	t	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: testing; Owner: admin
--

COPY testing.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
\.


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: testing; Owner: admin
--

SELECT pg_catalog.setval('testing.directus_activity_id_seq', 1, false);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: testing; Owner: admin
--

SELECT pg_catalog.setval('testing.directus_fields_id_seq', 1, false);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: testing; Owner: admin
--

SELECT pg_catalog.setval('testing.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: testing; Owner: admin
--

SELECT pg_catalog.setval('testing.directus_permissions_id_seq', 1, false);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: testing; Owner: admin
--

SELECT pg_catalog.setval('testing.directus_presets_id_seq', 1, false);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: testing; Owner: admin
--

SELECT pg_catalog.setval('testing.directus_relations_id_seq', 1, false);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: testing; Owner: admin
--

SELECT pg_catalog.setval('testing.directus_revisions_id_seq', 1, false);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: testing; Owner: admin
--

SELECT pg_catalog.setval('testing.directus_settings_id_seq', 1, false);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: testing; Owner: admin
--

SELECT pg_catalog.setval('testing.directus_webhooks_id_seq', 1, false);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_comments directus_comments_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES testing.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES testing.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES testing.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES testing.directus_collections(collection);


--
-- Name: directus_comments directus_comments_user_created_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES testing.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_comments directus_comments_user_updated_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES testing.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES testing.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES testing.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES testing.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES testing.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES testing.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES testing.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES testing.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES testing.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES testing.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES testing.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES testing.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES testing.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES testing.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES testing.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES testing.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES testing.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES testing.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES testing.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES testing.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES testing.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES testing.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES testing.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES testing.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES testing.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES testing.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES testing.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES testing.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES testing.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES testing.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES testing.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES testing.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES testing.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES testing.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES testing.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES testing.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES testing.directus_users(id);


--
-- Name: directus_webhooks directus_webhooks_migrated_flow_foreign; Type: FK CONSTRAINT; Schema: testing; Owner: admin
--

ALTER TABLE ONLY testing.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES testing.directus_flows(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

