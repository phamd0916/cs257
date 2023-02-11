--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.games (
    id integer NOT NULL,
    type integer,
    loc text,
    date text,
    "time" text,
    winner integer,
    loser integer,
    home integer,
    away integer,
    w_score integer,
    l_score integer,
    qrts integer
);


--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    csv_id text,
    name text,
    team_id integer,
    team text,
    three_attempts integer,
    three_makes integer,
    layup_attempts integer,
    layup_makes integer,
    jumper_attempts integer,
    jumper_makes integer,
    hook_attempts integer,
    hook_makes integer,
    blocks integer,
    fouls integer,
    fouled integer,
    rbs integer,
    vs integer,
    ft_attempts integer,
    ft_makes integer,
    tos integer,
    tos_caused integer,
    assists integer,
    jb_attempts integer,
    jb_makes integer
);


--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: plays; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plays (
    id integer NOT NULL,
    game_id integer,
    current_score_h integer,
    current_score_a integer,
    secs_left integer,
    qrt integer,
    shooter text,
    shot_type text,
    shot_outcome integer,
    shot_dist integer,
    asstr text,
    blkr text,
    foul_type text,
    fouler text,
    fouled text,
    rebounder text,
    rb_type text,
    v_player text,
    v_type text,
    to_team text,
    ft_shooter text,
    ft_outcome integer,
    to_player text,
    to_type text,
    to_cause text,
    to_causer text,
    jb_a_player text,
    jb_h_player text,
    jb_pos text,
    description text
);


--
-- Name: plays_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plays_id_seq OWNED BY public.plays.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams (
    abbreviation text,
    name text,
    wins integer,
    losses integer,
    h_wins integer,
    h_losses integer,
    a_wins integer,
    a_losses integer,
    ot_wins integer,
    ot_losses integer,
    points integer,
    rebounds integer,
    assists integer
);


--
-- Name: teams_players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams_players (
    id integer NOT NULL,
    team_id integer,
    player_id integer
);


--
-- Name: teams_players_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teams_players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teams_players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teams_players_id_seq OWNED BY public.teams_players.id;


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: plays id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plays ALTER COLUMN id SET DEFAULT nextval('public.plays_id_seq'::regclass);


