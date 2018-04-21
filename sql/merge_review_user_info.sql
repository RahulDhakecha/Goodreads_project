
DROP TABLE IF EXISTS `user_info`;
scp '/Users/rahuldhakecha/coursesfall2017/goodreads/files/user_data_scifi_chicklit_detcrime.csv' rahuldhakecha@ssh.wwbp.org:
ssh -L 10001:localhost:22 rahuldhakecha@ssh.wwbp.org
mv user_data_scifi_chicklit_detcrime.csv /tmp/
mysql -u rahuldhakecha -p --local-infile

## create user info table
drop table `user_info_scifi_chicklit_detcrime` ;
CREATE TABLE `user_info_scifi_chicklit_detcrime` (
  `user_id` int(20),
  `total_ratings` int(20),
  `total_reviews` int(20),
  `avg_ratings` float(20),
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

load data local infile '/tmp/user_data_scifi_chicklit_detcrime.csv' into table user_info_scifi_chicklit_detcrime fields terminated by ',' lines terminated by '\n';

## add column to above table which shows total number of reviews by users in det_crime, sci_fi and chick_lit
select user_id, count(*) as tot_cnt_scifi_detcrime_chicklit from (select * from sci_fi
union 
select * from det_crime
union 
select * from chick_lit) as temp group by user_id;


## add above result to the table of user_info_scifi_chicklit_detcrime
select user_info_scifi_chicklit_detcrime.user_id,user_info_scifi_chicklit_detcrime.total_ratings,user_info_scifi_chicklit_detcrime.total_reviews,user_info_scifi_chicklit_detcrime.avg_ratings, temp2.tot_cnt_scifi_detcrime_chicklit,((temp2.tot_cnt_scifi_detcrime_chicklit/user_info_scifi_chicklit_detcrime.total_reviews)*100) as percent_reviews  from user_info_scifi_chicklit_detcrime
inner join 
(select user_id, count(*) as tot_cnt_scifi_detcrime_chicklit from (select * from sci_fi
union 
select * from det_crime
union 
select * from chick_lit) as temp group by user_id) as temp2
on user_info_scifi_chicklit_detcrime.user_id=temp2.user_id
order by temp2.tot_cnt_scifi_detcrime_chicklit desc limit 100;


## add above result to the table of user_info_scifi_chicklit_detcrime + individual column for each genre
create table if not exists user_info_100 as 
(select user_info_scifi_chicklit_detcrime.user_id,user_info_scifi_chicklit_detcrime.total_ratings,user_info_scifi_chicklit_detcrime.total_reviews,user_info_scifi_chicklit_detcrime.avg_ratings, temp2.tot_cnt_scifi_detcrime_chicklit,((temp2.tot_cnt_scifi_detcrime_chicklit/user_info_scifi_chicklit_detcrime.total_reviews)*100) as percent_reviews, temp5.sci_fi_cnt, temp6.det_crime_cnt, temp7.chick_lit_cnt  from user_info_scifi_chicklit_detcrime
right join (select user_id,count(*) as sci_fi_cnt from sci_fi group by user_id) as temp5
right join (select user_id,count(*) as det_crime_cnt from det_crime group by user_id) as temp6
right join (select user_id,count(*) as chick_lit_cnt from chick_lit group by user_id) as temp7 
right join 
(select user_id, count(*) as tot_cnt_scifi_detcrime_chicklit from (select * from sci_fi
union 
select * from det_crime
union 
select * from chick_lit) as temp group by user_id) as temp2
on user_info_scifi_chicklit_detcrime.user_id=temp2.user_id and user_info_scifi_chicklit_detcrime.user_id=temp5.user_id and user_info_scifi_chicklit_detcrime.user_id=temp6.user_id and user_info_scifi_chicklit_detcrime.user_id=temp7.user_id
order by temp2.tot_cnt_scifi_detcrime_chicklit desc limit 100);

mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from user_info_100" > user_info_100.csv

scp -r rahuldhakecha@ssh.wwbp.org:user_info_100.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/


# add a new column and assign US/NonUS tag to each user dependent on data
select temp_full_scifi_chicklit_detcrime_fin.user_id,temp_full_scifi_chicklit_detcrime_fin.sci_fi_cnt,temp_full_scifi_chicklit_detcrime_fin.chick_lit_cnt,temp_full_scifi_chicklit_detcrime_fin.det_crime_cnt,
case 
when temp_full_scifi_chicklit_detcrime_fin.sci_fi_cnt>=temp_full_scifi_chicklit_detcrime_fin.chick_lit_cnt and temp_full_scifi_chicklit_detcrime_fin.sci_fi_cnt>=temp_full_scifi_chicklit_detcrime_fin.det_crime_cnt then 1
when temp_full_scifi_chicklit_detcrime_fin.chick_lit_cnt>temp_full_scifi_chicklit_detcrime_fin.sci_fi_cnt and temp_full_scifi_chicklit_detcrime_fin.chick_lit_cnt>=temp_full_scifi_chicklit_detcrime_fin.det_crime_cnt then 2
when temp_full_scifi_chicklit_detcrime_fin.det_crime_cnt>temp_full_scifi_chicklit_detcrime_fin.chick_lit_cnt and temp_full_scifi_chicklit_detcrime_fin.det_crime_cnt>temp_full_scifi_chicklit_detcrime_fin.sci_fi_cnt then 3
end as user_genre
from temp_full_scifi_chicklit_detcrime_fin












create temporary table if not exists sci_fi_very_temp(index(user_id)) as (select user_id,count(*) as sci_fi_cnt from sci_fi group by user_id);
create temporary table if not exists det_crime_very_temp(index(user_id)) as (select user_id,count(*) as det_crime_cnt from det_crime group by user_id);
create temporary table if not exists chick_lit_very_temp(index(user_id)) as (select user_id,count(*) as chick_lit_cnt from chick_lit group by user_id);



select user_info_scifi_chicklit_detcrime.user_id,user_info_scifi_chicklit_detcrime.total_ratings,user_info_scifi_chicklit_detcrime.total_reviews,user_info_scifi_chicklit_detcrime.avg_ratings, temp2.tot_cnt_scifi_detcrime_chicklit,((temp2.tot_cnt_scifi_detcrime_chicklit/user_info_scifi_chicklit_detcrime.total_reviews)*100) as percent_reviews, temp5.sci_fi_cnt, temp5.det_crime_cnt, temp5.chick_lit_cnt from user_info_scifi_chicklit_detcrime
inner join
(select user_id, count(*) as tot_cnt_scifi_detcrime_chicklit from (select * from sci_fi
union 
select * from det_crime
union 
select * from chick_lit) as temp group by user_id) as temp2
inner join (select user_id,sci_fi_cnt,det_crime_cnt,chick_lit_cnt from temp_full_A_B_C) as temp5
on user_info_scifi_chicklit_detcrime.user_id=temp2.user_id and user_info_scifi_chicklit_detcrime.user_id=temp5.user_id
order by temp2.tot_cnt_scifi_detcrime_chicklit desc limit 100;

drop table if exists temp_left_A_B;
drop table if exists temp_right_A_B;
drop table if exists temp_full_A_B;
drop table if exists temp_left_A_B_C;
drop table if exists temp_right_A_B_C;
drop table if exists temp_full_A_B_C;

create temporary table if not exists temp_left_A_B(index(user_id)) as (select sci_fi_very_temp.user_id,sci_fi_very_temp.sci_fi_cnt,det_crime_very_temp.det_crime_cnt  from sci_fi_very_temp left join det_crime_very_temp on sci_fi_very_temp.user_id=det_crime_very_temp.user_id);
create temporary table if not exists temp_right_A_B(index(user_id)) as (select sci_fi_very_temp.user_id,sci_fi_very_temp.sci_fi_cnt,det_crime_very_temp.det_crime_cnt from sci_fi_very_temp right join det_crime_very_temp on sci_fi_very_temp.user_id=det_crime_very_temp.user_id where sci_fi_very_temp.user_id is NULL);
create temporary table if not exists temp_full_A_B(index(user_id)) as (select * from (select temp_left_A_B.user_id,temp_left_A_B.sci_fi_cnt,temp_left_A_B.det_crime_cnt from temp_left_A_B union select * from temp_right_A_B) as temp);

create temporary table if not exists temp_left_A_B_C(index(user_id)) as (select temp_full_A_B.user_id,temp_full_A_B.sci_fi_cnt,temp_full_A_B.det_crime_cnt,chick_lit_very_temp.chick_lit_cnt from temp_full_A_B left join chick_lit_very_temp on temp_full_A_B.user_id=chick_lit_very_temp.user_id);
create temporary table if not exists temp_right_A_B_C(index(user_id)) as (select temp_full_A_B.user_id,temp_full_A_B.sci_fi_cnt,temp_full_A_B.det_crime_cnt,chick_lit_very_temp.chick_lit_cnt from temp_full_A_B right join chick_lit_very_temp on temp_full_A_B.user_id=chick_lit_very_temp.user_id where temp_full_A_B.user_id is NULL);
create temporary table if not exists temp_full_A_B_C(index(user_id)) as (select * from(select * from temp_left_A_B_C union all select * from temp_right_A_B_C) as temp);


create table if not exists user_info_100 as 
(select user_info_scifi_chicklit_detcrime.user_id,user_info_scifi_chicklit_detcrime.total_ratings,user_info_scifi_chicklit_detcrime.total_reviews,user_info_scifi_chicklit_detcrime.avg_ratings, temp2.tot_cnt_scifi_detcrime_chicklit,((temp2.tot_cnt_scifi_detcrime_chicklit/user_info_scifi_chicklit_detcrime.total_reviews)*100) as percent_reviews, temp5.sci_fi_cnt, temp5.det_crime_cnt, temp5.chick_lit_cnt from user_info_scifi_chicklit_detcrime
inner join
(select user_id, count(*) as tot_cnt_scifi_detcrime_chicklit from (select * from sci_fi
union 
select * from det_crime
union 
select * from chick_lit) as temp group by user_id) as temp2
inner join (select user_id,sci_fi_cnt,det_crime_cnt,chick_lit_cnt from temp_full_A_B_C) as temp5
on user_info_scifi_chicklit_detcrime.user_id=temp2.user_id and user_info_scifi_chicklit_detcrime.user_id=temp5.user_id
order by temp2.tot_cnt_scifi_detcrime_chicklit desc limit 100);


