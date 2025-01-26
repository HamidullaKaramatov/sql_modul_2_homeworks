use w3reourse

/* homework 1 
	find weekday names using recursive cte

	Col1
	Monday
	Tuesday
	Wednesday
	Thursday
	Friday
	Saturday
	Sunday
*/
--solution
select DATENAME(DW, 7)

;with cte as
(
	select 0 as n, DATENAME(WEEKDAY, 0) as weekday
	union all
	select n + 1, DATENAME(weekday, N+1) from cte
)
select top 7 * from cte


---HOMEWORK FROM w3reorse

--1-misol

-- Jadval yaratish: soccer_venue
CREATE TABLE soccer_venue (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(50),
    city_id INT,
    aud_capacity INT
);

-- Ma'lumotlar kiritish: soccer_venue
INSERT INTO soccer_venue VALUES 
(20001, 'Stade de Bordeaux', 10003, 42115),
(20002, 'Stade Bollaert-Delelis', 10004, 38223),
(20003, 'Stade Pierre Mauroy', 10005, 49822),
(20004, 'Stade de Lyon', 10006, 58585),
(20005, 'Stade VElodrome', 10007, 64354),
(20006, 'Stade de Nice', 10008, 35624),
(20007, 'Parc des Princes', 10001, 47294),
(20008, 'Stade de France', 10002, 80100),
(20009, 'Stade Geoffroy Guichard', 10009, 42000),
(20010, 'Stadium de Toulouse', 10010, 33150);

-- Jadval yaratish: soccer_city
CREATE TABLE soccer_city (
    city_id INT PRIMARY KEY,
    city VARCHAR(50),
    country_id INT
);

-- Ma'lumotlar kiritish: soccer_city
INSERT INTO soccer_city VALUES 
(10001, 'Paris', 1207),
(10002, 'Saint-Denis', 1207),
(10003, 'Bordeaux', 1207),
(10004, 'Lens', 1207),
(10005, 'Lille', 1207),
(10006, 'Lyon', 1207),
(10007, 'Marseille', 1207),
(10008, 'Nice', 1207),
(10009, 'Saint-Etienne', 1207),
(10010, 'Toulouse', 1207);

-- Jadval yaratish: match_mast
CREATE TABLE match_mast (
    match_no INT PRIMARY KEY,
    play_stage VARCHAR(10),
    play_date DATE,
    results VARCHAR(10),
    decided_by VARCHAR(1),
    goal_score VARCHAR(10),
    venue_id INT,
    referee_id INT,
    audience INT,
    plr_of_match INT,
    stop1_sec INT,
    stop2_sec INT
);

