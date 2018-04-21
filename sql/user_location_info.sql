## create a table for user_location_info.location info
CREATE TABLE `user_location_info.location_info` (
  `sr_no` int(20),
  `user_location_info.location` varchar(50),
  PRIMARY KEY (`sr_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

Insert into user_location_info.location_info values (1, 'Afghanistan');
Insert into user_location_info.location_info values (2, 'Albania'),(3, 'Algeria'),
insert into user_location_info.location_info value (4	,'America'),
(5	,'Andorra'),
(6	,'Angola'),
(7	,'Antigua'),
(8	,'Argentina'),
(9	,'Armenia'),
(10	,'Australia'),
(11	,'Austria'),
(12	,'Azerbaijan'),
(13	,'Bahamas'),
(14	,'Bahrain'),
(15	,'Bangladesh'),
(16	,'Barbados'),
(17	,'Belarus'),
(18	,'Belgium'),
(19	,'Belize'),
(20	,'Benin'),
(21	,'Bhutan'),
(22	,'Bissau'),
(23	,'Bolivia'),
(24	,'Bosnia'),
(25	,'Botswana'),
(26	,'Brazil'),
(27	,'British'),
(28	,'Brunei'),
(29	,'Bulgaria'),
(30	,'Burkina'),
(31	,'Burma'),
(32	,'Burundi'),
(33	,'Cambodia'),
(34	,'Cameroon'),
(35	,'Canada'),
(36	,'Cape Verde'),
(37	,'Central African Republic'),
(38	,'Chad'),
(39	,'Chile'),
(40	,'China'),
(41	,'Colombia'),
(42	,'Comoros'),
(43	,'Congo'),
(44	,'Costa Rica'),
(45	,'Croatia'),
(46	,'Cuba'),
(47	,'Cyprus'),
(48	,'Czech'),
(49	,'Denmark'),
(50	,'Djibouti'),
(51	,'Dominica'),
(52	,'East Timor'),
(53	,'Ecuador'),
(54	,'Egypt'),
(55	,'El Salvador'),
(56	,'Emirate'),
(57	,'England'),
(58	,'Eritrea'),
(59	,'Estonia'),
(60	,'Ethiopia'),
(61	,'Fiji'),
(62	,'Finland'),
(63	,'France'),
(64	,'Gabon'),
(65	,'Gambia'),
(66	,'Georgia'),
(67	,'Germany'),
(68	,'Ghana'),
(69	,'Great Britain'),
(70	,'Greece'),
(71	,'Grenada'),
(72	,'Grenadines'),
(73	,'Guatemala'),
(74	,'Guinea'),
(75	,'Guyana'),
(76	,'Haiti'),
(77	,'Herzegovina'),
(78	,'Holland'),
(79	,'Honduras'),
(80	,'Hungary'),
(81	,'Iceland'),
(82	,'India'),
(83	,'Indonesia'),
(84	,'Iran'),
(85	,'Iraq'),
(86	,'Ireland'),
(87	,'Israel'),
(88	,'Italy'),
(89	,'Ivory Coast'),
(90	,'Jamaica'),
(91	,'Japan'),
(92	,'Jordan'),
(93	,'Kazakhstan'),
(94	,'Kenya'),
(95	,'Kiribati'),
(96	,'Korea'),
(97	,'Kosovo'),
(98	,'Kuwait'),
(99	,'Kyrgyzstan'),
(100	,'Laos'),
(101	,'Latvia'),
(102	,'Lebanon'),
(103	,'Lesotho'),
(104	,'Liberia'),
(105	,'Libya'),
(106	,'Liechtenstein'),
(107	,'Lithuania'),
(108	,'Luxembourg'),
(109	,'Macedonia'),
(110	,'Madagascar'),
(111	,'Malawi'),
(112	,'Malaysia'),
(113	,'Maldives'),
(114	,'Mali'),
(115	,'Malta'),
(116	,'Marshall'),
(117	,'Mauritania'),
(118	,'Mauritius'),
(119	,'Mexico'),
(120	,'Micronesia'),
(121	,'Moldova'),
(122	,'Monaco'),
(123	,'Mongolia'),
(124	,'Montenegro'),
(125	,'Morocco'),
(126	,'Mozambique'),
(127	,'Myanmar'),
(128	,'Namibia'),
(129	,'Nauru'),
(130	,'Nepal'),
(131	,'Netherlands'),
(132	,'New Zealand'),
(133	,'Nicaragua'),
(134	,'Niger'),
(135	,'Nigeria'),
(136	,'Norway'),
(137	,'Oman'),
(138	,'Pakistan'),
(139	,'Palau'),
(140	,'Panama'),
(141	,'Papua'),
(142	,'Paraguay'),
(143	,'Peru'),
(144	,'Philippines'),
(145	,'Poland'),
(146	,'Portugal'),
(147	,'Qatar'),
(148	,'Romania'),
(149	,'Russia'),
(150	,'Rwanda'),
(151	,'Samoa'),
(152	,'San Marino'),
(153	,'Sao Tome'),
(154	,'Saudi Arabia'),
(155	,'Scotland'),
(156	,'Scottish'),
(157	,'Senegal'),
(158	,'Serbia'),
(159	,'Seychelles'),
(160	,'Sierra Leone'),
(161	,'Singapore'),
(162	,'Slovakia'),
(163	,'Slovenia'),
(164	,'Solomon'),
(165	,'Somalia'),
(166	,'South Africa'),
(167	,'South Sudan'),
(168	,'Spain'),
(169	,'Sri Lanka'),
(170	,'St Kitts'),
(171	,'St Lucia'),
(172	,'Sudan'),
(173	,'Suriname'),
(174	,'Swaziland'),
(175	,'Sweden'),
(176	,'Switzerland'),
(177	,'Syria'),
(178	,'Taiwan'),
(179	,'Tajikistan'),
(180	,'Tanzania'),
(181	,'Thailand'),
(182	,'Tobago'),
(183	,'Togo'),
(184	,'Tonga'),
(185	,'Trinidad'),
(186	,'Tunisia'),
(187	,'Turkey'),
(188	,'Turkmenistan'),
(189	,'Tuvalu'),
(190	,'Uganda'),
(191	,'Ukraine'),
(192	,'United Kingdom'),
(193	,'United States'),
(194	,'Uruguay'),
(195	,'USA'),
(196	,'Uzbekistan'),
(197	,'Vanuatu'),
(198	,'Vatican'),
(199	,'Venezuela'),
(200	,'Vietnam'),
(201	,'Wales'),
(202	,'Welsh'),
(203	,'Yemen'),
(204	,'Zambia'),
(205	,'Zimbabwe');


select * from user_location_info.location_info where user_location_info.location in ('Yemen','Afghanistan');
select * from user_location_info.location_info where user_location_info.location not like '%en%' or '%afg%';
select * from user_location_info.location_info where user_location_info.location regexp 'Yemen'|'Afghanistan';

select * from user_location_info.location_info where user_location_info.location like '%gen%' or user_location_info.location like '%Ye%';

select * from user_location_info.location_info
when user_location_info.location like '%Afghanistan%'
or user_location_info.location like '%Albania%'
or user_location_info.location like '%Algeria%'
or user_location_info.location like '%Andorra%'
or user_location_info.location like '%Angola%'
or user_location_info.location like '%Antigua%'
or user_location_info.location like '%Argentina%'
or user_location_info.location like '%Armenia%'
or user_location_info.location like '%Australia%'
or user_location_info.location like '%Austria%'
or user_location_info.location like '%Azerbaijan%'
or user_location_info.location like '%Bahamas%'
or user_location_info.location like '%Bahrain%'
or user_location_info.location like '%Bangladesh%'
or user_location_info.location like '%Barbados%'
or user_location_info.location like '%Belarus%'
or user_location_info.location like '%Belgium%'
or user_location_info.location like '%Belize%'
or user_location_info.location like '%Benin%'
or user_location_info.location like '%Bhutan%'
or user_location_info.location like '%Bissau%'
or user_location_info.location like '%Bolivia%'
or user_location_info.location like '%Bosnia%'
or user_location_info.location like '%Botswana%'
or user_location_info.location like '%Brazil%'
or user_location_info.location like '%British%'
or user_location_info.location like '%Brunei%'
or user_location_info.location like '%Bulgaria%'
or user_location_info.location like '%Burkina%'
or user_location_info.location like '%Burma%'
or user_location_info.location like '%Burundi%'
or user_location_info.location like '%Cambodia%'
or user_location_info.location like '%Cameroon%'
or user_location_info.location like '%Canada%'
or user_location_info.location like '%Cape Verde%'
or user_location_info.location like '%Central African Republic%'
or user_location_info.location like '%Chad%'
or user_location_info.location like '%Chile%'
or user_location_info.location like '%China%'
or user_location_info.location like '%Colombia%'
or user_location_info.location like '%Comoros%'
or user_location_info.location like '%Congo%'
or user_location_info.location like '%Costa Rica%'
or user_location_info.location like '%Croatia%'
or user_location_info.location like '%Cuba%'
or user_location_info.location like '%Cyprus%'
or user_location_info.location like '%Czech%'
or user_location_info.location like '%Denmark%'
or user_location_info.location like '%Djibouti%'
or user_location_info.location like '%Dominica%'
or user_location_info.location like '%East Timor%'
or user_location_info.location like '%Ecuador%'
or user_location_info.location like '%Egypt%'
or user_location_info.location like '%El Salvador%'
or user_location_info.location like '%Emirate%'
or user_location_info.location like '%England%'
or user_location_info.location like '%Eritrea%'
or user_location_info.location like '%Estonia%'
or user_location_info.location like '%Ethiopia%'
or user_location_info.location like '%Fiji%'
or user_location_info.location like '%Finland%'
or user_location_info.location like '%France%'
or user_location_info.location like '%Gabon%'
or user_location_info.location like '%Gambia%'
or user_location_info.location like '%Georgia%'
or user_location_info.location like '%Germany%'
or user_location_info.location like '%Ghana%'
or user_location_info.location like '%Great Britain%'
or user_location_info.location like '%Greece%'
or user_location_info.location like '%Grenada%'
or user_location_info.location like '%Grenadines%'
or user_location_info.location like '%Guatemala%'
or user_location_info.location like '%Guinea%'
or user_location_info.location like '%Guyana%'
or user_location_info.location like '%Haiti%'
or user_location_info.location like '%Herzegovina%'
or user_location_info.location like '%Holland%'
or user_location_info.location like '%Honduras%'
or user_location_info.location like '%Hungary%'
or user_location_info.location like '%Iceland%'
or user_location_info.location like '%India%'
or user_location_info.location like '%Indonesia%'
or user_location_info.location like '%Iran%'
or user_location_info.location like '%Iraq%'
or user_location_info.location like '%Ireland%'
or user_location_info.location like '%Israel%'
or user_location_info.location like '%Italy%'
or user_location_info.location like '%Ivory Coast%'
or user_location_info.location like '%Jamaica%'
or user_location_info.location like '%Japan%'
or user_location_info.location like '%Jordan%'
or user_location_info.location like '%Kazakhstan%'
or user_location_info.location like '%Kenya%'
or user_location_info.location like '%Kiribati%'
or user_location_info.location like '%Korea%'
or user_location_info.location like '%Kosovo%'
or user_location_info.location like '%Kuwait%'
or user_location_info.location like '%Kyrgyzstan%'
or user_location_info.location like '%Laos%'
or user_location_info.location like '%Latvia%'
or user_location_info.location like '%Lebanon%'
or user_location_info.location like '%Lesotho%'
or user_location_info.location like '%Liberia%'
or user_location_info.location like '%Libya%'
or user_location_info.location like '%Liechtenstein%'
or user_location_info.location like '%Lithuania%'
or user_location_info.location like '%Luxembourg%'
or user_location_info.location like '%Macedonia%'
or user_location_info.location like '%Madagascar%'
or user_location_info.location like '%Malawi%'
or user_location_info.location like '%Malaysia%'
or user_location_info.location like '%Maldives%'
or user_location_info.location like '%Mali%'
or user_location_info.location like '%Malta%'
or user_location_info.location like '%Marshall%'
or user_location_info.location like '%Mauritania%'
or user_location_info.location like '%Mauritius%'
or user_location_info.location like '%Mexico%'
or user_location_info.location like '%Micronesia%'
or user_location_info.location like '%Moldova%'
or user_location_info.location like '%Monaco%'
or user_location_info.location like '%Mongolia%'
or user_location_info.location like '%Montenegro%'
or user_location_info.location like '%Morocco%'
or user_location_info.location like '%Mozambique%'
or user_location_info.location like '%Myanmar%'
or user_location_info.location like '%Namibia%'
or user_location_info.location like '%Nauru%'
or user_location_info.location like '%Nepal%'
or user_location_info.location like '%Netherlands%'
or user_location_info.location like '%New Zealand%'
or user_location_info.location like '%Nicaragua%'
or user_location_info.location like '%Niger%'
or user_location_info.location like '%Nigeria%'
or user_location_info.location like '%Norway%'
or user_location_info.location like '%Oman%'
or user_location_info.location like '%Pakistan%'
or user_location_info.location like '%Palau%'
or user_location_info.location like '%Panama%'
or user_location_info.location like '%Papua%'
or user_location_info.location like '%Paraguay%'
or user_location_info.location like '%Peru%'
or user_location_info.location like '%Philippines%'
or user_location_info.location like '%Poland%'
or user_location_info.location like '%Portugal%'
or user_location_info.location like '%Qatar%'
or user_location_info.location like '%Romania%'
or user_location_info.location like '%Russia%'
or user_location_info.location like '%Rwanda%'
or user_location_info.location like '%Samoa%'
or user_location_info.location like '%San Marino%'
or user_location_info.location like '%Sao Tome%'
or user_location_info.location like '%Saudi Arabia%'
or user_location_info.location like '%Scotland%'
or user_location_info.location like '%Scottish%'
or user_location_info.location like '%Senegal%'
or user_location_info.location like '%Serbia%'
or user_location_info.location like '%Seychelles%'
or user_location_info.location like '%Sierra Leone%'
or user_location_info.location like '%Singapore%'
or user_location_info.location like '%Slovakia%'
or user_location_info.location like '%Slovenia%'
or user_location_info.location like '%Solomon%'
or user_location_info.location like '%Somalia%'
or user_location_info.location like '%South Africa%'
or user_location_info.location like '%South Sudan%'
or user_location_info.location like '%Spain%'
or user_location_info.location like '%Sri Lanka%'
or user_location_info.location like '%St Kitts%'
or user_location_info.location like '%St Lucia%'
or user_location_info.location like '%Sudan%'
or user_location_info.location like '%Suriname%'
or user_location_info.location like '%Swaziland%'
or user_location_info.location like '%Sweden%'
or user_location_info.location like '%Switzerland%'
or user_location_info.location like '%Syria%'
or user_location_info.location like '%Taiwan%'
or user_location_info.location like '%Tajikistan%'
or user_location_info.location like '%Tanzania%'
or user_location_info.location like '%Thailand%'
or user_location_info.location like '%Tobago%'
or user_location_info.location like '%Togo%'
or user_location_info.location like '%Tonga%'
or user_location_info.location like '%Trinidad%'
or user_location_info.location like '%Tunisia%'
or user_location_info.location like '%Turkey%'
or user_location_info.location like '%Turkmenistan%'
or user_location_info.location like '%Tuvalu%'
or user_location_info.location like '%Uganda%'
or user_location_info.location like '%Ukraine%'
or user_location_info.location like '%United Kingdom%'
or user_location_info.location like '%Uruguay%'
or user_location_info.location like '%Uzbekistan%'
or user_location_info.location like '%Vanuatu%'
or user_location_info.location like '%Vatican%'
or user_location_info.location like '%Venezuela%'
or user_location_info.location like '%Vietnam%'
or user_location_info.location like '%Wales%'
or user_location_info.location like '%Welsh%'
or user_location_info.location like '%Yemen%'
or user_location_info.location like '%Zambia%'
or user_location_info.location like '%Zimbabwe%';



## creating user_location_info
scp '/Users/rahuldhakecha/coursesfall2017/goodreads/files/user_location_info.csv' rahuldhakecha@ssh.wwbp.org:
ssh -L 10001:localhost:22 rahuldhakecha@ssh.wwbp.org
mv user_location_info.csv /tmp/
mysql -u rahuldhakecha -p --local-infile

CREATE TABLE `user_location_info` (
  `user_id` int(20),
  `location` char(150),
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

load data local infile '/tmp/user_location_info.csv' into table user_location_info fields terminated by ',' lines terminated by '\n';

# add a new column and assign US/NonUS tag to each user dependent on data
drop table user_location_USnonUS;
create table if not exists user_location_USnonUS(index(user_id)) as (select user_location_info.user_id, user_location_info.location,
case 
when 
user_location_info.location like '%Afghanistan%'
or user_location_info.location like '%Albania%'
or user_location_info.location like '%Algeria%'
or user_location_info.location like '%Andorra%'
or user_location_info.location like '%Angola%'
or user_location_info.location like '%Antigua%'
or user_location_info.location like '%Argentina%'
or user_location_info.location like '%Armenia%'
or user_location_info.location like '%Australia%'
or user_location_info.location like '%Austria%'
or user_location_info.location like '%Azerbaijan%'
or user_location_info.location like '%Bahamas%'
or user_location_info.location like '%Bahrain%'
or user_location_info.location like '%Bangladesh%'
or user_location_info.location like '%Barbados%'
or user_location_info.location like '%Belarus%'
or user_location_info.location like '%Belgium%'
or user_location_info.location like '%Belize%'
or user_location_info.location like '%Benin%'
or user_location_info.location like '%Bhutan%'
or user_location_info.location like '%Bissau%'
or user_location_info.location like '%Bolivia%'
or user_location_info.location like '%Bosnia%'
or user_location_info.location like '%Botswana%'
or user_location_info.location like '%Brazil%'
or user_location_info.location like '%British%'
or user_location_info.location like '%Brunei%'
or user_location_info.location like '%Bulgaria%'
or user_location_info.location like '%Burkina%'
or user_location_info.location like '%Burma%'
or user_location_info.location like '%Burundi%'
or user_location_info.location like '%Cambodia%'
or user_location_info.location like '%Cameroon%'
or user_location_info.location like '%Canada%'
or user_location_info.location like '%Cape Verde%'
or user_location_info.location like '%Central African Republic%'
or user_location_info.location like '%Chad%'
or user_location_info.location like '%Chile%'
or user_location_info.location like '%China%'
or user_location_info.location like '%Colombia%'
or user_location_info.location like '%Comoros%'
or user_location_info.location like '%Congo%'
or user_location_info.location like '%Costa Rica%'
or user_location_info.location like '%Croatia%'
or user_location_info.location like '%Cuba%'
or user_location_info.location like '%Cyprus%'
or user_location_info.location like '%Czech%'
or user_location_info.location like '%Denmark%'
or user_location_info.location like '%Djibouti%'
or user_location_info.location like '%Dominica%'
or user_location_info.location like '%East Timor%'
or user_location_info.location like '%Ecuador%'
or user_location_info.location like '%Egypt%'
or user_location_info.location like '%El Salvador%'
or user_location_info.location like '%Emirate%'
or user_location_info.location like '%England%'
or user_location_info.location like '%Eritrea%'
or user_location_info.location like '%Estonia%'
or user_location_info.location like '%Ethiopia%'
or user_location_info.location like '%Fiji%'
or user_location_info.location like '%Finland%'
or user_location_info.location like '%France%'
or user_location_info.location like '%Gabon%'
or user_location_info.location like '%Gambia%'
or user_location_info.location like '%Georgia%'
or user_location_info.location like '%Germany%'
or user_location_info.location like '%Ghana%'
or user_location_info.location like '%Great Britain%'
or user_location_info.location like '%Greece%'
or user_location_info.location like '%Grenada%'
or user_location_info.location like '%Grenadines%'
or user_location_info.location like '%Guatemala%'
or user_location_info.location like '%Guinea%'
or user_location_info.location like '%Guyana%'
or user_location_info.location like '%Haiti%'
or user_location_info.location like '%Herzegovina%'
or user_location_info.location like '%Holland%'
or user_location_info.location like '%Honduras%'
or user_location_info.location like '%Hungary%'
or user_location_info.location like '%Iceland%'
or user_location_info.location like '%India%'
or user_location_info.location like '%Indonesia%'
or user_location_info.location like '%Iran%'
or user_location_info.location like '%Iraq%'
or user_location_info.location like '%Ireland%'
or user_location_info.location like '%Israel%'
or user_location_info.location like '%Italy%'
or user_location_info.location like '%Ivory Coast%'
or user_location_info.location like '%Jamaica%'
or user_location_info.location like '%Japan%'
or user_location_info.location like '%Jordan%'
or user_location_info.location like '%Kazakhstan%'
or user_location_info.location like '%Kenya%'
or user_location_info.location like '%Kiribati%'
or user_location_info.location like '%Korea%'
or user_location_info.location like '%Kosovo%'
or user_location_info.location like '%Kuwait%'
or user_location_info.location like '%Kyrgyzstan%'
or user_location_info.location like '%Laos%'
or user_location_info.location like '%Latvia%'
or user_location_info.location like '%Lebanon%'
or user_location_info.location like '%Lesotho%'
or user_location_info.location like '%Liberia%'
or user_location_info.location like '%Libya%'
or user_location_info.location like '%Liechtenstein%'
or user_location_info.location like '%Lithuania%'
or user_location_info.location like '%Luxembourg%'
or user_location_info.location like '%Macedonia%'
or user_location_info.location like '%Madagascar%'
or user_location_info.location like '%Malawi%'
or user_location_info.location like '%Malaysia%'
or user_location_info.location like '%Maldives%'
or user_location_info.location like '%Mali%'
or user_location_info.location like '%Malta%'
or user_location_info.location like '%Marshall%'
or user_location_info.location like '%Mauritania%'
or user_location_info.location like '%Mauritius%'
or user_location_info.location like '%Mexico%'
or user_location_info.location like '%Micronesia%'
or user_location_info.location like '%Moldova%'
or user_location_info.location like '%Monaco%'
or user_location_info.location like '%Mongolia%'
or user_location_info.location like '%Montenegro%'
or user_location_info.location like '%Morocco%'
or user_location_info.location like '%Mozambique%'
or user_location_info.location like '%Myanmar%'
or user_location_info.location like '%Namibia%'
or user_location_info.location like '%Nauru%'
or user_location_info.location like '%Nepal%'
or user_location_info.location like '%Netherlands%'
or user_location_info.location like '%New Zealand%'
or user_location_info.location like '%Nicaragua%'
or user_location_info.location like '%Niger%'
or user_location_info.location like '%Nigeria%'
or user_location_info.location like '%Norway%'
or user_location_info.location like '%Oman%'
or user_location_info.location like '%Pakistan%'
or user_location_info.location like '%Palau%'
or user_location_info.location like '%Panama%'
or user_location_info.location like '%Papua%'
or user_location_info.location like '%Paraguay%'
or user_location_info.location like '%Peru%'
or user_location_info.location like '%Philippines%'
or user_location_info.location like '%Poland%'
or user_location_info.location like '%Portugal%'
or user_location_info.location like '%Qatar%'
or user_location_info.location like '%Romania%'
or user_location_info.location like '%Russia%'
or user_location_info.location like '%Rwanda%'
or user_location_info.location like '%Samoa%'
or user_location_info.location like '%San Marino%'
or user_location_info.location like '%Sao Tome%'
or user_location_info.location like '%Saudi Arabia%'
or user_location_info.location like '%Scotland%'
or user_location_info.location like '%Scottish%'
or user_location_info.location like '%Senegal%'
or user_location_info.location like '%Serbia%'
or user_location_info.location like '%Seychelles%'
or user_location_info.location like '%Sierra Leone%'
or user_location_info.location like '%Singapore%'
or user_location_info.location like '%Slovakia%'
or user_location_info.location like '%Slovenia%'
or user_location_info.location like '%Solomon%'
or user_location_info.location like '%Somalia%'
or user_location_info.location like '%South Africa%'
or user_location_info.location like '%South Sudan%'
or user_location_info.location like '%Spain%'
or user_location_info.location like '%Sri Lanka%'
or user_location_info.location like '%St Kitts%'
or user_location_info.location like '%St Lucia%'
or user_location_info.location like '%Sudan%'
or user_location_info.location like '%Suriname%'
or user_location_info.location like '%Swaziland%'
or user_location_info.location like '%Sweden%'
or user_location_info.location like '%Switzerland%'
or user_location_info.location like '%Syria%'
or user_location_info.location like '%Taiwan%'
or user_location_info.location like '%Tajikistan%'
or user_location_info.location like '%Tanzania%'
or user_location_info.location like '%Thailand%'
or user_location_info.location like '%Tobago%'
or user_location_info.location like '%Togo%'
or user_location_info.location like '%Tonga%'
or user_location_info.location like '%Trinidad%'
or user_location_info.location like '%Tunisia%'
or user_location_info.location like '%Turkey%'
or user_location_info.location like '%Turkmenistan%'
or user_location_info.location like '%Tuvalu%'
or user_location_info.location like '%Uganda%'
or user_location_info.location like '%Ukraine%'
or user_location_info.location like '%United Kingdom%'
or user_location_info.location like '%Uruguay%'
or user_location_info.location like '%Uzbekistan%'
or user_location_info.location like '%Vanuatu%'
or user_location_info.location like '%Vatican%'
or user_location_info.location like '%Venezuela%'
or user_location_info.location like '%Vietnam%'
or user_location_info.location like '%Wales%'
or user_location_info.location like '%Welsh%'
or user_location_info.location like '%Yemen%'
or user_location_info.location like '%Zambia%'
or user_location_info.location like '%Zimbabwe%'
then 1
when
user_location_info.location like '%The United States%'
or user_location_info.location like '% US %'
or user_location_info.location like '%Alabama%'
or user_location_info.location like '%Alaska%'
or user_location_info.location like '%Arizona%'
or user_location_info.location like '%Arkansas%'
or user_location_info.location like '%California%'
or user_location_info.location like '%Colorado%'
or user_location_info.location like '%Connecticut%'
or user_location_info.location like '%Delaware%'
or user_location_info.location like '%Florida%'
or user_location_info.location like '%Georgia%'
or user_location_info.location like '%Hawaii%'
or user_location_info.location like '%Idaho%'
or user_location_info.location like '%Illinois%'
or user_location_info.location like '%Indiana%'
or user_location_info.location like '%Iowa%'
or user_location_info.location like '%Kansas%'
or user_location_info.location like '%Kentucky%'
or user_location_info.location like '%Louisiana%'
or user_location_info.location like '%Maine%'
or user_location_info.location like '%Maryland%'
or user_location_info.location like '%Massachusetts%'
or user_location_info.location like '%Michigan%'
or user_location_info.location like '%Minnesota%'
or user_location_info.location like '%Mississippi%'
or user_location_info.location like '%Missouri%'
or user_location_info.location like '%Montana%'
or user_location_info.location like '%Nebraska%'
or user_location_info.location like '%Nevada%'
or user_location_info.location like '%New Hampshire%'
or user_location_info.location like '%New Jersey%'
or user_location_info.location like '%New Mexico%'
or user_location_info.location like '%New York%'
or user_location_info.location like '%North Carolina%'
or user_location_info.location like '%North Dakota%'
or user_location_info.location like '%Ohio%'
or user_location_info.location like '%Oklahoma%'
or user_location_info.location like '%Oregon%'
or user_location_info.location like '%Pennsylvania%'
or user_location_info.location like '%Rhode Island%'
or user_location_info.location like '%South Carolina%'
or user_location_info.location like '%South Dakota%'
or user_location_info.location like '%Tennessee%'
or user_location_info.location like '%Texas%'
or user_location_info.location like '%Utah%'
or user_location_info.location like '%Vermont%'
or user_location_info.location like '%Virginia%'
or user_location_info.location like '%Washington%'
or user_location_info.location like '%West Virginia%'
or user_location_info.location like '%Wisconsin%'
or user_location_info.location like '%Wyoming%'
or user_location_info.location like '% AL %'
or user_location_info.location like '% AK %'
or user_location_info.location like '% AZ %'
or user_location_info.location like '% AR %'
or user_location_info.location like '% CA %'
or user_location_info.location like '% CO %'
or user_location_info.location like '% CT %'
or user_location_info.location like '% DE %'
or user_location_info.location like '% FL %'
or user_location_info.location like '% GA %'
or user_location_info.location like '% HI %'
or user_location_info.location like '% ID %'
or user_location_info.location like '% IL %'
or user_location_info.location like '% IN %'
or user_location_info.location like '% IA %'
or user_location_info.location like '% KS %'
or user_location_info.location like '% KY %'
or user_location_info.location like '% LA %'
or user_location_info.location like '% ME %'
or user_location_info.location like '% MD %'
or user_location_info.location like '% MA %'
or user_location_info.location like '% MI %'
or user_location_info.location like '% MN %'
or user_location_info.location like '% MS %'
or user_location_info.location like '% MO %'
or user_location_info.location like '% MT %'
or user_location_info.location like '% NE %'
or user_location_info.location like '% NV %'
or user_location_info.location like '% NH %'
or user_location_info.location like '% NJ %'
or user_location_info.location like '% NM %'
or user_location_info.location like '% NY %'
or user_location_info.location like '% NC %'
or user_location_info.location like '% ND %'
or user_location_info.location like '% OH %'
or user_location_info.location like '% OK %'
or user_location_info.location like '% OR %'
or user_location_info.location like '% PA %'
or user_location_info.location like '% RI %'
or user_location_info.location like '% SC %'
or user_location_info.location like '% SD %'
or user_location_info.location like '% TN %'
or user_location_info.location like '% TX %'
or user_location_info.location like '% UT %'
or user_location_info.location like '% VT %'
or user_location_info.location like '% VA %'
or user_location_info.location like '% WA %'
or user_location_info.location like '% WV %'
or user_location_info.location like '% WI %'
or user_location_info.location like '% WY %'
then
2
else
3
end as USnonUS
from user_location_info);


## final table of user info
drop table if exists user_final_info;
create table if not exists user_final_info as 
(select user_info_scifi_chicklit_detcrime.user_id,user_info_scifi_chicklit_detcrime.total_ratings,user_info_scifi_chicklit_detcrime.total_reviews,user_info_scifi_chicklit_detcrime.avg_ratings,user_location_USnonUS.US_nonUS   from user_info_scifi_chicklit_detcrime
inner join
user_location_USnonUS on user_info_scifi_chicklit_detcrime.user_id=user_location_USnonUS.user_id);