--
-- Name: teams_players id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams_players ALTER COLUMN id SET DEFAULT nextval('public.teams_players_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.games (id, type, loc, date, "time", winner, loser, home, away, w_score, l_score, qrts) FROM stdin;
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.players (id, csv_id, name, team_id, team, three_attempts, three_makes, layup_attempts, layup_makes, jumper_attempts, jumper_makes, hook_attempts, hook_makes, blocks, fouls, fouled, rbs, vs, ft_attempts, ft_makes, tos, tos_caused, assists, jb_attempts, jb_makes) FROM stdin;
\.


--
-- Data for Name: plays; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.plays (id, game_id, current_score_h, current_score_a, secs_left, qrt, shooter, shot_type, shot_outcome, shot_dist, asstr, blkr, foul_type, fouler, fouled, rebounder, rb_type, v_player, v_type, to_team, ft_shooter, ft_outcome, to_player, to_type, to_cause, to_causer, jb_a_player, jb_h_player, jb_pos, description) FROM stdin;
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teams (abbreviation, name, wins, losses, h_wins, h_losses, a_wins, a_losses, ot_wins, ot_losses, points, rebounds, assists) FROM stdin;
TOR	Toronto Raptors	1	0	1	0	0	0	1	0	130	72	23
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	1	122	57	30
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	112	50	24
LAL	Los Angeles Lakers	0	1	0	0	0	1	0	0	102	50	20
CHO	Charlotte Hornets	1	0	1	0	0	0	0	0	126	48	28
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	125	58	25
IND	Indiana Pacers	0	1	0	1	0	0	0	0	110	44	26
DET	Detroit Pistons	1	0	0	0	1	0	0	0	119	52	26
ORL	Orlando Magic	1	0	1	0	0	0	0	0	94	57	24
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	85	60	20
BRK	Brooklyn Nets	0	1	0	1	0	0	0	1	126	63	19
MIN	Minnesota Timberwolves	1	0	0	0	1	0	1	0	127	69	23
MIA	Miami Heat	1	0	1	0	0	0	0	0	120	58	18
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	101	54	22
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	107	75	24
BOS	Boston Celtics	0	1	0	0	0	1	0	0	93	54	18
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	108	54	17
WAS	Washington Wizards	0	1	0	0	0	1	0	0	100	52	26
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	120	57	22
NYK	New York Knicks	0	1	0	0	0	1	0	0	111	46	24
UTA	Utah Jazz	1	0	1	0	0	0	0	0	100	56	15
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	95	61	15
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	124	57	31
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	95	57	17
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	100	55	13
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	108	50	24
DET	Detroit Pistons	0	1	0	1	0	0	0	0	100	46	20
ATL	Atlanta Hawks	1	0	0	0	1	0	0	0	117	51	27
HOU	Houston Rockets	0	1	0	1	0	0	0	0	111	66	25
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	117	63	31
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	122	49	27
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	141	49	33
BOS	Boston Celtics	1	0	1	0	0	0	0	0	112	61	21
TOR	Toronto Raptors	0	1	0	0	0	1	0	0	106	51	22
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	99	52	26
MIN	Minnesota Timberwolves	1	0	0	0	1	0	0	0	121	64	30
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	113	56	21
NYK	New York Knicks	0	1	0	0	0	1	0	0	109	51	17
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	102	63	24
CHI	Chicago Bulls	1	0	0	0	1	0	0	0	110	57	18
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	116	57	30
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	123	55	23
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	85	58	14
WAS	Washington Wizards	1	0	0	0	1	0	0	0	97	60	21
DEN	Denver Nuggets	1	0	1	0	0	0	1	0	108	57	21
PHO	Phoenix Suns	0	1	0	0	0	1	0	1	107	59	25
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	112	50	17
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	122	46	23
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	95	52	19
UTA	Utah Jazz	0	1	0	0	0	1	0	0	86	47	19
MIL	Milwaukee Bucks	0	1	0	1	0	0	0	1	126	57	22
MIA	Miami Heat	1	0	0	0	1	0	1	0	131	72	33
DET	Detroit Pistons	0	1	0	1	0	0	0	0	111	49	20
PHI	Philadelphia 76ers	1	0	0	0	1	0	0	0	117	56	30
ATL	Atlanta Hawks	1	0	1	0	0	0	0	0	103	59	22
ORL	Orlando Magic	0	1	0	0	0	1	0	0	99	55	15
NYK	New York Knicks	0	1	0	1	0	0	0	0	95	66	15
BOS	Boston Celtics	1	0	0	0	1	0	0	0	118	54	24
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	84	56	18
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	108	65	27
CLE	Cleveland Cavaliers	1	0	1	0	0	0	0	0	110	57	23
IND	Indiana Pacers	0	1	0	0	0	1	0	0	99	43	23
HOU	Houston Rockets	1	0	1	0	0	0	0	0	126	58	27
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	123	53	27
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	124	63	29
WAS	Washington Wizards	0	1	0	0	0	1	0	0	122	51	30
UTA	Utah Jazz	1	0	1	0	0	0	0	0	113	52	28
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	81	41	16
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	130	56	32
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	122	49	20
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	120	56	24
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	92	49	17
MEM	Memphis Grizzlies	1	0	1	0	0	0	1	0	134	57	33
BRK	Brooklyn Nets	0	1	0	0	0	1	0	1	133	65	28
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	119	57	27
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	121	55	13
MIN	Minnesota Timberwolves	1	0	1	0	0	0	0	0	116	55	24
MIA	Miami Heat	0	1	0	0	0	1	0	0	109	53	25
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	120	53	30
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	101	52	19
DET	Detroit Pistons	1	0	1	0	0	0	0	0	96	52	21
IND	Indiana Pacers	0	1	0	0	0	1	0	0	94	51	24
NYK	New York Knicks	1	0	1	0	0	0	0	0	105	74	19
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	98	44	19
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	103	58	23
PHI	Philadelphia 76ers	1	0	0	0	1	0	0	0	105	56	22
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	104	60	19
ORL	Orlando Magic	0	1	0	0	0	1	0	0	95	52	22
HOU	Houston Rockets	1	0	1	0	0	0	0	0	116	52	21
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	112	64	22
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	129	58	29
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	112	51	19
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	123	52	36
GSW	Golden State Warriors	1	0	0	0	1	0	0	0	134	72	37
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	113	57	25
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	110	61	19
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	95	44	23
UTA	Utah Jazz	1	0	0	0	1	0	0	0	96	61	19
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	94	55	25
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	101	70	19
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	111	50	23
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	96	46	24
MIA	Miami Heat	1	0	1	0	0	0	0	0	112	64	19
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	97	44	28
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	106	58	24
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	109	47	29
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	120	63	25
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	91	54	20
CLE	Cleveland Cavaliers	1	0	1	0	0	0	0	0	117	57	25
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	111	41	25
ORL	Orlando Magic	1	0	1	0	0	0	0	0	95	56	24
NYK	New York Knicks	0	1	0	0	0	1	0	0	83	55	19
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	117	66	24
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	95	45	12
BOS	Boston Celtics	1	0	1	0	0	0	0	0	116	54	25
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	0	105	54	21
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	108	66	21
IND	Indiana Pacers	1	0	0	0	1	0	0	0	118	50	25
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	125	38	30
DET	Detroit Pistons	0	1	0	0	0	1	0	0	113	52	30
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	99	63	15
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	102	55	19
WAS	Washington Wizards	0	1	0	1	0	0	0	0	158	46	31
HOU	Houston Rockets	1	0	0	0	1	0	0	0	159	48	34
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	111	48	26
CHO	Charlotte Hornets	1	0	0	0	1	0	0	0	118	49	30
UTA	Utah Jazz	1	0	1	0	0	0	0	0	110	43	23
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	96	43	19
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	110	52	24
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	121	55	33
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	97	60	20
MIA	Miami Heat	1	0	0	0	1	0	0	0	106	51	29
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	122	48	30
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	107	43	24
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	103	53	16
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	97	59	15
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	123	64	26
HOU	Houston Rockets	0	1	0	0	0	1	0	0	116	50	21
IND	Indiana Pacers	1	0	1	0	0	0	0	0	102	66	20
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	95	53	20
ORL	Orlando Magic	0	1	0	1	0	0	0	0	91	52	21
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	123	63	24
BOS	Boston Celtics	1	0	1	0	0	0	0	0	104	48	21
NYK	New York Knicks	0	1	0	0	0	1	0	0	102	58	22
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	112	50	29
DET	Detroit Pistons	0	1	0	0	0	1	0	0	106	55	21
DAL	Dallas Mavericks	0	1	0	1	0	0	0	1	110	73	23
LAL	Los Angeles Lakers	1	0	0	0	1	0	1	0	119	50	24
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	102	45	15
UTA	Utah Jazz	0	1	0	0	0	1	0	0	101	48	18
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	110	43	25
SAS	San Antonio Spurs	1	0	0	0	1	0	0	0	127	57	23
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	115	52	20
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	104	65	25
DET	Detroit Pistons	1	0	1	0	0	0	0	0	113	50	21
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	109	60	24
ORL	Orlando Magic	0	1	0	1	0	0	0	0	87	55	22
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	91	55	15
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	105	54	26
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	114	45	26
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	115	57	30
TOR	Toronto Raptors	0	1	0	0	0	1	0	0	105	49	24
WAS	Washington Wizards	0	1	0	1	0	0	0	0	109	48	21
MIN	Minnesota Timberwolves	1	0	0	0	1	0	0	0	131	62	33
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	87	46	23
CHO	Charlotte Hornets	1	0	0	0	1	0	0	0	93	56	18
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	128	42	21
PHI	Philadelphia 76ers	1	0	0	0	1	0	0	0	129	52	36
IND	Indiana Pacers	1	0	1	0	0	0	0	0	108	56	28
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	95	55	27
MIA	Miami Heat	1	0	1	0	0	0	0	0	129	57	38
HOU	Houston Rockets	0	1	0	0	0	1	0	0	100	45	19
NYK	New York Knicks	0	1	0	1	0	0	0	0	92	51	18
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	113	61	25
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	96	55	23
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	103	51	21
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	111	51	24
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	131	59	34
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	105	71	15
UTA	Utah Jazz	0	1	0	0	0	1	0	0	94	49	16
WAS	Washington Wizards	1	0	1	0	0	0	0	0	115	51	27
DET	Detroit Pistons	0	1	0	0	0	1	0	0	99	56	21
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	135	57	32
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	125	47	18
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	100	60	19
HOU	Houston Rockets	1	0	0	0	1	0	0	0	107	65	20
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	106	55	20
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	134	67	24
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	114	50	24
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	109	47	21
GSW	Golden State Warriors	1	0	1	0	0	0	0	0	127	56	28
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	118	52	16
CHO	Charlotte Hornets	1	0	1	0	0	0	1	0	122	55	22
IND	Indiana Pacers	0	1	0	0	0	1	0	1	120	49	27
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	113	48	22
BOS	Boston Celtics	1	0	0	0	1	0	0	0	119	50	24
ATL	Atlanta Hawks	1	0	1	0	0	0	0	0	108	61	22
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	100	51	18
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	112	52	22
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	118	55	26
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	102	48	21
ORL	Orlando Magic	0	1	0	0	0	1	0	0	94	59	15
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	109	55	35
MIA	Miami Heat	0	1	0	0	0	1	0	0	89	57	23
DET	Detroit Pistons	1	0	1	0	0	0	0	0	122	49	37
NYK	New York Knicks	0	1	0	0	0	1	0	0	102	40	24
IND	Indiana Pacers	1	0	1	0	0	0	0	0	121	57	35
WAS	Washington Wizards	0	1	0	0	0	1	0	0	106	56	24
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	93	49	18
CHI	Chicago Bulls	1	0	0	0	1	0	0	0	113	53	26
HOU	Houston Rockets	1	0	1	0	0	0	0	0	129	61	31
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	112	58	22
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	124	48	28
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	120	50	23
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	137	57	34
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	121	46	29
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	107	50	20
ORL	Orlando Magic	0	1	0	0	0	1	0	0	106	51	25
UTA	Utah Jazz	1	0	1	0	0	0	0	0	106	54	21
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	104	53	20
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	124	64	21
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	129	63	18
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	87	59	21
BOS	Boston Celtics	1	0	0	0	1	0	0	0	108	58	29
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	121	52	32
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	112	36	26
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	108	49	22
MIA	Miami Heat	1	0	0	0	1	0	0	0	124	48	22
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	107	66	20
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	101	58	18
IND	Indiana Pacers	1	0	1	0	0	0	0	0	112	45	23
DET	Detroit Pistons	0	1	0	0	0	1	0	0	106	48	27
ORL	Orlando Magic	1	0	1	0	0	0	0	0	118	63	24
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	86	46	23
WAS	Washington Wizards	0	1	0	1	0	0	0	0	100	54	26
CLE	Cleveland Cavaliers	1	0	0	0	1	0	0	0	113	53	18
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	109	44	23
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	121	40	27
MIN	Minnesota Timberwolves	1	0	1	0	0	0	1	0	125	73	20
GSW	Golden State Warriors	0	1	0	0	0	1	0	1	119	60	18
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	104	62	21
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	122	59	27
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	102	54	18
NYK	New York Knicks	1	0	0	0	1	0	0	0	106	67	19
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	100	48	28
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	97	61	28
UTA	Utah Jazz	1	0	1	0	0	0	0	0	103	66	15
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	0	100	62	14
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	115	61	11
BRK	Brooklyn Nets	1	0	0	0	1	0	0	0	119	64	18
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	95	59	30
MIA	Miami Heat	0	1	0	0	0	1	0	0	80	49	18
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	115	67	24
BOS	Boston Celtics	1	0	0	0	1	0	0	0	135	49	28
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	110	54	27
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	115	50	25
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	94	53	21
HOU	Houston Rockets	1	0	0	0	1	0	0	0	117	62	18
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	122	45	31
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	138	53	27
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	114	43	30
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	108	39	22
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	1	98	69	22
DEN	Denver Nuggets	1	0	0	0	1	0	1	0	100	71	26
ORL	Orlando Magic	0	1	0	1	0	0	0	0	102	44	27
IND	Indiana Pacers	1	0	0	0	1	0	0	0	109	49	31
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	114	54	29
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	106	40	22
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	119	39	31
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	121	50	27
NYK	New York Knicks	0	1	0	1	0	0	0	0	87	64	19
CLE	Cleveland Cavaliers	1	0	0	0	1	0	0	0	108	49	20
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	138	51	37
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	112	48	27
POR	Portland Trail Blazers	1	0	1	0	0	0	1	0	124	71	19
ATL	Atlanta Hawks	0	1	0	0	0	1	0	1	113	63	21
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	104	60	31
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	113	53	26
DET	Detroit Pistons	0	1	0	1	0	0	0	0	114	52	25
MIN	Minnesota Timberwolves	1	0	0	0	1	0	0	0	120	49	25
BOS	Boston Celtics	1	0	1	0	0	0	0	0	116	53	25
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	106	57	22
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	109	48	29
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	113	53	32
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	116	55	26
HOU	Houston Rockets	1	0	0	0	1	0	0	0	122	57	16
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	108	51	23
UTA	Utah Jazz	1	0	0	0	1	0	0	0	122	51	30
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	98	76	25
TOR	Toronto Raptors	0	1	0	0	0	1	0	0	88	47	25
IND	Indiana Pacers	1	0	1	0	0	0	0	0	111	59	21
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	85	46	19
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	98	51	24
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	97	53	13
MIA	Miami Heat	1	0	1	0	0	0	0	0	117	55	34
DET	Detroit Pistons	0	1	0	0	0	1	0	0	108	43	27
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	120	58	22
NYK	New York Knicks	0	1	0	0	0	1	0	0	102	52	27
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	121	48	31
ATL	Atlanta Hawks	1	0	0	0	1	0	0	0	125	65	30
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	115	49	32
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	123	57	39
UTA	Utah Jazz	1	0	1	0	0	0	0	0	119	58	16
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	114	52	19
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	107	54	24
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	99	50	15
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	117	42	27
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	119	50	32
ORL	Orlando Magic	1	0	1	0	0	0	0	0	112	58	27
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	97	53	25
BOS	Boston Celtics	1	0	1	0	0	0	0	0	140	56	32
WAS	Washington Wizards	0	1	0	0	0	1	0	0	133	45	28
HOU	Houston Rockets	1	0	1	0	0	0	0	0	102	60	12
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	93	65	17
MIN	Minnesota Timberwolves	1	0	1	0	0	0	0	0	129	56	25
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	114	48	24
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	120	60	31
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	94	41	29
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	106	55	24
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	114	57	20
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	97	45	18
MIA	Miami Heat	1	0	0	0	1	0	0	0	108	45	31
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	124	64	24
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	115	54	25
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	132	59	26
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	127	46	28
NYK	New York Knicks	1	0	1	0	0	0	0	0	106	62	20
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	103	48	21
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	128	52	32
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	112	56	25
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	101	66	26
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	93	59	19
CHO	Charlotte Hornets	1	0	1	0	0	0	0	0	109	51	22
DET	Detroit Pistons	0	1	0	0	0	1	0	0	106	49	25
ORL	Orlando Magic	1	0	1	0	0	0	0	0	111	57	22
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	109	49	23
HOU	Houston Rockets	1	0	1	0	0	0	0	0	111	48	12
IND	Indiana Pacers	0	1	0	0	0	1	0	0	102	60	24
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	107	51	25
UTA	Utah Jazz	0	1	0	0	0	1	0	0	106	61	17
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	116	51	26
WAS	Washington Wizards	1	0	0	0	1	0	0	0	137	56	38
OKC	Oklahoma City Thunder	1	0	1	0	0	0	1	0	127	41	22
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	1	119	52	24
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	100	64	17
BOS	Boston Celtics	1	0	0	0	1	0	0	0	105	50	24
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	99	48	22
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	97	47	24
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	111	66	15
BRK	Brooklyn Nets	1	0	0	0	1	0	0	0	117	48	30
IND	Indiana Pacers	0	1	0	1	0	0	0	0	83	60	19
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	102	65	23
NYK	New York Knicks	0	1	0	1	0	0	0	0	102	56	22
CHO	Charlotte Hornets	1	0	0	0	1	0	0	0	103	52	22
MIA	Miami Heat	1	0	1	0	0	0	0	0	109	50	25
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	94	35	23
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	105	55	23
HOU	Houston Rockets	1	0	0	0	1	0	0	0	125	50	15
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	110	65	24
TOR	Toronto Raptors	0	1	0	0	0	1	0	0	102	48	21
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	116	52	25
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	121	53	21
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	150	64	30
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	101	47	19
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	95	52	14
PHI	Philadelphia 76ers	1	0	0	0	1	0	0	0	114	49	33
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	100	50	22
BOS	Boston Celtics	0	1	0	0	0	1	0	0	99	54	26
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	114	52	29
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	131	45	36
ORL	Orlando Magic	1	0	1	0	0	0	0	0	125	57	25
WAS	Washington Wizards	0	1	0	0	0	1	0	0	121	42	31
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	108	56	24
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	100	58	23
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	122	48	26
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	101	52	16
NYK	New York Knicks	1	0	1	0	0	0	0	0	123	60	17
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	105	56	18
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	86	52	18
IND	Indiana Pacers	1	0	0	0	1	0	0	0	115	72	26
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	132	57	40
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	96	47	26
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	101	56	25
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	115	60	24
HOU	Houston Rockets	1	0	1	0	0	0	0	0	132	65	24
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	108	55	28
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	117	49	28
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	110	54	18
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	85	49	22
BOS	Boston Celtics	1	0	0	0	1	0	0	0	99	59	22
UTA	Utah Jazz	0	1	0	1	0	0	0	0	102	60	20
MIN	Minnesota Timberwolves	1	0	0	0	1	0	0	0	112	58	22
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	90	54	23
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	88	52	17
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	95	45	26
GSW	Golden State Warriors	1	0	0	0	1	0	0	0	114	62	33
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	115	59	24
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	104	54	20
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	120	48	28
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	116	48	24
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	112	51	29
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	107	47	22
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	109	54	30
NYK	New York Knicks	0	1	0	0	0	1	0	0	104	52	17
WAS	Washington Wizards	1	0	1	0	0	0	0	0	138	44	37
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	132	48	32
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	127	53	27
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	135	54	25
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	101	65	19
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	91	50	17
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	142	63	33
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	94	45	18
MIA	Miami Heat	1	0	1	0	0	0	0	0	124	58	25
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	100	39	19
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	113	59	26
ORL	Orlando Magic	0	1	0	0	0	1	0	0	97	54	26
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	109	69	25
DET	Detroit Pistons	0	1	0	0	0	1	0	0	89	54	23
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	95	65	13
UTA	Utah Jazz	1	0	0	0	1	0	0	0	103	58	22
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	105	56	29
HOU	Houston Rockets	0	1	0	0	0	1	0	0	95	51	19
LAC	Los Angeles Clippers	1	0	1	0	0	0	1	0	107	60	26
BOS	Boston Celtics	0	1	0	0	0	1	0	1	104	65	26
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	137	68	32
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	129	48	32
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	121	44	28
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	124	55	28
DET	Detroit Pistons	1	0	1	0	0	0	0	0	128	49	30
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	103	41	26
WAS	Washington Wizards	1	0	1	0	0	0	0	0	125	44	34
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	118	49	24
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	116	60	22
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	97	40	26
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	108	44	23
MIA	Miami Heat	1	0	0	0	1	0	0	0	116	53	33
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	127	44	28
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	130	51	32
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	115	58	32
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	104	37	21
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	143	56	31
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	101	39	23
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	96	57	24
BOS	Boston Celtics	0	1	0	0	0	1	0	0	92	46	21
UTA	Utah Jazz	1	0	1	0	0	0	0	0	113	56	23
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	109	41	28
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	122	55	27
HOU	Houston Rockets	0	1	0	0	0	1	0	0	119	49	22
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	98	65	26
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	100	60	22
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	115	52	26
CHI	Chicago Bulls	1	0	0	0	1	0	0	0	116	47	27
IND	Indiana Pacers	1	0	1	0	0	0	0	0	111	48	26
ORL	Orlando Magic	0	1	0	0	0	1	0	0	106	40	24
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	116	44	32
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	119	54	22
NYK	New York Knicks	0	1	0	1	0	0	0	0	104	46	30
SAS	San Antonio Spurs	1	0	0	0	1	0	0	0	111	57	26
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	113	51	28
MIA	Miami Heat	0	1	0	0	0	1	0	0	86	44	12
CLE	Cleveland Cavaliers	1	0	1	0	0	0	0	0	110	66	19
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	104	42	21
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	108	55	28
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	109	51	19
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	104	60	25
DET	Detroit Pistons	0	1	0	0	0	1	0	0	90	50	22
UTA	Utah Jazz	1	0	1	0	0	0	0	0	128	57	29
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	120	47	21
HOU	Houston Rockets	0	1	0	1	0	0	0	0	123	62	26
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	137	58	28
NYK	New York Knicks	0	1	0	1	0	0	0	0	101	54	22
BRK	Brooklyn Nets	1	0	0	0	1	0	0	0	103	49	18
WAS	Washington Wizards	0	1	0	1	0	0	0	0	106	52	29
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	113	47	22
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	116	57	24
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	104	41	25
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	134	65	27
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	109	57	26
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	106	59	24
BRK	Brooklyn Nets	1	0	0	0	1	0	0	0	108	54	29
DET	Detroit Pistons	1	0	1	0	0	0	0	0	103	55	23
ORL	Orlando Magic	0	1	0	0	0	1	0	0	88	52	15
IND	Indiana Pacers	1	0	1	0	0	0	0	0	126	55	29
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	114	46	30
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	113	58	26
MIN	Minnesota Timberwolves	1	0	0	0	1	0	0	0	125	57	27
BOS	Boston Celtics	1	0	1	0	0	0	0	0	103	51	20
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	102	46	28
MIA	Miami Heat	1	0	1	0	0	0	0	0	117	58	29
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	100	40	25
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	101	53	27
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	96	60	25
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	94	44	24
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	117	61	23
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	122	58	21
UTA	Utah Jazz	0	1	0	0	0	1	0	0	118	45	29
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	104	52	23
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	114	49	28
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	97	50	27
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	100	51	26
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	99	54	16
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	114	67	22
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	117	67	31
WAS	Washington Wizards	0	1	0	0	0	1	0	0	104	44	26
BOS	Boston Celtics	1	0	1	0	0	0	0	0	121	63	23
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	110	53	32
CHO	Charlotte Hornets	1	0	1	0	0	0	0	0	102	49	27
DET	Detroit Pistons	0	1	0	0	0	1	0	0	101	56	23
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	104	56	20
ORL	Orlando Magic	1	0	0	0	1	0	0	0	116	42	23
IND	Indiana Pacers	1	0	1	0	0	0	0	0	121	55	23
UTA	Utah Jazz	0	1	0	0	0	1	0	0	102	46	19
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	97	56	20
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	91	50	22
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	126	58	26
NYK	New York Knicks	0	1	0	0	0	1	0	0	98	53	19
HOU	Houston Rockets	1	0	1	0	0	0	0	0	117	53	19
MIA	Miami Heat	0	1	0	0	0	1	0	0	108	49	22
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	119	59	26
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	121	51	30
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	111	55	25
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	102	64	22
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	101	50	25
MIN	Minnesota Timberwolves	1	0	0	0	1	0	0	0	113	63	28
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	132	45	29
WAS	Washington Wizards	1	0	0	0	1	0	0	0	140	42	32
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	110	55	20
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	114	48	25
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	136	57	23
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	119	45	19
GSW	Golden State Warriors	1	0	1	0	0	0	0	0	104	61	31
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	90	51	20
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	112	58	30
BOS	Boston Celtics	0	1	0	0	0	1	0	0	107	53	16
DET	Detroit Pistons	0	1	0	1	0	0	0	0	107	57	27
CHO	Charlotte Hornets	1	0	0	0	1	0	0	0	110	42	26
ORL	Orlando Magic	0	1	0	1	0	0	0	0	83	62	17
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	90	58	21
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	110	49	32
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	119	49	28
NYK	New York Knicks	0	1	0	1	0	0	0	0	95	49	14
PHI	Philadelphia 76ers	1	0	0	0	1	0	0	0	101	58	22
IND	Indiana Pacers	1	0	1	0	0	0	1	0	105	55	19
ATL	Atlanta Hawks	0	1	0	0	0	1	0	1	104	57	14
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	94	64	22
UTA	Utah Jazz	1	0	0	0	1	0	0	0	103	61	18
MIA	Miami Heat	1	0	1	0	0	0	0	0	122	58	23
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	105	39	19
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	109	51	27
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	104	56	19
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	107	54	28
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	97	56	23
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	113	54	29
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	120	60	20
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	107	59	20
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	103	60	24
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	125	56	29
WAS	Washington Wizards	0	1	0	0	0	1	0	0	103	53	25
SAC	Sacramento Kings	1	0	1	0	0	0	1	0	100	63	22
DEN	Denver Nuggets	0	1	0	0	0	1	0	1	97	57	23
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	119	42	27
IND	Indiana Pacers	0	1	0	0	0	1	0	0	116	39	22
HOU	Houston Rockets	1	0	1	0	0	0	0	0	158	64	30
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	111	34	26
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	137	56	41
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	96	57	21
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	106	56	24
MIA	Miami Heat	1	0	0	0	1	0	0	0	109	62	16
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	107	59	22
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	115	61	27
NYK	New York Knicks	0	1	0	1	0	0	0	0	104	55	15
BOS	Boston Celtics	1	0	0	0	1	0	0	0	113	55	25
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	100	50	25
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	114	60	24
DET	Detroit Pistons	1	0	1	0	0	0	0	0	132	58	33
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	98	38	20
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	104	46	22
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	107	52	19
ORL	Orlando Magic	1	0	1	0	0	0	0	0	100	60	21
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	96	57	21
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	130	48	36
UTA	Utah Jazz	0	1	0	0	0	1	0	0	110	59	21
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	150	59	22
WAS	Washington Wizards	0	1	0	0	0	1	0	0	125	53	32
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	104	61	27
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	109	47	30
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	103	59	24
UTA	Utah Jazz	0	1	0	0	0	1	0	0	94	52	23
ATL	Atlanta Hawks	1	0	1	0	0	0	0	0	104	47	21
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	79	54	17
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	104	45	23
IND	Indiana Pacers	1	0	0	0	1	0	0	0	117	53	31
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	132	71	30
NYK	New York Knicks	0	1	0	0	0	1	0	0	88	53	13
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	106	48	22
CHI	Chicago Bulls	1	0	0	0	1	0	0	0	113	41	20
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	94	48	16
DET	Detroit Pistons	1	0	0	0	1	0	0	0	127	55	33
WAS	Washington Wizards	0	1	0	1	0	0	0	0	120	42	22
ORL	Orlando Magic	1	0	0	0	1	0	0	0	127	58	26
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	97	56	20
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	118	59	22
TOR	Toronto Raptors	0	1	0	1	0	0	0	1	110	59	25
MIA	Miami Heat	1	0	0	0	1	0	1	0	121	63	29
SAS	San Antonio Spurs	1	0	1	0	0	0	1	0	135	71	35
HOU	Houston Rockets	0	1	0	0	0	1	0	1	133	66	22
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	96	42	26
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	105	68	24
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	117	63	25
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	97	54	20
CHO	Charlotte Hornets	1	0	1	0	0	0	0	0	106	52	30
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	91	45	18
DET	Detroit Pistons	0	1	0	1	0	0	0	0	103	47	25
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	127	63	25
ORL	Orlando Magic	1	0	1	0	0	0	0	0	128	53	27
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	114	39	36
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	118	43	24
BRK	Brooklyn Nets	1	0	0	0	1	0	0	0	130	60	26
BOS	Boston Celtics	1	0	1	0	0	0	0	0	112	52	21
MIA	Miami Heat	0	1	0	0	0	1	0	0	93	47	20
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	106	58	22
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	99	58	24
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	100	43	25
IND	Indiana Pacers	1	0	0	0	1	0	0	0	107	49	19
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	121	54	24
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	114	52	23
UTA	Utah Jazz	0	1	0	1	0	0	0	0	96	53	20
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	121	55	27
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	127	51	28
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	116	47	26
WAS	Washington Wizards	1	0	1	0	0	0	0	0	119	47	25
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	113	50	25
NYK	New York Knicks	0	1	0	1	0	0	0	0	92	45	23
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	129	58	38
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	109	51	27
HOU	Houston Rockets	1	0	0	0	1	0	0	0	119	62	29
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	1	132	55	27
PHO	Phoenix Suns	1	0	0	0	1	0	1	0	139	54	30
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	104	40	23
BRK	Brooklyn Nets	1	0	0	0	1	0	0	0	111	58	35
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	87	50	22
ORL	Orlando Magic	1	0	0	0	1	0	0	0	93	54	19
DET	Detroit Pistons	1	0	1	0	0	0	0	0	108	63	21
IND	Indiana Pacers	0	1	0	0	0	1	0	0	101	41	24
BOS	Boston Celtics	1	0	1	0	0	0	0	0	108	44	21
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	95	53	18
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	98	40	21
GSW	Golden State Warriors	1	0	0	0	1	0	0	0	100	51	24
MIA	Miami Heat	1	0	1	0	0	0	0	0	112	59	28
WAS	Washington Wizards	0	1	0	0	0	1	0	0	103	44	29
OKC	Oklahoma City Thunder	1	0	1	0	0	0	1	0	139	50	19
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	1	127	45	25
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	119	59	29
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	91	58	18
SAS	San Antonio Spurs	1	0	1	0	0	0	1	0	105	60	25
SAC	Sacramento Kings	0	1	0	0	0	1	0	1	104	65	19
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	113	40	20
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	136	56	26
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	130	63	25
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	84	44	17
NYK	New York Knicks	0	1	0	1	0	0	0	0	103	61	24
IND	Indiana Pacers	1	0	0	0	1	0	0	0	104	49	26
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	141	58	43
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	94	46	20
HOU	Houston Rockets	1	0	1	0	0	0	0	0	115	61	21
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	109	63	29
UTA	Utah Jazz	1	0	1	0	0	0	0	0	126	47	32
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	112	36	23
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	105	58	25
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	102	49	25
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	107	53	22
ATL	Atlanta Hawks	1	0	0	0	1	0	0	0	122	54	28
MIA	Miami Heat	1	0	1	0	0	0	1	0	110	58	20
CHI	Chicago Bulls	0	1	0	0	0	1	0	1	105	46	20
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	110	47	31
TOR	Toronto Raptors	0	1	0	0	0	1	0	0	104	50	21
WAS	Washington Wizards	0	1	0	1	0	0	0	0	119	45	28
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	135	61	27
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	106	47	24
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	110	42	24
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	96	60	16
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	108	64	12
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	142	46	32
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	125	39	27
IND	Indiana Pacers	0	1	0	1	0	0	0	0	99	68	16
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	110	66	19
BOS	Boston Celtics	1	0	1	0	0	0	0	0	110	44	22
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	88	57	18
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	92	54	30
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	93	68	19
HOU	Houston Rockets	0	1	0	1	0	0	0	0	118	60	25
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	119	38	24
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	110	64	30
ORL	Orlando Magic	0	1	0	0	0	1	0	0	101	54	24
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	103	58	24
DET	Detroit Pistons	1	0	0	0	1	0	0	0	105	54	15
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	125	49	31
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	109	54	14
UTA	Utah Jazz	0	1	0	1	0	0	0	0	90	51	19
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	104	52	21
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	102	56	23
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	110	51	29
CHO	Charlotte Hornets	1	0	1	0	0	0	0	0	114	59	22
WAS	Washington Wizards	0	1	0	0	0	1	0	0	107	51	27
MIA	Miami Heat	1	0	1	0	0	0	1	0	135	67	35
ATL	Atlanta Hawks	0	1	0	0	0	1	0	1	121	47	30
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	97	61	24
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	92	45	29
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	115	65	20
NYK	New York Knicks	0	1	0	0	0	1	0	0	87	59	16
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	110	48	29
HOU	Houston Rockets	1	0	0	0	1	0	0	0	116	42	18
IND	Indiana Pacers	1	0	1	0	0	0	0	0	122	47	27
BOS	Boston Celtics	0	1	0	0	0	1	0	0	117	52	25
ORL	Orlando Magic	0	1	0	1	0	0	0	0	87	54	20
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	96	58	20
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	92	52	21
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	112	59	29
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	108	66	20
CHO	Charlotte Hornets	1	0	0	0	1	0	0	0	113	53	20
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	136	47	32
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	102	50	26
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	116	48	18
UTA	Utah Jazz	1	0	0	0	1	0	0	0	127	49	23
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	108	48	29
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	115	63	23
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	127	46	27
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	112	51	29
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	94	54	12
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	93	50	24
GSW	Golden State Warriors	0	1	0	1	0	0	0	1	122	53	27
NYK	New York Knicks	1	0	0	0	1	0	1	0	124	69	25
BOS	Boston Celtics	0	1	0	1	0	0	0	0	109	41	24
PHI	Philadelphia 76ers	1	0	0	0	1	0	0	0	115	56	27
SAS	San Antonio Spurs	0	1	0	1	0	0	0	1	109	47	19
CLE	Cleveland Cavaliers	1	0	0	0	1	0	1	0	117	60	22
DET	Detroit Pistons	0	1	0	1	0	0	0	0	111	47	23
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	122	59	25
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	114	58	25
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	99	43	22
MIA	Miami Heat	0	1	0	1	0	0	0	0	110	44	24
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	113	60	26
ORL	Orlando Magic	0	1	0	1	0	0	0	0	107	46	24
HOU	Houston Rockets	1	0	0	0	1	0	0	0	130	48	21
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	116	60	24
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	109	56	24
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	100	59	24
IND	Indiana Pacers	1	0	0	0	1	0	0	0	110	53	28
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	73	50	20
CHO	Charlotte Hornets	1	0	0	0	1	0	0	0	83	68	21
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	114	50	27
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	127	63	22
UTA	Utah Jazz	1	0	1	0	0	0	0	0	114	51	22
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	106	55	19
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	117	46	17
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	124	51	16
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	101	46	19
NYK	New York Knicks	1	0	0	0	1	0	0	0	103	55	24
PHO	Phoenix Suns	0	1	0	1	0	0	0	1	119	67	29
SAS	San Antonio Spurs	1	0	0	0	1	0	1	0	121	69	23
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	110	60	21
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	102	72	24
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	109	53	21
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	106	50	20
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	128	58	32
WAS	Washington Wizards	0	1	0	0	0	1	0	0	111	37	22
DAL	Dallas Mavericks	0	1	0	1	0	0	0	1	118	58	30
MIA	Miami Heat	1	0	0	0	1	0	1	0	122	62	27
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	125	47	26
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	108	52	27
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	110	52	30
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	102	42	22
HOU	Houston Rockets	0	1	0	1	0	0	0	0	107	55	18
DET	Detroit Pistons	1	0	0	0	1	0	0	0	115	67	27
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	119	46	34
ORL	Orlando Magic	1	0	0	0	1	0	0	0	130	49	32
IND	Indiana Pacers	1	0	1	0	0	0	0	0	107	56	30
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	85	69	18
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	96	50	18
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	101	65	21
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	109	61	22
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	89	50	19
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	111	54	27
NYK	New York Knicks	0	1	0	0	0	1	0	0	105	53	20
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	79	34	24
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	100	44	27
DET	Detroit Pistons	0	1	0	1	0	0	0	0	119	51	29
WAS	Washington Wizards	1	0	0	0	1	0	0	0	133	47	31
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	133	45	31
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	113	46	30
HOU	Houston Rockets	1	0	1	0	0	0	0	0	109	66	20
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	107	56	23
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	118	56	28
MIA	Miami Heat	0	1	0	0	0	1	0	0	111	46	22
MIL	Milwaukee Bucks	0	1	0	1	0	0	0	0	116	60	29
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	120	60	27
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	109	48	21
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	106	37	27
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	110	53	31
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	111	46	21
CHO	Charlotte Hornets	1	0	1	0	0	0	0	0	110	62	26
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	102	42	23
IND	Indiana Pacers	1	0	1	0	0	0	0	0	105	57	22
LAL	Los Angeles Lakers	0	1	0	0	0	1	0	0	102	51	28
NYK	New York Knicks	1	0	1	0	0	0	0	0	143	61	30
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	120	47	20
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	1	101	73	20
BRK	Brooklyn Nets	1	0	0	0	1	0	1	0	108	67	25
UTA	Utah Jazz	1	0	1	0	0	0	0	0	109	64	27
ORL	Orlando Magic	0	1	0	0	0	1	0	0	102	45	21
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	120	55	23
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	99	59	30
CLE	Cleveland Cavaliers	1	0	1	0	0	0	0	0	100	59	25
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	98	40	25
DET	Detroit Pistons	0	1	0	1	0	0	0	0	99	55	19
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	112	55	27
PHI	Philadelphia 76ers	0	1	0	1	0	0	0	0	104	48	24
MIA	Miami Heat	1	0	0	0	1	0	0	0	108	55	26
WAS	Washington Wizards	0	1	0	1	0	0	0	1	109	68	21
CHI	Chicago Bulls	1	0	0	0	1	0	1	0	110	59	25
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	99	58	20
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	107	63	23
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	126	44	25
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	122	53	27
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	113	58	28
ORL	Orlando Magic	0	1	0	0	0	1	0	0	104	41	25
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	103	47	23
BOS	Boston Celtics	1	0	0	0	1	0	0	0	109	65	13
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	122	67	19
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	112	60	24
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	106	48	24
UTA	Utah Jazz	1	0	0	0	1	0	0	0	111	59	18
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	111	53	22
LAL	Los Angeles Lakers	0	1	0	0	0	1	0	0	104	45	24
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	118	54	26
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	105	53	16
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	117	46	23
HOU	Houston Rockets	1	0	0	0	1	0	0	0	122	51	23
CLE	Cleveland Cavaliers	1	0	1	0	0	0	0	0	114	67	26
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	107	51	31
IND	Indiana Pacers	1	0	1	0	0	0	0	0	119	46	34
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	105	50	25
BOS	Boston Celtics	1	0	1	0	0	0	0	0	114	56	24
DET	Detroit Pistons	0	1	0	0	0	1	0	0	93	47	21
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	122	55	26
WAS	Washington Wizards	0	1	0	0	0	1	0	0	118	50	24
MIA	Miami Heat	1	0	1	0	0	0	0	0	129	57	34
NYK	New York Knicks	0	1	0	0	0	1	0	0	114	50	23
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	126	47	23
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	108	45	26
PHI	Philadelphia 76ers	0	1	0	1	0	0	0	0	98	50	25
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	117	53	23
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	109	52	27
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	100	54	20
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	118	58	16
ORL	Orlando Magic	0	1	0	0	0	1	0	0	103	61	21
GSW	Golden State Warriors	1	0	1	0	0	0	0	0	106	50	25
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	102	60	23
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	107	41	20
UTA	Utah Jazz	1	0	0	0	1	0	0	0	114	47	27
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	122	76	23
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	112	57	17
DET	Detroit Pistons	0	1	0	1	0	0	0	0	107	34	30
CHI	Chicago Bulls	1	0	0	0	1	0	0	0	119	55	21
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	125	63	28
WAS	Washington Wizards	0	1	0	0	0	1	0	0	108	47	18
NYK	New York Knicks	0	1	0	1	0	0	0	0	102	56	23
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	123	64	26
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	119	49	32
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	115	62	22
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	109	43	24
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	134	51	32
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	125	53	26
HOU	Houston Rockets	1	0	0	0	1	0	0	0	139	39	23
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	113	61	19
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	106	48	16
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	110	61	21
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	107	61	27
BOS	Boston Celtics	1	0	1	0	0	0	0	0	119	66	25
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	93	34	26
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	117	71	31
IND	Indiana Pacers	0	1	0	0	0	1	0	0	89	57	27
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	118	53	24
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	112	50	22
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	104	50	18
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	128	50	31
CLE	Cleveland Cavaliers	1	0	1	0	0	0	0	0	121	55	19
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	118	47	23
DET	Detroit Pistons	0	1	0	1	0	0	0	0	109	40	27
PHI	Philadelphia 76ers	1	0	0	0	1	0	0	0	125	51	33
IND	Indiana Pacers	1	0	1	0	0	0	1	0	120	55	34
TOR	Toronto Raptors	0	1	0	0	0	1	0	1	115	60	30
NYK	New York Knicks	0	1	0	1	0	0	0	0	115	49	29
WAS	Washington Wizards	1	0	0	0	1	0	0	0	121	69	27
ORL	Orlando Magic	1	0	1	0	0	0	0	0	103	53	23
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	95	53	20
MIA	Miami Heat	1	0	1	0	0	0	0	0	107	64	16
UTA	Utah Jazz	0	1	0	0	0	1	0	0	104	47	17
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	115	39	28
SAS	San Antonio Spurs	1	0	0	0	1	0	0	0	145	51	36
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	111	44	29
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	113	43	31
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	94	55	17
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	102	61	23
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	104	62	20
HOU	Houston Rockets	1	0	0	0	1	0	0	0	113	43	18
GSW	Golden State Warriors	1	0	1	0	0	0	0	0	113	62	27
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	104	50	16
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	102	39	17
BOS	Boston Celtics	1	0	0	0	1	0	0	0	118	55	26
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	121	57	29
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	0	109	55	23
GSW	Golden State Warriors	1	0	1	0	0	0	0	0	116	61	27
HOU	Houston Rockets	0	1	0	0	0	1	0	0	104	53	19
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	106	52	24
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	111	64	24
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	100	51	24
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	112	57	23
DET	Detroit Pistons	1	0	1	0	0	0	0	0	132	57	32
WAS	Washington Wizards	0	1	0	0	0	1	0	0	102	50	18
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	82	59	17
NYK	New York Knicks	1	0	0	0	1	0	0	0	94	66	16
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	102	57	22
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	98	48	18
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	97	42	23
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	110	55	26
SAC	Sacramento Kings	0	1	0	1	0	0	0	1	104	75	20
MIN	Minnesota Timberwolves	1	0	0	0	1	0	1	0	105	73	23
UTA	Utah Jazz	1	0	1	0	0	0	0	0	121	44	22
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	115	49	14
BOS	Boston Celtics	1	0	1	0	0	0	0	0	129	50	28
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	117	48	22
CHO	Charlotte Hornets	0	1	0	1	0	0	0	1	102	63	26
OKC	Oklahoma City Thunder	1	0	0	0	1	0	1	0	104	64	19
ORL	Orlando Magic	1	0	1	0	0	0	0	0	98	60	26
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	97	56	23
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	86	51	20
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	112	62	29
MIA	Miami Heat	1	0	1	0	0	0	0	0	113	60	29
IND	Indiana Pacers	0	1	0	0	0	1	0	0	112	39	27
GSW	Golden State Warriors	1	0	1	0	0	0	0	0	105	49	22
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	96	55	22
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	119	52	28
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	110	52	32
BOS	Boston Celtics	0	1	0	1	0	0	0	0	97	41	18
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	113	60	27
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	120	56	25
IND	Indiana Pacers	0	1	0	0	0	1	0	0	98	53	17
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	116	58	22
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	81	47	24
HOU	Houston Rockets	1	0	1	0	0	0	0	0	108	67	16
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	98	62	24
MIA	Miami Heat	1	0	1	0	0	0	1	0	117	55	26
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	1	116	57	24
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	88	46	17
CLE	Cleveland Cavaliers	1	0	0	0	1	0	0	0	94	74	13
WAS	Washington Wizards	0	1	0	1	0	0	0	0	100	59	16
NYK	New York Knicks	1	0	0	0	1	0	0	0	107	64	25
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	121	46	28
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	141	50	35
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	111	64	30
ORL	Orlando Magic	0	1	0	0	0	1	0	0	100	38	21
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	136	55	30
DET	Detroit Pistons	0	1	0	0	0	1	0	0	109	51	20
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	110	47	19
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	112	47	30
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	120	48	18
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	128	50	32
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	107	51	22
UTA	Utah Jazz	1	0	0	0	1	0	0	0	120	56	25
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	97	47	21
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	98	48	15
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	120	43	23
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	115	44	32
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	117	55	30
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	104	53	23
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	127	55	32
HOU	Houston Rockets	0	1	0	0	0	1	0	0	112	47	29
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	108	52	28
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	95	52	17
ORL	Orlando Magic	0	1	0	1	0	0	0	0	93	50	22
ATL	Atlanta Hawks	1	0	0	0	1	0	0	0	101	57	21
WAS	Washington Wizards	1	0	1	0	0	0	0	0	123	48	26
MIA	Miami Heat	0	1	0	0	0	1	0	0	105	53	18
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	102	49	26
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	123	63	29
MIN	Minnesota Timberwolves	1	0	1	0	0	0	1	0	122	70	20
BRK	Brooklyn Nets	0	1	0	0	0	1	0	1	115	66	22
UTA	Utah Jazz	1	0	1	0	0	0	0	0	104	54	20
DET	Detroit Pistons	0	1	0	0	0	1	0	0	81	49	14
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	116	51	24
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	122	54	29
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	92	50	25
BOS	Boston Celtics	1	0	0	0	1	0	0	0	109	62	25
IND	Indiana Pacers	1	0	1	0	0	0	0	0	115	49	35
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	97	58	24
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	87	49	20
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	105	57	21
HOU	Houston Rockets	1	0	1	0	0	0	0	0	130	58	20
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	104	47	25
SAS	San Antonio Spurs	1	0	1	0	0	0	1	0	117	61	30
GSW	Golden State Warriors	0	1	0	0	0	1	0	1	113	51	31
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	117	50	29
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	97	52	21
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	106	66	18
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	101	59	19
WAS	Washington Wizards	0	1	0	1	0	0	0	0	101	53	18
ORL	Orlando Magic	1	0	0	0	1	0	0	0	122	63	25
NYK	New York Knicks	1	0	1	0	0	0	0	0	117	66	29
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	93	53	17
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	106	67	24
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	104	60	18
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	117	54	25
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	107	53	32
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	106	48	26
CHO	Charlotte Hornets	1	0	0	0	1	0	0	0	109	45	25
IND	Indiana Pacers	0	1	0	1	0	0	0	0	116	38	32
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	124	52	27
MIA	Miami Heat	1	0	1	0	0	0	0	0	84	60	23
TOR	Toronto Raptors	0	1	0	0	0	1	0	0	76	57	20
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	98	55	22
UTA	Utah Jazz	1	0	0	0	1	0	0	0	102	50	24
MIN	Minnesota Timberwolves	1	0	1	0	0	0	0	0	99	62	22
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	84	52	20
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	123	51	22
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	111	46	29
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	103	52	22
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	109	54	19
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	128	50	26
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	123	50	31
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	126	55	29
DET	Detroit Pistons	0	1	0	0	0	1	0	0	112	57	20
BOS	Boston Celtics	1	0	1	0	0	0	0	0	109	66	23
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	106	51	26
ORL	Orlando Magic	1	0	1	0	0	0	0	0	105	52	25
MIA	Miami Heat	0	1	0	0	0	1	0	0	85	54	16
WAS	Washington Wizards	0	1	0	1	0	0	0	0	103	57	19
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	122	54	16
HOU	Houston Rockets	1	0	1	0	0	0	0	0	118	56	22
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	108	54	32
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	120	55	28
NYK	New York Knicks	0	1	0	0	0	1	0	0	112	61	19
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	123	52	29
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	113	51	24
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	114	54	20
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	140	58	36
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	102	50	24
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	121	55	21
ORL	Orlando Magic	0	1	0	1	0	0	0	0	96	51	21
UTA	Utah Jazz	1	0	0	0	1	0	0	0	109	55	22
ATL	Atlanta Hawks	1	0	1	0	0	0	0	0	116	50	22
IND	Indiana Pacers	0	1	0	0	0	1	0	0	111	49	24
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	106	47	19
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	121	60	24
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	104	45	23
BOS	Boston Celtics	1	0	0	0	1	0	0	0	111	52	22
WAS	Washington Wizards	1	0	1	0	0	0	0	0	128	56	20
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	114	43	18
DAL	Dallas Mavericks	0	1	0	1	0	0	0	1	120	45	28
CHO	Charlotte Hornets	1	0	0	0	1	0	1	0	123	56	27
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	104	47	26
DET	Detroit Pistons	1	0	0	0	1	0	0	0	111	49	24
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	127	53	23
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	118	57	20
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	115	59	20
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	117	54	28
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	135	47	25
NYK	New York Knicks	0	1	0	0	0	1	0	0	132	46	22
MIA	Miami Heat	1	0	1	0	0	0	0	0	122	53	34
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	111	45	21
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	103	49	15
MIN	Minnesota Timberwolves	1	0	0	0	1	0	0	0	118	50	32
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	114	51	25
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	121	47	31
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	106	58	23
DET	Detroit Pistons	0	1	0	0	0	1	0	0	99	53	21
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	104	44	21
IND	Indiana Pacers	1	0	0	0	1	0	0	0	115	47	31
ORL	Orlando Magic	1	0	1	0	0	0	0	0	101	66	21
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	89	56	20
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	120	46	31
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	113	60	17
WAS	Washington Wizards	1	0	1	0	0	0	0	0	99	57	18
BOS	Boston Celtics	0	1	0	0	0	1	0	0	94	65	17
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	115	46	24
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	123	53	27
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	126	55	23
UTA	Utah Jazz	1	0	0	0	1	0	0	0	128	48	19
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	118	50	25
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	110	49	25
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	126	59	23
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	0	104	44	24
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	111	49	27
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	98	57	19
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	113	53	29
DET	Detroit Pistons	1	0	0	0	1	0	0	0	115	43	26
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	99	66	21
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	101	52	23
BRK	Brooklyn Nets	0	1	0	1	0	0	0	1	103	59	19
OKC	Oklahoma City Thunder	1	0	0	0	1	0	1	0	111	62	19
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	119	48	22
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	112	51	23
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	103	44	24
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	114	50	18
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	117	53	27
NYK	New York Knicks	0	1	0	0	0	1	0	0	87	56	15
BOS	Boston Celtics	0	1	0	1	0	0	0	0	114	46	26
SAS	San Antonio Spurs	1	0	0	0	1	0	0	0	129	50	28
CHO	Charlotte Hornets	0	1	0	1	0	0	0	1	110	62	30
TOR	Toronto Raptors	1	0	0	0	1	0	1	0	112	51	34
IND	Indiana Pacers	0	1	0	1	0	0	0	0	108	45	25
MIA	Miami Heat	1	0	0	0	1	0	0	0	122	48	28
ORL	Orlando Magic	1	0	1	0	0	0	0	0	123	60	24
WAS	Washington Wizards	0	1	0	0	0	1	0	0	89	47	24
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	115	65	20
HOU	Houston Rockets	1	0	0	0	1	0	0	0	122	68	22
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	106	44	27
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	107	50	27
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	123	63	31
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	108	49	22
UTA	Utah Jazz	1	0	1	0	0	0	0	0	128	58	29
NYK	New York Knicks	0	1	0	0	0	1	0	0	104	47	18
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	98	58	29
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	107	55	22
DET	Detroit Pistons	0	1	0	1	0	0	0	1	112	54	20
CLE	Cleveland Cavaliers	1	0	0	0	1	0	1	0	115	51	24
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	109	57	24
BOS	Boston Celtics	0	1	0	0	0	1	0	0	98	43	17
MIN	Minnesota Timberwolves	1	0	1	0	0	0	0	0	116	64	25
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	102	58	14
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	113	58	22
HOU	Houston Rockets	0	1	0	0	0	1	0	0	92	46	16
WAS	Washington Wizards	1	0	1	0	0	0	0	0	111	72	26
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	101	69	19
NYK	New York Knicks	0	1	0	1	0	0	0	0	111	54	26
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	123	52	35
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	117	56	31
MIA	Miami Heat	0	1	0	0	0	1	0	0	113	43	26
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	105	40	16
IND	Indiana Pacers	1	0	0	0	1	0	0	0	116	47	31
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	134	55	39
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	121	43	29
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	98	52	19
ORL	Orlando Magic	0	1	0	0	0	1	0	0	94	58	15
UTA	Utah Jazz	1	0	1	0	0	0	0	0	109	43	28
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	92	44	20
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	114	62	19
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	129	56	18
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	106	50	26
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	127	59	29
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	109	60	27
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	100	55	28
HOU	Houston Rockets	1	0	1	0	0	0	0	0	139	65	29
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	109	58	28
BOS	Boston Celtics	1	0	1	0	0	0	0	0	140	60	29
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	105	54	29
DET	Detroit Pistons	0	1	0	1	0	0	0	0	99	51	22
CHI	Chicago Bulls	1	0	0	0	1	0	0	0	108	42	24
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	110	42	23
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	125	59	21
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	109	66	22
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	91	47	22
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	103	48	23
CLE	Cleveland Cavaliers	1	0	0	0	1	0	0	0	111	58	22
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	101	56	17
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	122	68	21
NYK	New York Knicks	1	0	1	0	0	0	0	0	124	45	24
MIA	Miami Heat	0	1	0	0	0	1	0	0	121	45	24
WAS	Washington Wizards	0	1	0	1	0	0	0	0	116	45	28
UTA	Utah Jazz	1	0	0	0	1	0	0	0	127	49	24
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	108	74	25
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	86	41	23
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	122	65	33
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	102	57	23
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	104	56	30
SAS	San Antonio Spurs	1	0	0	0	1	0	0	0	105	60	24
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	114	53	24
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	104	47	21
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	100	58	22
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	92	46	25
DET	Detroit Pistons	0	1	0	1	0	0	0	1	110	56	27
NOP	New Orleans Pelicans	1	0	0	0	1	0	1	0	117	73	23
IND	Indiana Pacers	1	0	1	0	0	0	0	0	101	56	24
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	95	59	17
BOS	Boston Celtics	1	0	1	0	0	0	0	0	113	50	28
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	101	46	16
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	104	44	23
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	117	58	25
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	115	51	26
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	112	48	24
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	112	48	25
ORL	Orlando Magic	1	0	0	0	1	0	0	0	114	52	17
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	128	50	33
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	99	52	21
ATL	Atlanta Hawks	1	0	1	0	0	0	0	0	123	55	25
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	110	48	20
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	107	51	22
UTA	Utah Jazz	1	0	0	0	1	0	0	0	118	48	19
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	121	49	29
HOU	Houston Rockets	0	1	0	0	0	1	0	0	110	50	18
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	128	64	27
NYK	New York Knicks	0	1	0	0	0	1	0	0	102	61	26
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	97	44	27
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	124	62	23
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	128	58	29
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	103	48	25
BOS	Boston Celtics	0	1	0	1	0	0	0	0	103	50	21
DET	Detroit Pistons	1	0	0	0	1	0	0	0	116	40	30
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	117	57	25
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	106	56	20
MIA	Miami Heat	1	0	1	0	0	0	0	0	106	60	26
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	100	46	22
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	115	50	26
WAS	Washington Wizards	0	1	0	0	0	1	0	0	106	46	25
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	99	49	26
IND	Indiana Pacers	1	0	0	0	1	0	0	0	104	49	27
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	121	39	32
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	130	41	33
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	100	52	28
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	86	53	28
HOU	Houston Rockets	0	1	0	1	0	0	0	0	107	59	24
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	117	66	22
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	123	51	28
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	127	53	24
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	118	53	34
ORL	Orlando Magic	1	0	0	0	1	0	0	0	119	57	22
NYK	New York Knicks	0	1	0	1	0	0	0	0	98	49	21
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	121	60	31
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	128	60	21
BOS	Boston Celtics	0	1	0	0	0	1	0	0	123	55	16
NOP	New Orleans Pelicans	1	0	1	0	0	0	1	0	138	58	29
UTA	Utah Jazz	0	1	0	0	0	1	0	1	132	55	23
GSW	Golden State Warriors	0	1	0	1	0	0	0	1	131	49	36
DEN	Denver Nuggets	1	0	0	0	1	0	1	0	134	64	31
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	122	69	29
ORL	Orlando Magic	0	1	0	0	0	1	0	0	95	48	24
IND	Indiana Pacers	1	0	1	0	0	0	0	0	116	50	24
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	114	42	22
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	100	46	30
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	89	46	21
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	140	48	35
WAS	Washington Wizards	0	1	0	0	0	1	0	0	111	49	19
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	113	49	32
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	109	60	18
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	108	38	29
MIA	Miami Heat	1	0	0	0	1	0	0	0	115	59	26
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	120	51	28
ATL	Atlanta Hawks	1	0	0	0	1	0	0	0	121	51	21
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	120	56	19
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	112	48	25
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	130	63	32
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	133	45	22
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	97	54	23
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	117	63	30
BOS	Boston Celtics	0	1	0	1	0	0	0	0	119	48	26
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	123	59	27
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	103	42	18
DET	Detroit Pistons	1	0	0	0	1	0	0	0	136	54	31
NYK	New York Knicks	0	1	0	1	0	0	0	0	87	62	20
PHI	Philadelphia 76ers	1	0	0	0	1	0	0	0	90	49	26
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	118	33	25
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	116	45	27
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	112	60	34
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	122	47	25
GSW	Golden State Warriors	1	0	1	0	0	0	0	0	109	51	25
ORL	Orlando Magic	0	1	0	0	0	1	0	0	95	52	21
HOU	Houston Rockets	0	1	0	1	0	0	0	0	115	55	20
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	124	58	25
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	119	59	25
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	106	48	11
UTA	Utah Jazz	1	0	1	0	0	0	0	0	123	50	24
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	101	42	20
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	107	48	27
MIA	Miami Heat	0	1	0	0	0	1	0	0	102	53	23
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	107	58	22
IND	Indiana Pacers	1	0	0	0	1	0	0	0	115	45	31
WAS	Washington Wizards	1	0	1	0	0	0	0	0	106	51	22
DET	Detroit Pistons	0	1	0	0	0	1	0	0	100	49	19
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	117	61	26
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	122	55	25
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	111	58	22
PHI	Philadelphia 76ers	1	0	0	0	1	0	0	0	117	55	30
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	83	48	21
ORL	Orlando Magic	1	0	0	0	1	0	0	0	106	57	25
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	86	59	15
NYK	New York Knicks	1	0	0	0	1	0	0	0	106	55	17
HOU	Houston Rockets	0	1	0	1	0	0	0	0	107	54	21
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	112	63	14
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	116	62	26
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	126	50	24
MIA	Miami Heat	1	0	1	0	0	0	1	0	118	52	26
SAC	Sacramento Kings	0	1	0	0	0	1	0	1	113	58	27
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	111	61	34
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	98	44	18
BOS	Boston Celtics	1	0	1	0	0	0	0	0	139	60	31
LAL	Los Angeles Lakers	0	1	0	0	0	1	0	0	107	48	22
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	100	46	26
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	107	59	26
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	118	49	26
SAS	San Antonio Spurs	1	0	0	0	1	0	0	0	120	42	30
UTA	Utah Jazz	1	0	1	0	0	0	0	0	118	60	22
IND	Indiana Pacers	0	1	0	0	0	1	0	0	88	38	23
POR	Portland Trail Blazers	1	0	1	0	0	0	1	0	129	61	21
GSW	Golden State Warriors	0	1	0	0	0	1	0	1	124	69	30
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	107	61	23
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	110	66	19
DET	Detroit Pistons	1	0	1	0	0	0	0	0	127	53	19
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	106	55	23
ORL	Orlando Magic	0	1	0	1	0	0	0	0	114	46	26
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	120	40	22
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	107	61	27
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	95	49	25
ATL	Atlanta Hawks	1	0	1	0	0	0	0	0	102	71	21
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	95	58	19
BOS	Boston Celtics	1	0	1	0	0	0	0	0	119	51	32
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	95	50	24
MIA	Miami Heat	1	0	1	0	0	0	1	0	134	50	29
WAS	Washington Wizards	0	1	0	0	0	1	0	1	129	50	30
NYK	New York Knicks	0	1	0	1	0	0	0	0	92	57	24
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	100	54	18
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	117	58	21
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	110	50	27
HOU	Houston Rockets	1	0	1	0	0	0	0	0	121	60	26
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	105	45	25
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	87	53	13
IND	Indiana Pacers	1	0	0	0	1	0	0	0	112	50	26
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	117	50	26
SAS	San Antonio Spurs	1	0	0	0	1	0	0	0	121	51	17
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	96	44	20
UTA	Utah Jazz	1	0	0	0	1	0	0	0	129	67	31
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	112	47	24
WAS	Washington Wizards	1	0	0	0	1	0	0	0	124	51	28
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	113	48	30
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	128	58	28
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	125	53	20
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	133	49	27
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	103	46	24
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	116	62	26
DET	Detroit Pistons	0	1	0	1	0	0	0	0	112	48	23
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	125	51	27
ORL	Orlando Magic	0	1	0	1	0	0	0	0	98	53	18
BOS	Boston Celtics	1	0	0	0	1	0	0	0	109	55	27
NYK	New York Knicks	0	1	0	1	0	0	0	0	112	56	26
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	118	37	25
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	81	52	23
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	98	48	24
MIA	Miami Heat	0	1	0	1	0	0	0	0	117	58	25
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	122	54	33
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	124	54	28
HOU	Houston Rockets	1	0	0	0	1	0	0	0	131	48	24
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	106	55	24
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	113	67	26
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	140	57	28
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	111	41	24
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	99	52	19
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	103	47	25
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	118	44	31
IND	Indiana Pacers	1	0	0	0	1	0	0	0	129	40	35
UTA	Utah Jazz	1	0	1	0	0	0	0	0	112	62	22
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	107	55	19
DET	Detroit Pistons	0	1	0	1	0	0	0	1	111	59	20
BRK	Brooklyn Nets	1	0	0	0	1	0	1	0	121	63	19
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	106	47	30
CHI	Chicago Bulls	1	0	0	0	1	0	0	0	118	44	24
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	104	50	33
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	113	48	20
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	108	50	19
LAL	Los Angeles Lakers	0	1	0	0	0	1	0	0	91	42	23
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	117	54	28
HOU	Houston Rockets	0	1	0	0	0	1	0	0	110	53	19
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	106	54	27
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	110	57	31
ATL	Atlanta Hawks	1	0	1	0	0	0	0	0	152	54	30
WAS	Washington Wizards	0	1	0	0	0	1	0	0	133	40	20
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	114	58	25
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	109	54	23
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	123	65	31
BOS	Boston Celtics	0	1	0	0	0	1	0	0	108	45	21
NYK	New York Knicks	1	0	1	0	0	0	0	0	110	58	19
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	97	46	21
ORL	Orlando Magic	0	1	0	1	0	0	0	0	97	57	27
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	112	60	20
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	139	54	27
IND	Indiana Pacers	0	1	0	0	0	1	0	0	129	37	31
DET	Detroit Pistons	0	1	0	1	0	0	0	0	100	48	18
CLE	Cleveland Cavaliers	1	0	0	0	1	0	0	0	115	54	25
MIA	Miami Heat	1	0	1	0	0	0	0	0	113	49	31
ORL	Orlando Magic	0	1	0	0	0	1	0	0	92	49	23
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	110	53	28
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	109	56	21
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	1	129	61	29
SAC	Sacramento Kings	1	0	0	0	1	0	1	0	133	49	27
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	97	53	23
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	107	62	21
UTA	Utah Jazz	0	1	0	1	0	0	0	0	117	52	24
HOU	Houston Rockets	1	0	0	0	1	0	0	0	126	54	14
CHO	Charlotte Hornets	1	0	1	0	0	0	0	0	97	62	22
NYK	New York Knicks	0	1	0	0	0	1	0	0	92	50	17
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	115	56	28
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	104	46	29
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	111	52	25
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	125	52	29
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	130	59	26
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	114	52	28
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	104	50	32
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	96	51	23
MIA	Miami Heat	0	1	0	1	0	0	0	0	101	56	15
BOS	Boston Celtics	1	0	0	0	1	0	0	0	109	55	24
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	151	53	31
WAS	Washington Wizards	0	1	0	0	0	1	0	0	131	45	28
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	104	45	19
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	133	42	34
IND	Indiana Pacers	1	0	1	0	0	0	1	0	115	56	26
CHI	Chicago Bulls	0	1	0	0	0	1	0	1	106	38	26
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	125	43	26
DET	Detroit Pistons	0	1	0	0	0	1	0	0	115	53	25
NYK	New York Knicks	0	1	0	1	0	0	0	0	106	57	26
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	127	53	25
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	127	40	23
UTA	Utah Jazz	0	1	0	0	0	1	0	0	120	60	18
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	125	60	24
HOU	Houston Rockets	0	1	0	0	0	1	0	0	112	47	21
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	100	45	22
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	120	55	32
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	109	55	23
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	115	45	23
WAS	Washington Wizards	1	0	1	0	0	0	0	0	121	65	24
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	107	45	32
ATL	Atlanta Hawks	1	0	1	0	0	0	0	0	127	56	29
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	117	51	22
BOS	Boston Celtics	1	0	1	0	0	0	0	0	119	59	27
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	104	37	24
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	106	52	25
UTA	Utah Jazz	0	1	0	0	0	1	0	0	100	45	24
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	103	53	26
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	124	56	27
DET	Detroit Pistons	0	1	0	1	0	0	0	0	92	54	18
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	105	50	26
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	133	42	31
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	118	43	27
HOU	Houston Rockets	1	0	1	0	0	0	0	0	128	47	25
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	121	62	29
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	139	67	30
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	111	43	17
MIL	Milwaukee Bucks	0	1	0	1	0	0	0	0	115	58	29
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	127	55	29
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	107	46	20
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	111	54	26
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	119	64	28
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	127	50	25
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	118	56	20
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	106	55	24
IND	Indiana Pacers	0	1	0	1	0	0	0	0	85	42	21
NYK	New York Knicks	1	0	0	0	1	0	0	0	92	64	19
ORL	Orlando Magic	0	1	0	1	0	0	0	0	89	43	21
MIA	Miami Heat	1	0	0	0	1	0	0	0	102	59	24
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	112	52	26
GSW	Golden State Warriors	1	0	0	0	1	0	0	0	131	46	39
WAS	Washington Wizards	1	0	1	0	0	0	0	0	113	61	21
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	107	68	25
BOS	Boston Celtics	1	0	1	0	0	0	0	0	116	55	15
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	95	54	15
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	123	55	26
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	100	55	19
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	114	53	27
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	90	46	29
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	113	52	21
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	129	52	33
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	124	60	20
UTA	Utah Jazz	0	1	0	0	0	1	0	0	107	42	19
DET	Detroit Pistons	1	0	1	0	0	0	1	0	128	52	33
DEN	Denver Nuggets	0	1	0	0	0	1	0	1	123	53	30
HOU	Houston Rockets	1	0	1	0	0	0	0	0	117	50	22
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	109	74	21
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	129	68	30
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	108	56	20
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	129	54	28
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	102	51	25
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	100	54	24
ORL	Orlando Magic	1	0	0	0	1	0	0	0	112	43	35
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	1	134	44	34
NYK	New York Knicks	1	0	0	0	1	0	1	0	139	53	33
IND	Indiana Pacers	0	1	0	1	0	0	0	0	103	48	28
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	112	58	20
WAS	Washington Wizards	0	1	0	1	0	0	0	0	117	46	28
GSW	Golden State Warriors	1	0	0	0	1	0	0	0	125	51	31
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	115	42	22
BOS	Boston Celtics	1	0	0	0	1	0	0	0	123	46	21
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	119	53	28
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	97	52	23
MIA	Miami Heat	1	0	1	0	0	0	0	0	137	40	27
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	106	53	24
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	96	57	27
DET	Detroit Pistons	0	1	0	0	0	1	0	0	82	60	21
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	113	45	26
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	109	54	25
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	108	56	28
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	105	52	21
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	108	62	26
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	120	63	34
HOU	Houston Rockets	1	0	1	0	0	0	0	0	125	47	25
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	110	60	22
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	127	67	30
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	99	43	16
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	129	65	28
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	102	35	21
DET	Detroit Pistons	1	0	1	0	0	0	0	0	116	49	31
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	108	42	29
BOS	Boston Celtics	1	0	1	0	0	0	0	0	116	49	23
ORL	Orlando Magic	0	1	0	0	0	1	0	0	100	46	20
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	129	75	29
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	88	42	20
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	119	42	27
IND	Indiana Pacers	0	1	0	0	0	1	0	0	118	46	29
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	120	44	18
ATL	Atlanta Hawks	1	0	0	0	1	0	0	0	127	50	23
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	109	49	21
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	103	53	31
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	107	49	19
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	121	60	27
UTA	Utah Jazz	0	1	0	1	0	0	0	0	95	54	20
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	98	57	23
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	128	59	35
MIA	Miami Heat	0	1	0	0	0	1	0	0	111	49	29
NYK	New York Knicks	1	0	1	0	0	0	0	0	105	52	27
ORL	Orlando Magic	0	1	0	0	0	1	0	0	103	48	22
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	119	50	25
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	125	52	38
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	112	66	19
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	101	58	24
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	125	56	28
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	117	44	25
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	111	49	33
HOU	Houston Rockets	1	0	0	0	1	0	0	0	121	45	20
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	119	57	34
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	107	51	25
WAS	Washington Wizards	1	0	1	0	0	0	0	0	119	45	28
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	118	55	27
BOS	Boston Celtics	1	0	1	0	0	0	0	0	112	53	23
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	107	54	21
IND	Indiana Pacers	0	1	0	1	0	0	0	0	106	55	26
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	115	45	28
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	108	49	21
DET	Detroit Pistons	0	1	0	0	0	1	0	0	101	49	19
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	127	55	29
HOU	Houston Rockets	0	1	0	0	0	1	0	0	91	40	16
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	105	43	29
MIA	Miami Heat	0	1	0	0	0	1	0	0	97	56	21
UTA	Utah Jazz	1	0	1	0	0	0	0	0	117	63	21
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	114	48	14
ORL	Orlando Magic	0	1	0	1	0	0	0	0	95	50	28
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	111	69	26
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	100	45	15
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	116	52	29
DET	Detroit Pistons	0	1	0	1	0	0	0	0	92	35	21
NYK	New York Knicks	1	0	0	0	1	0	0	0	95	58	24
IND	Indiana Pacers	0	1	0	1	0	0	0	0	117	45	25
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	124	56	27
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	119	58	22
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	118	53	27
MIN	Minnesota Timberwolves	1	0	1	0	0	0	0	0	142	53	39
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	115	46	24
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	120	39	31
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	125	60	29
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	108	45	25
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	117	46	23
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	122	46	25
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	102	47	23
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	111	49	14
BOS	Boston Celtics	1	0	0	0	1	0	0	0	112	58	19
ATL	Atlanta Hawks	1	0	1	0	0	0	1	0	140	58	29
NYK	New York Knicks	0	1	0	0	0	1	0	1	135	69	30
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	118	52	29
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	111	48	23
WAS	Washington Wizards	0	1	0	1	0	0	0	0	99	59	25
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	106	82	19
HOU	Houston Rockets	0	1	0	1	0	0	0	0	113	46	20
UTA	Utah Jazz	1	0	0	0	1	0	0	0	114	56	25
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	92	52	22
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	133	60	28
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	115	56	20
MIA	Miami Heat	0	1	0	0	0	1	0	0	109	57	31
DET	Detroit Pistons	0	1	0	1	0	0	0	0	76	59	21
CHO	Charlotte Hornets	1	0	0	0	1	0	0	0	87	53	19
IND	Indiana Pacers	0	1	0	1	0	0	0	0	105	48	28
BRK	Brooklyn Nets	1	0	0	0	1	0	0	0	106	62	20
ORL	Orlando Magic	1	0	1	0	0	0	0	0	135	55	33
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	126	37	33
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	137	47	29
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	126	48	24
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	123	63	26
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	111	58	23
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	119	34	24
UTA	Utah Jazz	1	0	0	0	1	0	0	0	123	52	27
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	127	43	34
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	120	43	33
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	101	46	23
MIA	Miami Heat	1	0	0	0	1	0	0	0	113	55	36
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	125	66	28
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	100	36	26
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	110	60	25
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	103	52	25
WAS	Washington Wizards	1	0	1	0	0	0	0	0	126	47	28
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	114	51	25
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	138	55	40
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	117	49	21
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	106	41	19
SAS	San Antonio Spurs	1	0	0	0	1	0	0	0	114	54	20
HOU	Houston Rockets	1	0	1	0	0	0	0	0	116	48	17
BOS	Boston Celtics	0	1	0	0	0	1	0	0	105	54	24
CLE	Cleveland Cavaliers	1	0	1	0	0	0	0	0	127	60	25
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	105	43	24
ORL	Orlando Magic	1	0	1	0	0	0	1	0	116	54	34
DET	Detroit Pistons	0	1	0	0	0	1	0	1	112	53	28
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	101	64	27
TOR	Toronto Raptors	0	1	0	0	0	1	0	0	91	52	21
IND	Indiana Pacers	1	0	1	0	0	0	0	0	118	50	28
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	0	111	51	18
NYK	New York Knicks	0	1	0	1	0	0	0	0	96	62	19
WAS	Washington Wizards	1	0	0	0	1	0	0	0	114	51	25
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	111	63	26
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	104	60	21
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	108	58	25
CHO	Charlotte Hornets	1	0	0	0	1	0	0	0	115	65	22
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	130	56	34
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	111	48	26
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	112	46	25
GSW	Golden State Warriors	0	1	0	0	0	1	0	0	106	44	27
UTA	Utah Jazz	1	0	1	0	0	0	0	0	116	58	23
MIA	Miami Heat	0	1	0	0	0	1	0	0	101	43	19
DEN	Denver Nuggets	0	1	0	1	0	0	0	1	116	50	32
LAL	Los Angeles Lakers	1	0	0	0	1	0	1	0	120	58	29
BOS	Boston Celtics	1	0	1	0	0	0	1	0	141	66	22
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	1	133	70	19
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	118	52	31
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	123	49	28
DET	Detroit Pistons	0	1	0	1	0	0	0	0	106	53	25
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	126	44	24
ATL	Atlanta Hawks	1	0	1	0	0	0	0	0	129	49	22
MIA	Miami Heat	0	1	0	0	0	1	0	0	124	62	28
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	93	50	24
CHO	Charlotte Hornets	1	0	0	0	1	0	0	0	103	50	22
PHI	Philadelphia 76ers	1	0	1	0	0	0	1	0	112	54	19
BRK	Brooklyn Nets	0	1	0	0	0	1	0	1	104	69	22
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	129	38	22
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	125	60	25
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	105	46	26
HOU	Houston Rockets	1	0	0	0	1	0	0	0	135	43	31
ORL	Orlando Magic	0	1	0	1	0	0	0	0	106	55	21
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	122	58	26
WAS	Washington Wizards	0	1	0	1	0	0	0	0	108	61	24
CLE	Cleveland Cavaliers	1	0	0	0	1	0	0	0	113	57	19
NYK	New York Knicks	0	1	0	1	0	0	0	0	98	52	21
IND	Indiana Pacers	1	0	0	0	1	0	0	0	106	61	20
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	118	57	24
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	101	41	29
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	117	51	23
BOS	Boston Celtics	1	0	0	0	1	0	0	0	127	66	21
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	113	47	19
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	101	45	19
UTA	Utah Jazz	0	1	0	1	0	0	0	0	104	53	25
SAS	San Antonio Spurs	1	0	0	0	1	0	0	0	113	52	22
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	117	61	25
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	105	63	22
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	115	53	20
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	128	56	36
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	103	57	20
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	112	55	25
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	86	58	22
BRK	Brooklyn Nets	1	0	0	0	1	0	0	0	115	58	26
ATL	Atlanta Hawks	1	0	1	0	0	0	0	0	111	63	27
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	107	56	23
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	104	49	18
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	112	54	26
MIA	Miami Heat	1	0	1	0	0	0	0	0	124	34	34
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	105	52	29
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	119	63	35
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	98	51	17
UTA	Utah Jazz	0	1	0	1	0	0	0	0	110	57	18
HOU	Houston Rockets	1	0	0	0	1	0	0	0	120	47	20
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	114	59	20
BOS	Boston Celtics	0	1	0	0	0	1	0	0	112	52	20
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	128	50	29
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	116	50	26
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	127	66	32
IND	Indiana Pacers	0	1	0	0	0	1	0	0	81	51	23
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	126	47	27
WAS	Washington Wizards	0	1	0	0	0	1	0	0	117	40	24
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	131	60	28
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	103	48	27
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	101	57	28
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	115	59	34
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	107	51	20
DET	Detroit Pistons	0	1	0	0	0	1	0	0	104	49	18
CLE	Cleveland Cavaliers	1	0	1	0	0	0	1	0	125	65	25
MIA	Miami Heat	0	1	0	0	0	1	0	1	119	55	33
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	129	54	27
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	112	52	19
WAS	Washington Wizards	0	1	0	1	0	0	0	1	134	51	27
MIL	Milwaukee Bucks	1	0	0	0	1	0	1	0	137	50	26
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	113	53	29
ORL	Orlando Magic	1	0	0	0	1	0	0	0	115	48	27
HOU	Houston Rockets	1	0	1	0	0	0	0	0	123	51	20
NYK	New York Knicks	0	1	0	0	0	1	0	0	112	62	20
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	139	65	28
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	123	55	16
UTA	Utah Jazz	0	1	0	1	0	0	0	0	111	40	16
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	131	43	33
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	124	58	33
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	97	50	20
IND	Indiana Pacers	1	0	1	0	0	0	0	0	119	63	35
CHO	Charlotte Hornets	0	1	0	0	0	1	0	0	80	48	22
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	97	58	21
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	108	65	23
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	122	43	22
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	124	48	25
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	115	48	33
DET	Detroit Pistons	0	1	0	0	0	1	0	0	98	40	24
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	118	60	27
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	109	57	31
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	106	49	24
BOS	Boston Celtics	1	0	0	0	1	0	0	0	118	52	19
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	94	45	21
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	112	54	25
CHO	Charlotte Hornets	1	0	1	0	0	0	0	0	107	46	25
NYK	New York Knicks	0	1	0	0	0	1	0	0	101	52	22
CLE	Cleveland Cavaliers	1	0	1	0	0	0	0	0	108	56	24
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	94	41	22
WAS	Washington Wizards	1	0	1	0	0	0	0	0	110	50	22
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	106	70	15
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	120	51	30
ORL	Orlando Magic	1	0	0	0	1	0	0	0	130	61	30
MIA	Miami Heat	0	1	0	1	0	0	0	0	126	55	30
MIN	Minnesota Timberwolves	1	0	0	0	1	0	0	0	129	43	28
HOU	Houston Rockets	1	0	1	0	0	0	0	0	140	52	22
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	112	64	28
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	103	62	22
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	109	56	25
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	92	53	29
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	102	51	22
UTA	Utah Jazz	0	1	0	1	0	0	0	0	103	44	16
BOS	Boston Celtics	1	0	0	0	1	0	0	0	114	51	21
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	115	52	32
NYK	New York Knicks	0	1	0	0	0	1	0	0	106	48	28
IND	Indiana Pacers	1	0	1	0	0	0	0	0	106	55	21
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	100	53	14
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	112	47	20
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	108	54	30
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	86	43	27
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	116	56	24
ORL	Orlando Magic	1	0	1	0	0	0	0	0	136	66	36
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	125	40	27
ATL	Atlanta Hawks	1	0	1	0	0	0	0	0	141	61	32
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	118	49	30
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	96	56	19
CHO	Charlotte Hornets	1	0	0	0	1	0	0	0	99	66	23
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	101	64	27
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	104	49	24
MIA	Miami Heat	1	0	1	0	0	0	0	0	126	54	30
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	118	39	25
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	133	73	34
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	86	43	14
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	116	58	36
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	104	43	27
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	111	46	31
DET	Detroit Pistons	1	0	0	0	1	0	0	0	113	39	27
UTA	Utah Jazz	1	0	1	0	0	0	0	0	129	63	23
WAS	Washington Wizards	0	1	0	0	0	1	0	0	119	49	23
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	132	52	35
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	103	45	19
NYK	New York Knicks	1	0	1	0	0	0	0	0	125	63	29
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	115	40	26
ATL	Atlanta Hawks	1	0	1	0	0	0	0	0	129	41	34
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	117	53	14
MIA	Miami Heat	1	0	1	0	0	0	0	0	116	54	27
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	113	52	30
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	104	47	30
IND	Indiana Pacers	1	0	0	0	1	0	0	0	113	43	30
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	105	60	27
LAL	Los Angeles Lakers	0	1	0	0	0	1	0	0	88	50	26
BOS	Boston Celtics	0	1	0	1	0	0	0	1	110	65	22
HOU	Houston Rockets	1	0	0	0	1	0	1	0	111	63	17
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	114	44	28
ORL	Orlando Magic	0	1	0	0	0	1	0	0	113	50	28
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	99	53	24
GSW	Golden State Warriors	1	0	0	0	1	0	0	0	115	54	30
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	85	51	22
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	93	69	20
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	136	47	25
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	130	46	27
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	91	62	19
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	111	67	28
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	133	49	38
TOR	Toronto Raptors	0	1	0	0	0	1	0	0	118	47	24
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	106	59	18
DET	Detroit Pistons	0	1	0	0	0	1	0	0	100	53	23
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	114	65	24
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	122	44	23
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	110	58	25
WAS	Washington Wizards	1	0	0	0	1	0	0	0	124	41	24
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	113	41	28
UTA	Utah Jazz	1	0	0	0	1	0	0	0	126	52	30
NYK	New York Knicks	1	0	1	0	0	0	0	0	125	76	26
HOU	Houston Rockets	0	1	0	0	0	1	0	0	123	42	25
ORL	Orlando Magic	0	1	0	1	0	0	0	0	107	48	29
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	130	53	27
ATL	Atlanta Hawks	0	1	0	1	0	0	0	0	88	52	20
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	127	72	30
MIA	Miami Heat	1	0	1	0	0	0	0	0	105	53	28
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	0	89	59	19
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	109	50	24
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	107	55	26
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	111	39	21
IND	Indiana Pacers	1	0	0	0	1	0	0	0	116	44	22
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	103	53	25
SAS	San Antonio Spurs	1	0	0	0	1	0	0	0	104	40	25
BOS	Boston Celtics	0	1	0	1	0	0	0	1	120	59	24
BRK	Brooklyn Nets	1	0	0	0	1	0	1	0	129	72	22
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	134	55	37
MIN	Minnesota Timberwolves	1	0	0	0	1	0	0	0	139	50	31
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	0	94	54	16
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	109	52	19
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	100	60	22
GSW	Golden State Warriors	1	0	0	0	1	0	0	0	116	43	31
PHO	Phoenix Suns	0	1	0	1	0	0	0	0	114	46	30
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	123	56	17
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	120	48	25
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	107	47	24
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	133	50	23
WAS	Washington Wizards	0	1	0	0	0	1	0	0	126	38	28
CLE	Cleveland Cavaliers	0	1	0	1	0	0	0	0	106	53	24
BOS	Boston Celtics	1	0	0	0	1	0	0	0	112	53	16
DET	Detroit Pistons	0	1	0	1	0	0	0	0	107	47	27
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	114	39	25
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	119	62	26
IND	Indiana Pacers	0	1	0	0	0	1	0	0	100	48	22
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	79	52	15
MEM	Memphis Grizzlies	1	0	0	0	1	0	0	0	118	72	21
MIA	Miami Heat	1	0	1	0	0	0	0	0	116	41	31
ORL	Orlando Magic	0	1	0	0	0	1	0	0	113	42	28
NYK	New York Knicks	0	1	0	1	0	0	0	0	104	43	23
UTA	Utah Jazz	1	0	0	0	1	0	0	0	112	49	26
MIN	Minnesota Timberwolves	1	0	1	0	0	0	0	0	115	57	27
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	108	46	24
DAL	Dallas Mavericks	1	0	1	0	0	0	1	0	127	63	30
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	1	123	64	28
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	125	56	24
WAS	Washington Wizards	0	1	0	0	0	1	0	0	104	58	27
CHO	Charlotte Hornets	0	1	0	1	0	0	0	0	112	42	24
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	114	43	29
HOU	Houston Rockets	0	1	0	1	0	0	0	0	105	58	19
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	120	67	22
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	108	44	23
PHI	Philadelphia 76ers	1	0	0	0	1	0	0	0	125	50	24
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	113	66	34
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	121	45	28
WAS	Washington Wizards	1	0	1	0	0	0	0	0	118	44	24
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	112	44	25
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	139	63	32
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	120	43	25
NYK	New York Knicks	0	1	0	1	0	0	0	0	103	55	19
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	126	54	26
BOS	Boston Celtics	0	1	0	1	0	0	0	0	94	58	19
UTA	Utah Jazz	1	0	0	0	1	0	0	0	99	51	23
CHI	Chicago Bulls	0	1	0	1	0	0	0	0	102	53	27
IND	Indiana Pacers	1	0	0	0	1	0	0	0	108	52	24
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	118	44	30
ORL	Orlando Magic	1	0	0	0	1	0	0	0	132	53	31
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	110	65	28
MIA	Miami Heat	0	1	0	0	0	1	0	0	104	55	27
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	121	52	30
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	96	51	29
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	127	50	29
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	117	47	26
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	113	63	19
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	0	103	55	22
CHO	Charlotte Hornets	1	0	1	0	0	0	0	0	108	38	29
HOU	Houston Rockets	0	1	0	0	0	1	0	0	99	48	22
DET	Detroit Pistons	0	1	0	1	0	0	0	0	105	49	24
UTA	Utah Jazz	1	0	0	0	1	0	0	0	111	47	17
CLE	Cleveland Cavaliers	1	0	1	0	0	0	0	0	104	43	32
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	102	42	28
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	118	71	27
ATL	Atlanta Hawks	0	1	0	0	0	1	0	0	101	53	23
GSW	Golden State Warriors	1	0	1	0	0	0	0	0	118	43	30
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	114	46	29
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	111	50	22
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	123	53	30
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	110	61	21
CHI	Chicago Bulls	0	1	0	0	0	1	0	0	107	38	23
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	103	61	12
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	112	52	22
MIN	Minnesota Timberwolves	0	1	0	1	0	0	0	0	107	53	20
NOP	New Orleans Pelicans	1	0	0	0	1	0	0	0	120	66	28
BOS	Boston Celtics	0	1	0	1	0	0	0	0	104	55	22
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	105	56	16
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	140	52	30
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	0	131	39	23
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	109	50	19
IND	Indiana Pacers	1	0	0	0	1	0	0	0	112	58	23
HOU	Houston Rockets	0	1	0	1	0	0	0	0	106	50	21
ORL	Orlando Magic	1	0	0	0	1	0	0	0	126	58	21
WAS	Washington Wizards	0	1	0	1	0	0	0	0	89	38	19
MIA	Miami Heat	1	0	0	0	1	0	0	0	100	56	21
CLE	Cleveland Cavaliers	1	0	1	0	0	0	1	0	132	72	26
SAS	San Antonio Spurs	0	1	0	0	0	1	0	1	129	49	20
NYK	New York Knicks	1	0	1	0	0	0	0	0	96	61	15
DET	Detroit Pistons	0	1	0	0	0	1	0	0	84	50	21
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	113	53	24
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	118	46	27
ATL	Atlanta Hawks	1	0	1	0	0	0	1	0	143	68	33
CHO	Charlotte Hornets	0	1	0	0	0	1	0	1	138	43	31
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	109	55	28
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	0	95	61	23
UTA	Utah Jazz	0	1	0	1	0	0	0	0	92	42	24
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	101	61	22
IND	Indiana Pacers	0	1	0	1	0	0	0	0	111	48	23
BOS	Boston Celtics	1	0	0	0	1	0	0	0	114	55	19
WAS	Washington Wizards	1	0	1	0	0	0	0	0	122	48	23
NYK	New York Knicks	0	1	0	0	0	1	0	0	115	45	30
CHI	Chicago Bulls	1	0	1	0	0	0	0	0	108	49	23
CLE	Cleveland Cavaliers	0	1	0	0	0	1	0	0	103	42	29
HOU	Houston Rockets	1	0	1	0	0	0	0	0	117	45	24
MIN	Minnesota Timberwolves	0	1	0	0	0	1	0	0	111	49	21
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	115	52	24
ORL	Orlando Magic	1	0	0	0	1	0	0	0	120	47	31
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	119	47	32
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	109	52	23
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	121	51	20
PHO	Phoenix Suns	0	1	0	0	0	1	0	0	105	49	26
GSW	Golden State Warriors	0	1	0	1	0	0	0	0	107	41	25
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	131	52	28
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	102	55	24
BRK	Brooklyn Nets	1	0	0	0	1	0	0	0	104	56	24
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	124	59	28
DET	Detroit Pistons	0	1	0	0	0	1	0	0	106	41	25
ATL	Atlanta Hawks	0	1	0	1	0	0	0	1	131	60	26
NYK	New York Knicks	1	0	0	0	1	0	1	0	136	56	32
MIA	Miami Heat	0	1	0	1	0	0	0	0	98	38	32
CHO	Charlotte Hornets	1	0	0	0	1	0	0	0	109	57	20
DAL	Dallas Mavericks	1	0	1	0	0	0	0	0	113	60	23
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	97	43	23
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	104	56	22
UTA	Utah Jazz	1	0	0	0	1	0	0	0	106	54	17
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	103	53	21
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	101	55	17
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	118	47	30
ORL	Orlando Magic	1	0	0	0	1	0	0	0	128	50	31
POR	Portland Trail Blazers	1	0	1	0	0	0	1	0	140	50	27
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	1	135	60	25
WAS	Washington Wizards	0	1	0	1	0	0	0	0	112	46	18
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	125	46	29
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	119	55	25
BOS	Boston Celtics	0	1	0	0	0	1	0	0	112	57	18
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	129	46	32
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	120	54	22
DAL	Dallas Mavericks	0	1	0	1	0	0	0	1	149	69	30
HOU	Houston Rockets	1	0	0	0	1	0	1	0	153	54	26
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	105	47	28
MIA	Miami Heat	1	0	0	0	1	0	0	0	125	45	29
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	110	56	19
UTA	Utah Jazz	0	1	0	0	0	1	0	0	94	43	17
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	126	56	23
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	103	59	24
IND	Indiana Pacers	1	0	1	0	0	0	0	0	127	42	31
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	121	63	20
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	107	59	24
LAL	Los Angeles Lakers	0	1	0	0	0	1	0	0	92	55	17
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	118	58	23
WAS	Washington Wizards	0	1	0	0	0	1	0	0	110	54	26
BOS	Boston Celtics	1	0	1	0	0	0	0	0	128	46	24
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	124	43	31
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	106	46	27
SAS	San Antonio Spurs	1	0	0	0	1	0	0	0	108	65	22
ORL	Orlando Magic	1	0	1	0	0	0	0	0	132	51	31
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	116	45	30
HOU	Houston Rockets	1	0	1	0	0	0	0	0	120	43	22
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	0	116	69	21
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	117	55	22
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	115	57	22
MIA	Miami Heat	0	1	0	1	0	0	0	0	103	45	29
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	107	47	19
OKC	Oklahoma City Thunder	0	1	0	1	0	0	0	1	113	55	20
DEN	Denver Nuggets	1	0	0	0	1	0	1	0	121	56	23
WAS	Washington Wizards	0	1	0	1	0	0	0	0	100	55	30
IND	Indiana Pacers	1	0	0	0	1	0	0	0	111	52	20
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	109	65	25
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	99	53	25
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	132	42	26
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	130	53	21
UTA	Utah Jazz	0	1	0	1	0	0	0	0	108	49	25
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	116	47	23
MIL	Milwaukee Bucks	0	1	0	1	0	0	0	0	116	68	28
BRK	Brooklyn Nets	1	0	0	0	1	0	0	0	119	50	30
SAC	Sacramento Kings	0	1	0	1	0	0	0	1	110	60	26
DAL	Dallas Mavericks	1	0	0	0	1	0	1	0	114	73	22
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	115	55	21
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	117	47	25
IND	Indiana Pacers	1	0	1	0	0	0	0	0	120	40	29
ORL	Orlando Magic	0	1	0	0	0	1	0	0	109	49	21
MIA	Miami Heat	1	0	1	0	0	0	0	0	112	50	22
BOS	Boston Celtics	0	1	0	0	0	1	0	0	106	56	15
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	110	75	18
HOU	Houston Rockets	0	1	0	0	0	1	0	0	102	52	24
UTA	Utah Jazz	1	0	1	0	0	0	0	0	124	54	25
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	115	50	21
SAS	San Antonio Spurs	0	1	0	1	0	0	0	0	126	46	29
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	132	49	31
WAS	Washington Wizards	0	1	0	1	0	0	0	0	98	55	17
PHI	Philadelphia 76ers	1	0	0	0	1	0	0	0	107	52	27
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	86	56	17
OKC	Oklahoma City Thunder	1	0	0	0	1	0	0	0	105	60	17
ORL	Orlando Magic	0	1	0	1	0	0	0	0	99	53	26
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	109	56	25
BOS	Boston Celtics	1	0	1	0	0	0	0	0	149	53	29
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	115	45	23
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	140	52	26
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	125	41	31
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	130	49	27
MIA	Miami Heat	0	1	0	0	0	1	0	0	116	43	28
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	114	60	27
IND	Indiana Pacers	0	1	0	0	0	1	0	0	99	42	20
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	111	42	24
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	126	56	22
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	115	49	30
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	125	48	30
HOU	Houston Rockets	1	0	1	0	0	0	0	0	113	45	26
LAL	Los Angeles Lakers	0	1	0	0	0	1	0	0	97	59	18
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	119	54	27
UTA	Utah Jazz	0	1	0	0	0	1	0	0	111	54	25
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	121	62	24
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	92	44	19
BRK	Brooklyn Nets	1	0	1	0	0	0	0	0	119	53	30
SAC	Sacramento Kings	0	1	0	0	0	1	0	0	106	58	19
PHI	Philadelphia 76ers	1	0	1	0	0	0	0	0	108	62	19
ORL	Orlando Magic	0	1	0	0	0	1	0	0	101	59	17
NOP	New Orleans Pelicans	1	0	1	0	0	0	0	0	118	55	25
WAS	Washington Wizards	0	1	0	0	0	1	0	0	107	49	22
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	100	49	20
BOS	Boston Celtics	1	0	0	0	1	0	0	0	122	58	27
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	117	47	24
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	122	52	24
DEN	Denver Nuggets	1	0	1	0	0	0	1	0	134	61	29
UTA	Utah Jazz	0	1	0	0	0	1	0	1	132	67	34
IND	Indiana Pacers	1	0	1	0	0	0	0	0	116	48	25
LAL	Los Angeles Lakers	0	1	0	0	0	1	0	0	111	56	20
MIA	Miami Heat	0	1	0	1	0	0	0	0	112	41	28
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	119	54	27
DAL	Dallas Mavericks	1	0	1	0	0	0	1	0	136	66	37
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	1	132	66	26
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	121	49	25
WAS	Washington Wizards	0	1	0	0	0	1	0	0	103	55	23
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	108	52	25
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	99	52	24
NOP	New Orleans Pelicans	0	1	0	1	0	0	0	0	113	54	30
SAS	San Antonio Spurs	1	0	0	0	1	0	0	0	122	55	22
BOS	Boston Celtics	1	0	1	0	0	0	1	0	122	61	32
ORL	Orlando Magic	0	1	0	0	0	1	0	1	119	65	24
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	124	47	19
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	121	57	24
SAC	Sacramento Kings	0	1	0	1	0	0	0	0	112	48	29
HOU	Houston Rockets	1	0	0	0	1	0	0	0	129	54	21
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	120	42	23
BRK	Brooklyn Nets	1	0	0	0	1	0	0	0	129	51	32
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	128	61	29
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	101	46	24
UTA	Utah Jazz	0	1	0	1	0	0	0	0	114	45	28
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	122	42	29
MIL	Milwaukee Bucks	0	1	0	1	0	0	0	0	106	60	25
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	114	63	24
MIA	Miami Heat	1	0	1	0	0	0	0	0	114	67	29
IND	Indiana Pacers	0	1	0	0	0	1	0	0	92	53	20
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	124	42	28
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	121	42	27
ORL	Orlando Magic	0	1	0	1	0	0	0	0	96	56	13
BRK	Brooklyn Nets	1	0	0	0	1	0	0	0	108	55	26
SAS	San Antonio Spurs	1	0	1	0	0	0	0	0	123	62	28
HOU	Houston Rockets	0	1	0	0	0	1	0	0	105	42	18
PHI	Philadelphia 76ers	0	1	0	1	0	0	0	0	117	43	28
PHO	Phoenix Suns	1	0	0	0	1	0	0	0	130	49	28
MEM	Memphis Grizzlies	0	1	0	1	0	0	0	0	107	53	26
BOS	Boston Celtics	1	0	0	0	1	0	0	0	122	56	29
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	131	46	28
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	134	53	18
SAC	Sacramento Kings	1	0	1	0	0	0	0	0	112	49	27
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	106	41	25
WAS	Washington Wizards	0	1	0	1	0	0	0	0	113	54	22
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	126	60	25
HOU	Houston Rockets	0	1	0	1	0	0	0	0	104	57	20
IND	Indiana Pacers	1	0	0	0	1	0	0	0	108	66	25
PHI	Philadelphia 76ers	0	1	0	1	0	0	0	0	121	54	27
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	125	61	28
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	116	58	20
MIA	Miami Heat	0	1	0	0	0	1	0	0	115	44	24
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	111	49	33
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	124	46	29
BOS	Boston Celtics	0	1	0	1	0	0	0	0	90	54	22
WAS	Washington Wizards	1	0	0	0	1	0	0	0	96	61	22
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	122	52	29
SAC	Sacramento Kings	1	0	0	0	1	0	0	0	136	48	37
MEM	Memphis Grizzlies	1	0	1	0	0	0	0	0	119	64	36
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	0	106	55	27
PHO	Phoenix Suns	1	0	1	0	0	0	0	0	128	51	34
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	102	47	17
UTA	Utah Jazz	1	0	1	0	0	0	0	0	118	53	25
SAS	San Antonio Spurs	0	1	0	0	0	1	0	0	112	54	24
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	133	53	28
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	134	53	25
ORL	Orlando Magic	1	0	1	0	0	0	0	0	133	41	25
NOP	New Orleans Pelicans	0	1	0	0	0	1	0	0	127	48	22
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	117	57	27
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	109	46	27
IND	Indiana Pacers	1	0	1	0	0	0	0	0	109	57	32
MIA	Miami Heat	0	1	0	0	0	1	0	0	92	55	14
LAC	Los Angeles Clippers	1	0	1	0	0	0	1	0	107	71	23
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	1	103	69	18
HOU	Houston Rockets	0	1	0	1	0	0	0	0	96	31	25
PHI	Philadelphia 76ers	1	0	0	0	1	0	0	0	134	58	31
POR	Portland Trail Blazers	1	0	1	0	0	0	0	0	126	46	20
MEM	Memphis Grizzlies	0	1	0	0	0	1	0	0	122	57	30
DEN	Denver Nuggets	1	0	1	0	0	0	1	0	135	47	23
UTA	Utah Jazz	0	1	0	0	0	1	0	1	125	59	18
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	134	49	26
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	110	51	33
BOS	Boston Celtics	1	0	1	0	0	0	0	0	109	47	22
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	101	56	23
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	118	53	18
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	110	49	18
MIL	Milwaukee Bucks	0	1	0	1	0	0	0	0	110	54	28
ORL	Orlando Magic	1	0	0	0	1	0	0	0	122	53	29
IND	Indiana Pacers	0	1	0	1	0	0	0	0	101	45	22
MIA	Miami Heat	1	0	0	0	1	0	0	0	113	44	22
HOU	Houston Rockets	1	0	1	0	0	0	0	0	123	41	25
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	108	58	22
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	93	65	22
POR	Portland Trail Blazers	1	0	0	0	1	0	0	0	100	65	18
TOR	Toronto Raptors	1	0	1	0	0	0	0	0	104	56	22
BRK	Brooklyn Nets	0	1	0	0	0	1	0	0	99	62	25
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	105	49	22
UTA	Utah Jazz	1	0	0	0	1	0	0	0	124	45	32
BOS	Boston Celtics	1	0	1	0	0	0	0	0	128	53	20
PHI	Philadelphia 76ers	0	1	0	0	0	1	0	0	101	50	21
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	114	53	16
DAL	Dallas Mavericks	1	0	0	0	1	0	0	0	127	58	25
IND	Indiana Pacers	0	1	0	1	0	0	0	0	100	50	25
MIA	Miami Heat	1	0	0	0	1	0	0	0	109	48	27
HOU	Houston Rockets	1	0	1	0	0	0	0	0	111	48	21
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	98	53	15
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	111	65	26
ORL	Orlando Magic	0	1	0	0	0	1	0	0	96	48	18
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	111	55	26
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	88	49	14
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	92	53	24
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	117	62	35
UTA	Utah Jazz	1	0	1	0	0	0	0	0	124	54	27
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	87	50	20
PHI	Philadelphia 76ers	0	1	0	1	0	0	0	0	94	69	14
BOS	Boston Celtics	1	0	0	0	1	0	0	0	102	56	15
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	122	48	27
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	130	50	24
ORL	Orlando Magic	0	1	0	1	0	0	0	0	107	40	24
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	121	49	27
MIA	Miami Heat	1	0	1	0	0	0	0	0	124	59	23
IND	Indiana Pacers	0	1	0	0	0	1	0	0	115	41	23
OKC	Oklahoma City Thunder	1	0	1	0	0	0	1	0	119	68	20
HOU	Houston Rockets	0	1	0	0	0	1	0	1	107	55	14
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	108	44	17
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	116	67	26
PHI	Philadelphia 76ers	0	1	0	1	0	0	0	0	106	50	12
BOS	Boston Celtics	1	0	0	0	1	0	0	0	110	55	19
DAL	Dallas Mavericks	1	0	1	0	0	0	1	0	135	68	20
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	1	133	45	19
BRK	Brooklyn Nets	0	1	0	1	0	0	0	0	122	54	21
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	150	64	39
UTA	Utah Jazz	1	0	1	0	0	0	0	0	129	44	14
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	127	44	25
ORL	Orlando Magic	0	1	0	1	0	0	0	0	106	51	26
MIL	Milwaukee Bucks	1	0	0	0	1	0	0	0	121	57	29
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	117	56	16
HOU	Houston Rockets	0	1	0	0	0	1	0	0	114	45	25
MIA	Miami Heat	1	0	1	0	0	0	0	0	99	66	24
IND	Indiana Pacers	0	1	0	0	0	1	0	0	87	39	20
POR	Portland Trail Blazers	0	1	0	1	0	0	0	0	115	53	20
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	135	52	29
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	117	45	22
UTA	Utah Jazz	0	1	0	0	0	1	0	0	107	40	23
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	154	54	28
DAL	Dallas Mavericks	0	1	0	0	0	1	0	0	111	42	19
MIL	Milwaukee Bucks	1	0	1	0	0	0	0	0	118	63	27
ORL	Orlando Magic	0	1	0	0	0	1	0	0	104	53	22
HOU	Houston Rockets	1	0	1	0	0	0	0	0	114	65	28
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	80	68	11
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	131	46	27
POR	Portland Trail Blazers	0	1	0	0	0	1	0	0	122	53	20
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	94	49	22
BOS	Boston Celtics	1	0	0	0	1	0	0	0	112	59	25
DAL	Dallas Mavericks	0	1	0	1	0	0	0	0	97	53	20
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	111	54	22
UTA	Utah Jazz	0	1	0	1	0	0	0	0	107	36	20
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	119	49	22
MIL	Milwaukee Bucks	0	1	0	1	0	0	0	0	104	44	22
MIA	Miami Heat	1	0	0	0	1	0	0	0	115	53	21
OKC	Oklahoma City Thunder	1	0	1	0	0	0	0	0	104	56	17
HOU	Houston Rockets	0	1	0	0	0	1	0	0	100	46	19
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	99	51	25
BOS	Boston Celtics	1	0	0	0	1	0	0	0	102	52	18
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	80	54	21
UTA	Utah Jazz	0	1	0	0	0	1	0	0	78	55	16
MIL	Milwaukee Bucks	0	1	0	1	0	0	0	0	114	56	16
MIA	Miami Heat	1	0	0	0	1	0	0	0	116	49	22
HOU	Houston Rockets	1	0	1	0	0	0	0	0	104	48	18
OKC	Oklahoma City Thunder	0	1	0	0	0	1	0	0	102	53	24
BOS	Boston Celtics	0	1	0	1	0	0	0	0	103	53	21
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	104	50	23
LAC	Los Angeles Clippers	1	0	1	0	0	0	0	0	120	49	23
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	97	47	20
MIA	Miami Heat	1	0	1	0	0	0	0	0	115	57	27
MIL	Milwaukee Bucks	0	1	0	0	0	1	0	0	100	50	23
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	97	47	18
HOU	Houston Rockets	1	0	0	0	1	0	0	0	112	53	19
BOS	Boston Celtics	0	1	0	1	0	0	0	0	93	53	18
TOR	Toronto Raptors	1	0	0	0	1	0	0	0	100	52	23
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	101	65	20
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	110	50	18
MIA	Miami Heat	0	1	0	1	0	0	0	1	115	54	33
MIL	Milwaukee Bucks	1	0	0	0	1	0	1	0	118	50	25
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	117	49	30
HOU	Houston Rockets	0	1	0	0	0	1	0	0	109	43	22
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	89	43	19
BOS	Boston Celtics	1	0	0	0	1	0	0	0	111	53	23
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	107	43	32
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	113	49	23
MIL	Milwaukee Bucks	0	1	0	1	0	0	0	0	94	48	20
MIA	Miami Heat	1	0	0	0	1	0	0	0	103	57	21
HOU	Houston Rockets	0	1	0	1	0	0	0	0	102	33	23
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	112	52	25
BOS	Boston Celtics	0	1	0	1	0	0	0	1	122	66	32
TOR	Toronto Raptors	1	0	0	0	1	0	1	0	125	57	22
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	85	46	19
LAC	Los Angeles Clippers	1	0	0	0	1	0	0	0	96	53	19
HOU	Houston Rockets	0	1	0	1	0	0	0	0	100	33	24
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	110	59	30
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	105	47	22
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	111	52	20
TOR	Toronto Raptors	0	1	0	1	0	0	0	0	87	52	17
BOS	Boston Celtics	1	0	0	0	1	0	0	0	92	55	19
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	119	60	25
HOU	Houston Rockets	0	1	0	0	0	1	0	0	96	45	18
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	111	49	26
LAC	Los Angeles Clippers	0	1	0	0	0	1	0	0	98	42	20
BOS	Boston Celtics	0	1	0	1	0	0	0	1	114	48	24
MIA	Miami Heat	1	0	0	0	1	0	1	0	117	55	32
LAC	Los Angeles Clippers	0	1	0	1	0	0	0	0	89	42	21
DEN	Denver Nuggets	1	0	0	0	1	0	0	0	104	58	22
BOS	Boston Celtics	0	1	0	1	0	0	0	0	101	51	19
MIA	Miami Heat	1	0	0	0	1	0	0	0	106	42	27
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	126	48	33
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	114	48	23
MIA	Miami Heat	0	1	0	1	0	0	0	0	106	47	21
BOS	Boston Celtics	1	0	0	0	1	0	0	0	117	59	27
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	105	50	23
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	103	44	22
DEN	Denver Nuggets	1	0	1	0	0	0	0	0	114	53	26
LAL	Los Angeles Lakers	0	1	0	0	0	1	0	0	106	34	27
MIA	Miami Heat	1	0	1	0	0	0	0	0	112	49	20
BOS	Boston Celtics	0	1	0	0	0	1	0	0	109	53	28
DEN	Denver Nuggets	0	1	0	1	0	0	0	0	108	39	22
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	114	51	23
BOS	Boston Celtics	1	0	1	0	0	0	0	0	121	60	29
MIA	Miami Heat	0	1	0	0	0	1	0	0	108	48	27
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	117	48	24
DEN	Denver Nuggets	0	1	0	0	0	1	0	0	107	47	23
MIA	Miami Heat	1	0	1	0	0	0	0	0	125	51	30
BOS	Boston Celtics	0	1	0	0	0	1	0	0	113	47	26
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	116	62	26
MIA	Miami Heat	0	1	0	0	0	1	0	0	98	40	23
LAL	Los Angeles Lakers	1	0	1	0	0	0	0	0	124	52	32
MIA	Miami Heat	0	1	0	0	0	1	0	0	114	41	29
MIA	Miami Heat	1	0	1	0	0	0	0	0	115	43	25
LAL	Los Angeles Lakers	0	1	0	0	0	1	0	0	104	50	23
MIA	Miami Heat	0	1	0	1	0	0	0	0	96	44	18
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	102	51	25
LAL	Los Angeles Lakers	0	1	0	1	0	0	0	0	108	50	21
MIA	Miami Heat	1	0	0	0	1	0	0	0	111	43	26
MIA	Miami Heat	0	1	0	1	0	0	0	0	93	50	25
LAL	Los Angeles Lakers	1	0	0	0	1	0	0	0	106	54	23
\.


--
-- Data for Name: teams_players; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teams_players (id, team_id, player_id) FROM stdin;
\.


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.games_id_seq', 1, false);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.players_id_seq', 1, false);


--
-- Name: plays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plays_id_seq', 1, false);


--
-- Name: teams_players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teams_players_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