INSERT INTO match_mast (match_no, play_stage, play_date, results, decided_by, goal_score, venue_id, referee_id, audience, plr_of_match, stop1_sec, stop2_sec)
VALUES
(1, 'G', '2016-06-11', 'WIN', 'N', '2-1', 20008, 70007, 75113, 160154, 131, 242),
(2, 'G', '2016-06-11', 'WIN', 'N', '0-1', 20002, 70012, 33805, 160476, 61, 182),
(3, 'G', '2016-06-11', 'WIN', 'N', '2-1', 20001, 70017, 37831, 160540, 64, 268),
(4, 'G', '2016-06-12', 'DRAW', 'N', '1-1', 20005, 70011, 62343, 160128, 0, 185),
(5, 'G', '2016-06-12', 'WIN', 'N', '0-1', 20007, 70006, 43842, 160084, 125, 325),
(6, 'G', '2016-06-12', 'WIN', 'N', '1-0', 20006, 70014, 33742, 160291, 2, 246),
(7, 'G', '2016-06-13', 'WIN', 'N', '2-0', 20003, 70002, 43035, 160176, 89, 188),
(8, 'G', '2016-06-13', 'WIN', 'N', '1-0', 20010, 70009, 29400, 160429, 360, 182),
(9, 'G', '2016-06-13', 'DRAW', 'N', '1-1', 20008, 70010, 73419, 160335, 67, 194),
(10, 'G', '2016-06-14', 'WIN', 'N', '0-2', 20004, 70005, 55408, 160244, 63, 189),
(11, 'G', '2016-06-14', 'WIN', 'N', '0-2', 20001, 70018, 34424, 160197, 61, 305),
(12, 'G', '2016-06-15', 'DRAW', 'N', '1-1', 20009, 70004, 38742, 160320, 15, 284),
(13, 'G', '2016-06-15', 'WIN', 'N', '1-2', 20003, 70001, 38989, 160405, 62, 189),
(14, 'G', '2016-06-15', 'DRAW', 'N', '1-1', 20007, 70015, 43576, 160477, 74, 206),
(15, 'G', '2016-06-16', 'WIN', 'N', '2-0', 20005, 70013, 63670, 160154, 71, 374),
(16, 'G', '2016-06-16', 'WIN', 'N', '2-1', 20002, 70003, 34033, 160540, 62, 212),
(17, 'G', '2016-06-16', 'WIN', 'N', '0-2', 20004, 70016, 51043, 160262, 7, 411),
(18, 'G', '2016-06-17', 'DRAW', 'N', '0-0', 20008, 70008, 73648, 160165, 6, 208),
(19, 'G', '2016-06-17', 'WIN', 'N', '1-0', 20010, 70007, 29600, 160248, 2, 264),
(20, 'G', '2016-06-17', 'DRAW', 'N', '2-2', 20009, 70005, 38376, 160086, 71, 280),
(21, 'G', '2016-06-18', 'WIN', 'N', '3-0', 20006, 70010, 33409, 160429, 84, 120),
(22, 'G', '2016-06-18', 'WIN', 'N', '3-0', 20001, 70004, 39493, 160064, 11, 180),
(23, 'G', '2016-06-18', 'DRAW', 'N', '1-1', 20005, 70015, 60842, 160230, 61, 280),
(24, 'G', '2016-06-19', 'DRAW', 'N', '0-0', 20007, 70011, 44291, 160314, 3, 200),
(25, 'G', '2016-06-20', 'WIN', 'N', '0-1', 20004, 70016, 49752, 160005, 125, 328),
(26, 'G', '2016-06-20', 'DRAW', 'N', '0-0', 20003, 70001, 45616, 160463, 60, 122),
(27, 'G', '2016-06-21', 'WIN', 'N', '0-3', 20010, 70006, 28840, 160544, 62, 119),
(28, 'G', '2016-06-21', 'DRAW', 'N', '0-0', 20009, 70012, 39051, 160392, 62, 301),
(29, 'G', '2016-06-21', 'WIN', 'N', '0-1', 20005, 70017, 58874, 160520, 29, 244),
(30, 'G', '2016-06-21', 'WIN', 'N', '0-1', 20007, 70018, 44125, 160177, 21, 195),
(31, 'G', '2016-06-22', 'WIN', 'N', '0-2', 20002, 70013, 32836, 160504, 60, 300),
(32, 'G', '2016-06-22', 'WIN', 'N', '2-1', 20001, 70008, 37245, 160085, 70, 282),
(33, 'G', '2016-06-22', 'WIN', 'N', '2-1', 20008, 70009, 68714, 160220, 7, 244),
(34, 'G', '2016-06-22', 'DRAW', 'N', '3-3', 20004, 70002, 55514, 160322, 70, 185),
(35, 'G', '2016-06-23', 'WIN', 'N', '0-1', 20003, 70014, 44268, 160333, 79, 221),
(36, 'G', '2016-06-23', 'WIN', 'N', '0-1', 20006, 70003, 34011, 160062, 63, 195),
(37, 'R', '2016-06-25', 'WIN', 'P', '1-1', 20009, 70005, 38842, 160476, 126, 243),
(38, 'R', '2016-06-25', 'WIN', 'N', '1-0', 20007, 70002, 44342, 160547, 5, 245),
(39, 'R', '2016-06-26', 'WIN', 'N', '0-1', 20002, 70012, 33523, 160316, 61, 198),
(40, 'R', '2016-06-26', 'WIN', 'N', '2-1', 20004, 70011, 56279, 160160, 238, 203),
(41, 'R', '2016-06-26', 'WIN', 'N', '3-0', 20003, 70009, 44312, 160173, 62, 124),
(42, 'R', '2016-06-27', 'WIN', 'N', '0-4', 20010, 70010, 28921, 160062, 3, 133),
(43, 'R', '2016-06-27', 'WIN', 'N', '2-0', 20008, 70004, 76165, 160235, 63, 243),
(44, 'R', '2016-06-28', 'WIN', 'N', '1-2', 20006, 70001, 33901, 160217, 5, 199),
(45, 'Q', '2016-07-01', 'WIN', 'P', '1-1', 20005, 70003, 62940, 160316, 58, 181),
(46, 'Q', '2016-07-02', 'WIN', 'N', '3-1', 20003, 70001, 45936, 160550, 14, 182),
(47, 'Q', '2016-07-03', 'WIN', 'P', '1-1', 20001, 70007, 38764, 160163, 63, 181),
(48, 'Q', '2016-07-04', 'WIN', 'N', '5-2', 20008, 70008, 76833, 160159, 16, 125),
(49, 'S', '2016-07-07', 'WIN', 'N', '2-0', 20004, 70006, 55679, 160322, 2, 181),
(50, 'S', '2016-07-08', 'WIN', 'N', '2-0', 20005, 70011, 64078, 160160, 126, 275),
(51, 'F', '2016-07-11', 'WIN', 'N', '1-0', NULL, NULL, NULL, NULL, NULL, NULL);


