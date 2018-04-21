## creating user_location_info_best_seller_recent_200_threshold_4
scp '/Users/rahuldhakecha/coursesfall2017/goodreads/files/user_location_info_best_seller_recent_200_threshold_4.csv' rahuldhakecha@ssh.wwbp.org:
ssh -L 10001:localhost:22 rahuldhakecha@ssh.wwbp.org
mv user_location_info_best_seller_recent_200_threshold_4.csv /tmp/
mysql -u rahuldhakecha -p --local-infile

CREATE TABLE `user_location_info_best_seller_recent_200_threshold_4` (
  `user_id` int(20),
  `location` char(150),
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

load data local infile '/tmp/user_location_info_best_seller_recent_200_threshold_4.csv' into table user_location_info_best_seller_recent_200_threshold_4 fields terminated by ',' lines terminated by '\n';

scp '/Users/rahuldhakecha/coursesfall2017/goodreads/files/user_location_info_prize_novel_recent_200_threshold_2.csv' rahuldhakecha@ssh.wwbp.org:
ssh -L 10001:localhost:22 rahuldhakecha@ssh.wwbp.org
mv user_location_info_prize_novel_recent_200_threshold_2.csv /tmp/
mysql -u rahuldhakecha -p --local-infile

CREATE TABLE `user_location_info_prize_novel_recent_200_threshold_2` (
  `user_id` int(20),
  `location` char(150),
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

load data local infile '/tmp/user_location_info_prize_novel_recent_200_threshold_2.csv' into table user_location_info_prize_novel_recent_200_threshold_2 fields terminated by ',' lines terminated by '\n';


# add a new column and assign US/NonUS tag to each user dependent on data
drop table user_location_USnonUS_best_seller_recent_200_threshold_4;
create table if not exists user_location_USnonUS_best_seller_recent_200_threshold_4(index(user_id)) as (select user_location_info_best_seller_recent_200_threshold_4.user_id, user_location_info_best_seller_recent_200_threshold_4.location,
case 
when 
user_location_info_best_seller_recent_200_threshold_4.location like '%Afghanistan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Albania%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Algeria%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Andorra%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Angola%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Antigua%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Argentina%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Armenia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Australia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Austria%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Azerbaijan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Bahamas%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Bahrain%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Bangladesh%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Barbados%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Belarus%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Belgium%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Belize%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Benin%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Bhutan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Bissau%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Bolivia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Bosnia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Botswana%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Brazil%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%British%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Brunei%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Bulgaria%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Burkina%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Burma%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Burundi%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Cambodia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Cameroon%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Canada%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Cape Verde%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Central African Republic%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Chad%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Chile%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%China%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Colombia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Comoros%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Congo%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Costa Rica%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Croatia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Cuba%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Cyprus%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Czech%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Denmark%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Djibouti%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Dominica%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%East Timor%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Ecuador%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Egypt%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%El Salvador%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Emirate%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%England%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Eritrea%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Estonia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Ethiopia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Fiji%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Finland%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%France%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Gabon%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Gambia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Georgia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Germany%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Ghana%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Great Britain%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Greece%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Grenada%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Grenadines%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Guatemala%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Guinea%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Guyana%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Haiti%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Herzegovina%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Holland%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Honduras%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Hungary%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Iceland%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%India%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Indonesia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Iran%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Iraq%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Ireland%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Israel%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Italy%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Ivory Coast%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Jamaica%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Japan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Jordan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Kazakhstan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Kenya%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Kiribati%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Korea%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Kosovo%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Kuwait%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Kyrgyzstan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Laos%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Latvia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Lebanon%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Lesotho%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Liberia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Libya%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Liechtenstein%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Lithuania%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Luxembourg%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Macedonia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Madagascar%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Malawi%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Malaysia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Maldives%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Mali%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Malta%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Marshall%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Mauritania%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Mauritius%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Mexico%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Micronesia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Moldova%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Monaco%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Mongolia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Montenegro%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Morocco%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Mozambique%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Myanmar%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Namibia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Nauru%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Nepal%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Netherlands%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%New Zealand%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Nicaragua%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Niger%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Nigeria%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Norway%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Oman%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Pakistan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Palau%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Panama%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Papua%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Paraguay%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Peru%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Philippines%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Poland%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Portugal%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Qatar%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Romania%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Russia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Rwanda%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Samoa%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%San Marino%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Sao Tome%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Saudi Arabia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Scotland%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Scottish%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Senegal%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Serbia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Seychelles%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Sierra Leone%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Singapore%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Slovakia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Slovenia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Solomon%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Somalia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%South Africa%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%South Sudan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Spain%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Sri Lanka%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%St Kitts%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%St Lucia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Sudan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Suriname%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Swaziland%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Sweden%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Switzerland%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Syria%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Taiwan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Tajikistan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Tanzania%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Thailand%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Tobago%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Togo%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Tonga%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Trinidad%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Tunisia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Turkey%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Turkmenistan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Tuvalu%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Uganda%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Ukraine%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%United Kingdom%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Uruguay%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Uzbekistan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Vanuatu%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Vatican%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Venezuela%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Vietnam%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Wales%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Welsh%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Yemen%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Zambia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Zimbabwe%'
then 1
when
user_location_info_best_seller_recent_200_threshold_4.location like '%The United States%'
or user_location_info_best_seller_recent_200_threshold_4.location like '% US %'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Alabama%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Alaska%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Arizona%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Arkansas%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%California%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Colorado%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Connecticut%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Delaware%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Florida%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Georgia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Hawaii%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Idaho%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Illinois%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Indiana%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Iowa%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Kansas%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Kentucky%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Louisiana%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Maine%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Maryland%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Massachusetts%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Michigan%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Minnesota%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Mississippi%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Missouri%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Montana%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Nebraska%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Nevada%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%New Hampshire%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%New Jersey%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%New Mexico%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%New York%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%North Carolina%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%North Dakota%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Ohio%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Oklahoma%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Oregon%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Pennsylvania%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Rhode Island%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%South Carolina%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%South Dakota%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Tennessee%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Texas%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Utah%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Vermont%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Virginia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Washington%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%West Virginia%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Wisconsin%'
or user_location_info_best_seller_recent_200_threshold_4.location like '%Wyoming%'
or user_location_info_best_seller_recent_200_threshold_4.location like '% AL %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% AK %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% AZ %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% AR %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% CA %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% CO %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% CT %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% DE %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% FL %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% GA %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% HI %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% ID %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% IL %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% IN %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% IA %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% KS %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% KY %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% LA %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% ME %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% MD %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% MA %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% MI %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% MN %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% MS %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% MO %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% MT %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% NE %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% NV %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% NH %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% NJ %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% NM %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% NY %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% NC %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% ND %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% OH %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% OK %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% OR %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% PA %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% RI %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% SC %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% SD %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% TN %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% TX %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% UT %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% VT %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% VA %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% WA %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% WV %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% WI %'
or user_location_info_best_seller_recent_200_threshold_4.location like '% WY %'
then
2
else
3
end as USnonUS
from user_location_info_best_seller_recent_200_threshold_4);




drop table user_location_USnonUS_prize_novel_recent_200_threshold_2;
create table if not exists user_location_USnonUS_prize_novel_recent_200_threshold_2
(index(user_id)) as (select user_location_info_prize_novel_recent_200_threshold_2.user_id, user_location_info_prize_novel_recent_200_threshold_2.location,
case 
when 
user_location_info_prize_novel_recent_200_threshold_2.location like '%Afghanistan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Albania%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Algeria%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Andorra%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Angola%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Antigua%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Argentina%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Armenia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Australia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Austria%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Azerbaijan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Bahamas%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Bahrain%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Bangladesh%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Barbados%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Belarus%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Belgium%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Belize%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Benin%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Bhutan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Bissau%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Bolivia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Bosnia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Botswana%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Brazil%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%British%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Brunei%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Bulgaria%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Burkina%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Burma%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Burundi%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Cambodia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Cameroon%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Canada%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Cape Verde%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Central African Republic%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Chad%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Chile%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%China%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Colombia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Comoros%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Congo%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Costa Rica%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Croatia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Cuba%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Cyprus%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Czech%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Denmark%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Djibouti%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Dominica%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%East Timor%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Ecuador%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Egypt%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%El Salvador%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Emirate%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%England%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Eritrea%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Estonia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Ethiopia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Fiji%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Finland%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%France%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Gabon%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Gambia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Georgia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Germany%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Ghana%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Great Britain%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Greece%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Grenada%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Grenadines%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Guatemala%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Guinea%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Guyana%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Haiti%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Herzegovina%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Holland%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Honduras%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Hungary%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Iceland%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%India%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Indonesia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Iran%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Iraq%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Ireland%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Israel%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Italy%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Ivory Coast%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Jamaica%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Japan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Jordan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Kazakhstan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Kenya%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Kiribati%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Korea%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Kosovo%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Kuwait%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Kyrgyzstan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Laos%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Latvia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Lebanon%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Lesotho%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Liberia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Libya%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Liechtenstein%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Lithuania%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Luxembourg%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Macedonia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Madagascar%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Malawi%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Malaysia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Maldives%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Mali%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Malta%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Marshall%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Mauritania%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Mauritius%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Mexico%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Micronesia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Moldova%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Monaco%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Mongolia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Montenegro%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Morocco%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Mozambique%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Myanmar%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Namibia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Nauru%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Nepal%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Netherlands%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%New Zealand%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Nicaragua%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Niger%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Nigeria%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Norway%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Oman%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Pakistan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Palau%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Panama%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Papua%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Paraguay%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Peru%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Philippines%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Poland%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Portugal%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Qatar%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Romania%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Russia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Rwanda%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Samoa%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%San Marino%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Sao Tome%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Saudi Arabia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Scotland%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Scottish%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Senegal%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Serbia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Seychelles%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Sierra Leone%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Singapore%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Slovakia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Slovenia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Solomon%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Somalia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%South Africa%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%South Sudan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Spain%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Sri Lanka%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%St Kitts%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%St Lucia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Sudan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Suriname%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Swaziland%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Sweden%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Switzerland%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Syria%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Taiwan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Tajikistan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Tanzania%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Thailand%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Tobago%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Togo%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Tonga%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Trinidad%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Tunisia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Turkey%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Turkmenistan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Tuvalu%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Uganda%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Ukraine%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%United Kingdom%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Uruguay%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Uzbekistan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Vanuatu%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Vatican%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Venezuela%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Vietnam%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Wales%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Welsh%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Yemen%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Zambia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Zimbabwe%'
then 1
when
user_location_info_prize_novel_recent_200_threshold_2.location like '%The United States%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% US %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Alabama%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Alaska%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Arizona%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Arkansas%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%California%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Colorado%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Connecticut%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Delaware%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Florida%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Georgia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Hawaii%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Idaho%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Illinois%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Indiana%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Iowa%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Kansas%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Kentucky%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Louisiana%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Maine%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Maryland%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Massachusetts%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Michigan%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Minnesota%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Mississippi%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Missouri%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Montana%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Nebraska%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Nevada%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%New Hampshire%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%New Jersey%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%New Mexico%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%New York%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%North Carolina%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%North Dakota%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Ohio%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Oklahoma%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Oregon%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Pennsylvania%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Rhode Island%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%South Carolina%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%South Dakota%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Tennessee%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Texas%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Utah%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Vermont%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Virginia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Washington%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%West Virginia%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Wisconsin%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '%Wyoming%'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% AL %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% AK %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% AZ %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% AR %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% CA %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% CO %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% CT %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% DE %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% FL %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% GA %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% HI %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% ID %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% IL %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% IN %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% IA %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% KS %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% KY %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% LA %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% ME %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% MD %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% MA %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% MI %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% MN %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% MS %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% MO %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% MT %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% NE %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% NV %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% NH %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% NJ %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% NM %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% NY %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% NC %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% ND %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% OH %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% OK %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% OR %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% PA %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% RI %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% SC %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% SD %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% TN %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% TX %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% UT %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% VT %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% VA %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% WA %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% WV %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% WI %'
or user_location_info_prize_novel_recent_200_threshold_2.location like '% WY %'
then
2
else
3
end as USnonUS
from user_location_info_prize_novel_recent_200_threshold_2);

















## For each user(from 3 popular genres), we find total number of books he read in 3 different genres, best seller books, prize listed novels and location info
drop temporary table if exists sci_fi_users_count;
create temporary table if not exists sci_fi_users_count(index(user_id)) as (select user_id,count(*) as sci_fi_cnt from sci_fi where user_id is not NULL and user_id!=0 group by user_id);
drop temporary table if exists chick_lit_users_count;
create temporary table if not exists chick_lit_users_count(index(user_id)) as (select user_id,count(*) as chick_lit_cnt from chick_lit where user_id is not NULL and user_id!=0 group by user_id);
drop temporary table if exists det_crime_users_count;
create temporary table if not exists det_crime_users_count(index(user_id)) as (select user_id,count(*) as det_crime_cnt from det_crime where user_id is not NULL and user_id!=0 group by user_id);



####################################################### OUTER JOIN of above 5 tables #####################################################
drop temporary table if exists temp1;
create temporary table if not exists temp1(index(user_id)) as (select sci_fi_users_count.user_id, sci_fi_users_count.sci_fi_cnt, chick_lit_users_count.chick_lit_cnt from sci_fi_users_count
left join
chick_lit_users_count on sci_fi_users_count.user_id=chick_lit_users_count.user_id);
drop temporary table if exists temp2;
create temporary table if not exists temp2 as (select chick_lit_users_count.user_id, sci_fi_users_count.sci_fi_cnt, chick_lit_users_count.chick_lit_cnt from sci_fi_users_count
right join
chick_lit_users_count on sci_fi_users_count.user_id=chick_lit_users_count.user_id where sci_fi_users_count.user_id is NULL);
drop temporary table if exists sci_fi_chick_lit;
create temporary table if not exists sci_fi_chick_lit(index(user_id)) as (select * from (select * from temp1 union select * from temp2) as temp);

drop temporary table if exists temp1;
create temporary table if not exists temp1(index(user_id)) as (select sci_fi_chick_lit.user_id, sci_fi_chick_lit.sci_fi_cnt, sci_fi_chick_lit.chick_lit_cnt, det_crime_users_count.det_crime_cnt from sci_fi_chick_lit
left join
det_crime_users_count on sci_fi_chick_lit.user_id=det_crime_users_count.user_id);
drop temporary table if exists temp2;
create temporary table if not exists temp2(index(user_id)) as (select det_crime_users_count.user_id, sci_fi_chick_lit.sci_fi_cnt, sci_fi_chick_lit.chick_lit_cnt, det_crime_users_count.det_crime_cnt from sci_fi_chick_lit
right join
det_crime_users_count on sci_fi_chick_lit.user_id=det_crime_users_count.user_id where sci_fi_chick_lit.user_id is NULL);
drop temporary table if exists sci_fi_chick_lit_det_crime;
create temporary table if not exists sci_fi_chick_lit_det_crime(index(user_id)) as (select * from (select * from temp1 union select * from temp2) as temp);

drop temporary table if exists temp1;
create temporary table if not exists temp1(index(user_id)) as (select sci_fi_chick_lit_det_crime.user_id, sci_fi_chick_lit_det_crime.sci_fi_cnt, sci_fi_chick_lit_det_crime.chick_lit_cnt, sci_fi_chick_lit_det_crime.det_crime_cnt, users_prize_novel_recent_200.prize_novel_cnt from sci_fi_chick_lit_det_crime
left join
users_prize_novel_recent_200 on sci_fi_chick_lit_det_crime.user_id=users_prize_novel_recent_200.user_id);
drop temporary table if exists temp2;
create temporary table if not exists temp2(index(user_id)) as (select users_prize_novel_recent_200.user_id, sci_fi_chick_lit_det_crime.sci_fi_cnt, sci_fi_chick_lit_det_crime.chick_lit_cnt, sci_fi_chick_lit_det_crime.det_crime_cnt, users_prize_novel_recent_200.prize_novel_cnt from sci_fi_chick_lit_det_crime
right join
users_prize_novel_recent_200 on sci_fi_chick_lit_det_crime.user_id=users_prize_novel_recent_200.user_id where sci_fi_chick_lit_det_crime.user_id is NULL);
drop temporary table if exists sci_fi_chick_lit_det_crime_prize;
create temporary table if not exists sci_fi_chick_lit_det_crime_prize(index(user_id)) as (select * from (select * from temp1 union select * from temp2) as temp);

drop temporary table if exists temp1;
create temporary table if not exists temp1(index(user_id)) as (select sci_fi_chick_lit_det_crime_prize.user_id, sci_fi_chick_lit_det_crime_prize.sci_fi_cnt, sci_fi_chick_lit_det_crime_prize.chick_lit_cnt, sci_fi_chick_lit_det_crime_prize.det_crime_cnt, sci_fi_chick_lit_det_crime_prize.prize_novel_cnt, users_best_seller_recent_200.best_seller_cnt from sci_fi_chick_lit_det_crime_prize
left join
users_best_seller_recent_200 on sci_fi_chick_lit_det_crime_prize.user_id=users_best_seller_recent_200.user_id);
drop temporary table if exists temp2;
create temporary table if not exists temp2(index(user_id)) as (select users_best_seller_recent_200.user_id, sci_fi_chick_lit_det_crime_prize.sci_fi_cnt, sci_fi_chick_lit_det_crime_prize.chick_lit_cnt, sci_fi_chick_lit_det_crime_prize.det_crime_cnt, sci_fi_chick_lit_det_crime_prize.prize_novel_cnt, users_best_seller_recent_200.best_seller_cnt from sci_fi_chick_lit_det_crime_prize
right join
users_best_seller_recent_200 on sci_fi_chick_lit_det_crime_prize.user_id=users_best_seller_recent_200.user_id where sci_fi_chick_lit_det_crime_prize.user_id is NULL);
drop temporary table if exists sci_fi_chick_lit_det_crime_prize_best;
create temporary table if not exists sci_fi_chick_lit_det_crime_prize_best(index(user_id)) as (select * from (select * from temp1 union select * from temp2) as temp);


###################################################################################################################################
create temporary table if not exists user_location_USnonUS_temp(index(user_id)) as (select * from 
(select * from user_location_USnonUS
union
select * from user_location_USnonUS_best_seller_recent_200_threshold_4
union
select * from user_location_USnonUS_prize_novel_recent_200_threshold_2) as tempo);

drop table if exists users_3genres_BS_PL_recent_threshold_count_location_info;
create table if not exists users_3genres_BS_PL_recent_threshold_count_location_info as (select sci_fi_chick_lit_det_crime_prize_best.*,user_location_USnonUS_temp.USnonUS  from sci_fi_chick_lit_det_crime_prize_best
inner join user_location_USnonUS_temp on sci_fi_chick_lit_det_crime_prize_best.user_id=user_location_USnonUS_temp.user_id where user_location_USnonUS_temp.USnonUS!=3);


#################### Queries for presentation ####################

#### Query 1
## Defining high volume as 10 or more in the target genre, how many high volume sci-fi readers,
## what is the average number of reviews in sci-fi, chick-lit, det-crime, prize-listed, best-seller. 
## Repeat the process for other categories also(US and non US). Prepare bar graphs for those results.

## Sci-fi
#US users
select sum(sci_fi_cnt)/count(sci_fi_cnt) as sci_fi_avg,sum(chick_lit_cnt)/count(chick_lit_cnt) as chick_lit_avg,
sum(det_crime_cnt)/count(det_crime_cnt) as det_crime_avg,sum(prize_novel_cnt)/count(prize_novel_cnt) as prize_novel_avg,
sum(best_seller_cnt)/count(best_seller_cnt) as best_seller_avg from users_3genres_BS_PL_recent_threshold_count_location_info where sci_fi_cnt>=10 and USnonUS=2;
#Non US users
select sum(sci_fi_cnt)/count(sci_fi_cnt) as sci_fi_avg,sum(chick_lit_cnt)/count(chick_lit_cnt) as chick_lit_avg,
sum(det_crime_cnt)/count(det_crime_cnt) as det_crime_avg,sum(prize_novel_cnt)/count(prize_novel_cnt) as prize_novel_avg,
sum(best_seller_cnt)/count(best_seller_cnt) as best_seller_avg from users_3genres_BS_PL_recent_threshold_count_location_info where sci_fi_cnt>=10 and USnonUS=1;

## Chick_lit
select sum(sci_fi_cnt)/count(sci_fi_cnt) as sci_fi_avg,sum(chick_lit_cnt)/count(chick_lit_cnt) as chick_lit_avg,
sum(det_crime_cnt)/count(det_crime_cnt) as det_crime_avg,sum(prize_novel_cnt)/count(prize_novel_cnt) as prize_novel_avg,
sum(best_seller_cnt)/count(best_seller_cnt) as best_seller_avg from users_3genres_BS_PL_recent_threshold_count_location_info where chick_lit_cnt>=10 and USnonUS=2;
#Non US users
select sum(sci_fi_cnt)/count(sci_fi_cnt) as sci_fi_avg,sum(chick_lit_cnt)/count(chick_lit_cnt) as chick_lit_avg,
sum(det_crime_cnt)/count(det_crime_cnt) as det_crime_avg,sum(prize_novel_cnt)/count(prize_novel_cnt) as prize_novel_avg,
sum(best_seller_cnt)/count(best_seller_cnt) as best_seller_avg from users_3genres_BS_PL_recent_threshold_count_location_info where chick_lit_cnt>=10 and USnonUS=1;

## Det_crime
select sum(sci_fi_cnt)/count(sci_fi_cnt) as sci_fi_avg,sum(chick_lit_cnt)/count(chick_lit_cnt) as chick_lit_avg,
sum(det_crime_cnt)/count(det_crime_cnt) as det_crime_avg,sum(prize_novel_cnt)/count(prize_novel_cnt) as prize_novel_avg,
sum(best_seller_cnt)/count(best_seller_cnt) as best_seller_avg from users_3genres_BS_PL_recent_threshold_count_location_info where det_crime_cnt>=10 and USnonUS=2;
#Non US users
select sum(sci_fi_cnt)/count(sci_fi_cnt) as sci_fi_avg,sum(chick_lit_cnt)/count(chick_lit_cnt) as chick_lit_avg,
sum(det_crime_cnt)/count(det_crime_cnt) as det_crime_avg,sum(prize_novel_cnt)/count(prize_novel_cnt) as prize_novel_avg,
sum(best_seller_cnt)/count(best_seller_cnt) as best_seller_avg from users_3genres_BS_PL_recent_threshold_count_location_info where det_crime_cnt>=10 and USnonUS=1;

## Prize_Novel
select sum(sci_fi_cnt)/count(sci_fi_cnt) as sci_fi_avg,sum(chick_lit_cnt)/count(chick_lit_cnt) as chick_lit_avg,
sum(det_crime_cnt)/count(det_crime_cnt) as det_crime_avg,sum(prize_novel_cnt)/count(prize_novel_cnt) as prize_novel_avg,
sum(best_seller_cnt)/count(best_seller_cnt) as best_seller_avg from users_3genres_BS_PL_recent_threshold_count_location_info where prize_novel_cnt>=10 and USnonUS=2;
#Non US users
select sum(sci_fi_cnt)/count(sci_fi_cnt) as sci_fi_avg,sum(chick_lit_cnt)/count(chick_lit_cnt) as chick_lit_avg,
sum(det_crime_cnt)/count(det_crime_cnt) as det_crime_avg,sum(prize_novel_cnt)/count(prize_novel_cnt) as prize_novel_avg,
sum(best_seller_cnt)/count(best_seller_cnt) as best_seller_avg from users_3genres_BS_PL_recent_threshold_count_location_info where prize_novel_cnt>=10 and USnonUS=1;

## Best_seller
select sum(sci_fi_cnt)/count(sci_fi_cnt) as sci_fi_avg,sum(chick_lit_cnt)/count(chick_lit_cnt) as chick_lit_avg,
sum(det_crime_cnt)/count(det_crime_cnt) as det_crime_avg,sum(prize_novel_cnt)/count(prize_novel_cnt) as prize_novel_avg,
sum(best_seller_cnt)/count(best_seller_cnt) as best_seller_avg from users_3genres_BS_PL_recent_threshold_count_location_info where best_seller_cnt>=10 and USnonUS=2;
#Non US users
select sum(sci_fi_cnt)/count(sci_fi_cnt) as sci_fi_avg,sum(chick_lit_cnt)/count(chick_lit_cnt) as chick_lit_avg,
sum(det_crime_cnt)/count(det_crime_cnt) as det_crime_avg,sum(prize_novel_cnt)/count(prize_novel_cnt) as prize_novel_avg,
sum(best_seller_cnt)/count(best_seller_cnt) as best_seller_avg from users_3genres_BS_PL_recent_threshold_count_location_info where best_seller_cnt>=10 and USnonUS=1;


#### Query 2
## Setting threshold of 3(inclusive), what percentage of high volume sci-fi users exceed this limit for other categories?(for US and nonUS)
# US users
# take ratio of following two quantities
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where sci_fi_cnt>=10 and chick_lit_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where sci_fi_cnt>=10 and det_crime_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where sci_fi_cnt>=10 and prize_novel_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where sci_fi_cnt>=10 and best_seller_cnt>=6 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where sci_fi_cnt>=10 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where sci_fi_cnt>=10 and chick_lit_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where sci_fi_cnt>=10 and det_crime_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where sci_fi_cnt>=10 and prize_novel_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where sci_fi_cnt>=10 and best_seller_cnt>=6 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where sci_fi_cnt>=10 and USnonUS=1;


select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where chick_lit_cnt>=10 and sci_fi_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where chick_lit_cnt>=10 and det_crime_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where chick_lit_cnt>=10 and prize_novel_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where chick_lit_cnt>=10 and best_seller_cnt>=6 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where chick_lit_cnt>=10 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where chick_lit_cnt>=10 and sci_fi_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where chick_lit_cnt>=10 and det_crime_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where chick_lit_cnt>=10 and prize_novel_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where chick_lit_cnt>=10 and best_seller_cnt>=6 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where chick_lit_cnt>=10 and USnonUS=1;


select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where det_crime_cnt>=10 and sci_fi_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where det_crime_cnt>=10 and chick_lit_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where det_crime_cnt>=10 and prize_novel_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where det_crime_cnt>=10 and best_seller_cnt>=6 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where det_crime_cnt>=10 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where det_crime_cnt>=10 and sci_fi_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where det_crime_cnt>=10 and chick_lit_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where det_crime_cnt>=10 and prize_novel_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where det_crime_cnt>=10 and best_seller_cnt>=6 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where det_crime_cnt>=10 and USnonUS=1;


select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where prize_novel_cnt>=10 and chick_lit_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where prize_novel_cnt>=10 and det_crime_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where prize_novel_cnt>=10 and sci_fi_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where prize_novel_cnt>=10 and best_seller_cnt>=6 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where prize_novel_cnt>=10 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where prize_novel_cnt>=10 and chick_lit_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where prize_novel_cnt>=10 and det_crime_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where prize_novel_cnt>=10 and sci_fi_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where prize_novel_cnt>=10 and best_seller_cnt>=6 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where prize_novel_cnt>=10 and USnonUS=1;

select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where best_seller_cnt>=10 and chick_lit_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where best_seller_cnt>=10 and det_crime_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where best_seller_cnt>=10 and prize_novel_cnt>=3 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where best_seller_cnt>=10 and sci_fi_cnt>=6 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where best_seller_cnt>=10 and USnonUS=2;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where best_seller_cnt>=10 and chick_lit_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where best_seller_cnt>=10 and det_crime_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where best_seller_cnt>=10 and prize_novel_cnt>=3 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where best_seller_cnt>=10 and sci_fi_cnt>=6 and USnonUS=1;
select count(user_id) from users_3genres_BS_PL_recent_threshold_count_location_info where best_seller_cnt>=10 and USnonUS=1;