select *  from soccer_venue 
select *  from soccer_city
select *  from match_mast

select venue_name,city from soccer_venue a
join soccer_city b
on a.city_id=b.city_id
join match_mast d 
on d.venue_id=a.venue_id
and d.play_stage='F'


--2-misol
CREATE TABLE match_details (
    match_no INT,
    play_stage VARCHAR(10),
    team_id INT,
    win_lose CHAR(1),
    decided_by CHAR(1),
    goal_score INT,
    penalty_score INT,
    ass_ref INT,
    player_gk INT
);

INSERT INTO match_details (match_no, play_stage, team_id, win_lose, decided_by, goal_score, penalty_score, ass_ref, player_gk)
VALUES
(1, 'G', 1207, 'W', 'N', 2, NULL, 80016, 160140),
(1, 'G', 1216, 'L', 'N', 1, NULL, 80020, 160348),
(2, 'G', 1201, 'L', 'N', 0, NULL, 80003, 160001),
(2, 'G', 1221, 'W', 'N', 1, NULL, 80023, 160463),
(3, 'G', 1224, 'W', 'N', 2, NULL, 80031, 160532),
(3, 'G', 1218, 'L', 'N', 1, NULL, 80025, 160392),
(4, 'G', 1206, 'D', 'N', 1, NULL, 80008, 160117),
(4, 'G', 1217, 'D', 'N', 1, NULL, 80019, 160369),
(5, 'G', 1222, 'L', 'N', 0, NULL, 80011, 160486),
(5, 'G', 1204, 'W', 'N', 1, NULL, 80022, 160071),
(6, 'G', 1213, 'W', 'N', 1, NULL, 80036, 160279),
(6, 'G', 1212, 'L', 'N', 0, NULL, 80029, 160256),
-- (and so on for all the rows in your provided data)
(51, 'F', 1214, 'W', 'N', 1, NULL, 80004, 160302),
(51, 'F', 1207, 'L', 'N', 0, NULL, 80007, 160140);

CREATE TABLE soccer_country (
    country_id INT,
    country_abbr VARCHAR(3),
    country_name VARCHAR(50)
);
INSERT INTO soccer_country (country_id, country_abbr, country_name) VALUES
(1201, 'ALB', 'Albania'),
(1202, 'AUT', 'Austria'),
(1203, 'BEL', 'Belgium'),
(1204, 'CRO', 'Croatia'),
(1205, 'CZE', 'Czech Republic'),
(1206, 'ENG', 'England'),
(1207, 'FRA', 'France'),
(1208, 'GER', 'Germany'),
(1209, 'HUN', 'Hungary'),
(1210, 'ISL', 'Iceland'),
(1211, 'ITA', 'Italy'),
(1212, 'NIR', 'Northern Ireland'),
(1213, 'POL', 'Poland'),
(1214, 'POR', 'Portugal'),
(1215, 'IRL', 'Republic of Ireland'),
(1216, 'ROU', 'Romania'),
(1217, 'RUS', 'Russia'),
(1218, 'SVK', 'Slovakia'),
(1219, 'ESP', 'Spain'),
(1220, 'SWE', 'Sweden'),
(1221, 'SUI', 'Switzerland'),
(1222, 'TUR', 'Turkey'),
(1223, 'UKR', 'Ukraine'),
(1224, 'WAL', 'Wales'),
(1225, 'SLO', 'Slovenia'),
(1226, 'NED', 'Netherlands'),
(1227, 'SRB', 'Serbia'),
(1228, 'SCO', 'Scotland'),
(1229, 'NOR', 'Norway');

select * from match_details
select * from soccer_country

SELECT match_no, country_name, goal_score
FROM match_details a
JOIN soccer_country b ON a.team_id = b.country_id
WHERE decided_by = 'N'
ORDER BY match_no;

---misol 3







