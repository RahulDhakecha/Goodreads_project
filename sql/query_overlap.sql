select temp1.user_id from (select distinct user_id from chick_lit) as temp1 inner join (select distinct user_id from sci_fi) as temp2 where temp1.user_id=temp2.user_id;
2719

select temp1.user_id from (select distinct user_id from chick_lit) as temp1 inner join (select distinct user_id from det_crime) as temp2 where temp1.user_id=temp2.user_id;
4729

select temp1.user_id from (select distinct user_id from sci_fi) as temp1 inner join (select distinct user_id from det_crime) as temp2 where temp1.user_id=temp2.user_id;
4088



select temp1.user_id from (select distinct user_id from sci_fi) as temp1 inner join (select distinct user_id from det_crime) as temp2 inner join (select distinct user_id from chick_lit) as temp3 where temp1.user_id=temp2.user_id and temp1.user_id=temp3.user_id and temp2.user_id=temp3.user_id;
1115 

## Combined table for overlapping users(all 3 genres) arranged according to descinding counts of sci_fi
select temp4.user_id, temp5.sci_fi_cnt,temp6.det_crime_cnt, temp7.chick_lit_cnt, ((temp5.sci_fi_cnt/(temp5.sci_fi_cnt+temp6.det_crime_cnt+temp7.chick_lit_cnt))*100) as percent_sci_fi from (select temp1.user_id as user_id from (select distinct user_id from sci_fi) as temp1 inner join (select distinct user_id from det_crime) as temp2 inner join (select distinct user_id from chick_lit) as temp3 where temp1.user_id=temp2.user_id and temp1.user_id=temp3.user_id) as temp4
inner join (select user_id,count(*) as sci_fi_cnt from sci_fi group by user_id) as temp5
inner join (select user_id,count(*) as det_crime_cnt from det_crime group by user_id) as temp6
inner join (select user_id,count(*) as chick_lit_cnt from chick_lit group by user_id) as temp7 where temp4.user_id=temp5.user_id and temp4.user_id=temp6.user_id and temp4.user_id=temp7.user_id
order by temp5.sci_fi_cnt desc limit 50;

## Combined table for overlapping users(all 3 genres) arranged according to descinding counts of det_crime
select temp4.user_id, temp5.sci_fi_cnt,temp6.det_crime_cnt, temp7.chick_lit_cnt, ((temp6.det_crime_cnt/(temp5.sci_fi_cnt+temp6.det_crime_cnt+temp7.chick_lit_cnt))*100) as percent_det_crime from (select temp1.user_id as user_id from (select distinct user_id from sci_fi) as temp1 inner join (select distinct user_id from det_crime) as temp2 inner join (select distinct user_id from chick_lit) as temp3 where temp1.user_id=temp2.user_id and temp1.user_id=temp3.user_id) as temp4
inner join (select user_id,count(*) as sci_fi_cnt from sci_fi group by user_id) as temp5
inner join (select user_id,count(*) as det_crime_cnt from det_crime group by user_id) as temp6
inner join (select user_id,count(*) as chick_lit_cnt from chick_lit group by user_id) as temp7 where temp4.user_id=temp5.user_id and temp4.user_id=temp6.user_id and temp4.user_id=temp7.user_id
order by temp6.det_crime_cnt desc limit 50;

## Combined table for overlapping users(all 3 genres) arranged according to descinding counts of chick_lit
select temp4.user_id, temp5.sci_fi_cnt,temp6.det_crime_cnt, temp7.chick_lit_cnt, ((temp7.chick_lit_cnt/(temp5.sci_fi_cnt+temp6.det_crime_cnt+temp7.chick_lit_cnt))*100) as percent_chick_lit from (select temp1.user_id as user_id from (select distinct user_id from sci_fi) as temp1 inner join (select distinct user_id from det_crime) as temp2 inner join (select distinct user_id from chick_lit) as temp3 where temp1.user_id=temp2.user_id and temp1.user_id=temp3.user_id) as temp4
inner join (select user_id,count(*) as sci_fi_cnt from sci_fi group by user_id) as temp5
inner join (select user_id,count(*) as det_crime_cnt from det_crime group by user_id) as temp6
inner join (select user_id,count(*) as chick_lit_cnt from chick_lit group by user_id) as temp7 where temp4.user_id=temp5.user_id and temp4.user_id=temp6.user_id and temp4.user_id=temp7.user_id
order by temp7.chick_lit_cnt desc limit 50;




## Combined table for overlapping users(sci_fi + det_crime) arranged according to descinding counts of sci_fi
select temp4.user_id, temp5.sci_fi_cnt,temp6.det_crime_cnt, temp7.chick_lit_cnt, ((temp5.sci_fi_cnt/(temp5.sci_fi_cnt+temp6.det_crime_cnt+temp7.chick_lit_cnt))*100) as percent_sci_fi from (select temp1.user_id as user_id from (select distinct user_id from sci_fi) as temp1 inner join (select distinct user_id from det_crime) as temp2 where temp1.user_id=temp2.user_id) as temp4
inner join (select user_id,count(*) as sci_fi_cnt from sci_fi group by user_id) as temp5
inner join (select user_id,count(*) as det_crime_cnt from det_crime group by user_id) as temp6
inner join (select user_id,count(*) as chick_lit_cnt from chick_lit group by user_id) as temp7 where temp4.user_id=temp5.user_id and temp4.user_id=temp6.user_id and temp4.user_id=temp7.user_id
order by temp5.sci_fi_cnt desc limit 50;

## Combined table for overlapping users(sci_fi + det_crime) arranged according to descinding counts of det_crime
select temp4.user_id, temp5.sci_fi_cnt,temp6.det_crime_cnt, temp7.chick_lit_cnt, ((temp6.det_crime_cnt/(temp5.sci_fi_cnt+temp6.det_crime_cnt+temp7.chick_lit_cnt))*100) as percent_det_crime from (select temp1.user_id as user_id from (select distinct user_id from sci_fi) as temp1 inner join (select distinct user_id from det_crime) as temp2 where temp1.user_id=temp2.user_id) as temp4
inner join (select user_id,count(*) as sci_fi_cnt from sci_fi group by user_id) as temp5
inner join (select user_id,count(*) as det_crime_cnt from det_crime group by user_id) as temp6
inner join (select user_id,count(*) as chick_lit_cnt from chick_lit group by user_id) as temp7 where temp4.user_id=temp5.user_id and temp4.user_id=temp6.user_id and temp4.user_id=temp7.user_id
order by temp6.det_crime_cnt desc limit 50;

## Combined table for overlapping users(sci_fi + chick_lit) arranged according to descinding counts of sci_fi
select temp4.user_id, temp5.sci_fi_cnt,temp6.det_crime_cnt, temp7.chick_lit_cnt, ((temp5.sci_fi_cnt/(temp5.sci_fi_cnt+temp6.det_crime_cnt+temp7.chick_lit_cnt))*100) as percent_sci_fi from (select temp1.user_id as user_id from (select distinct user_id from sci_fi) as temp1 inner join (select distinct user_id from chick_lit) as temp2 where temp1.user_id=temp2.user_id) as temp4
inner join (select user_id,count(*) as sci_fi_cnt from sci_fi group by user_id) as temp5
inner join (select user_id,count(*) as det_crime_cnt from det_crime group by user_id) as temp6
inner join (select user_id,count(*) as chick_lit_cnt from chick_lit group by user_id) as temp7 where temp4.user_id=temp5.user_id and temp4.user_id=temp6.user_id and temp4.user_id=temp7.user_id
order by temp5.sci_fi_cnt desc limit 50;

## Combined table for overlapping users(sci_fi + chick_lit) arranged according to descinding counts of sci_fi
select temp4.user_id, temp5.sci_fi_cnt,temp6.det_crime_cnt, temp7.chick_lit_cnt, ((temp7.chick_lit_cnt/(temp5.sci_fi_cnt+temp6.det_crime_cnt+temp7.chick_lit_cnt))*100) as percent_chick_lit from (select temp1.user_id as user_id from (select distinct user_id from sci_fi) as temp1 inner join (select distinct user_id from chick_lit) as temp2 where temp1.user_id=temp2.user_id) as temp4
inner join (select user_id,count(*) as sci_fi_cnt from sci_fi group by user_id) as temp5
inner join (select user_id,count(*) as det_crime_cnt from det_crime group by user_id) as temp6
inner join (select user_id,count(*) as chick_lit_cnt from chick_lit group by user_id) as temp7 where temp4.user_id=temp5.user_id and temp4.user_id=temp6.user_id and temp4.user_id=temp7.user_id
order by temp7.chick_lit_cnt desc limit 50;






create temporary table if not exists temp_sci_fi(index(user_id)) as (select user_id, count(*) as sci_fi_cnt from sci_fi group by user_id);
create temporary table if not exists temp_chick_lit(index(user_id)) as (select user_id, count(*) as chick_lit_cnt from chick_lit group by user_id);
create temporary table if not exists temp_det_crime(index(user_id)) as (select user_id, count(*) as det_crime_cnt from det_crime group by user_id);

## full outer join based on left join and right join
create temporary table if not exists temp_left_scifi_chicklit(index(user_id)) as (select temp_sci_fi.user_id, sci_fi_cnt, chick_lit_cnt from temp_sci_fi left join temp_chick_lit on temp_sci_fi.user_id=temp_chick_lit.user_id);
create temporary table if not exists temp_right_scifi_chicklit(index(user_id)) as (select temp_chick_lit.user_id, sci_fi_cnt, chick_lit_cnt from temp_sci_fi right join temp_chick_lit on temp_sci_fi.user_id=temp_chick_lit.user_id where temp_sci_fi.user_id is NULL);
create temporary table if not exists temp_full_scifi_chicklit(index(user_id)) as (select * from (select * from temp_left_scifi_chicklit union select * from temp_right_scifi_chicklit) as temp);

create temporary table if not exists temp_left_scifi_chicklit_detcrime(index(user_id)) as (select temp_full_scifi_chicklit.user_id, sci_fi_cnt, chick_lit_cnt, det_crime_cnt from temp_full_scifi_chicklit left join temp_det_crime on temp_full_scifi_chicklit.user_id=temp_det_crime.user_id);
create temporary table if not exists temp_right_scifi_chicklit_detcrime(index(user_id)) as (select temp_det_crime.user_id, sci_fi_cnt, chick_lit_cnt, det_crime_cnt from temp_full_scifi_chicklit right join temp_det_crime on temp_full_scifi_chicklit.user_id=temp_det_crime.user_id where temp_full_scifi_chicklit.user_id is NULL);
create temporary table if not exists temp_full_scifi_chicklit_detcrime(index(user_id)) as (select * from(select * from temp_left_scifi_chicklit_detcrime union all select * from temp_right_scifi_chicklit_detcrime) as temp);


## replace nulls with zero
create temporary table if not exists temp_full_scifi_chicklit_detcrime_fin(index(user_id)) as (SELECT user_id,coalesce(sci_fi_cnt, 0 ) as sci_fi_cnt,coalesce(chick_lit_cnt, 0 ) as chick_lit_cnt,coalesce(det_crime_cnt, 0 ) as det_crime_cnt  FROM temp_full_scifi_chicklit_detcrime);

## Query to assign genres to different users based on maximum number of reviews for a particular kind of books they have reviewes
## 1- Scifi, 2- Chick_lit, 3- Detective crime
create temporary table if not exists temp_user_genre(index(user_id)) as (select temp_full_scifi_chicklit_detcrime_fin.user_id,temp_full_scifi_chicklit_detcrime_fin.sci_fi_cnt,temp_full_scifi_chicklit_detcrime_fin.chick_lit_cnt,temp_full_scifi_chicklit_detcrime_fin.det_crime_cnt,
case 
when temp_full_scifi_chicklit_detcrime_fin.sci_fi_cnt>=temp_full_scifi_chicklit_detcrime_fin.chick_lit_cnt and temp_full_scifi_chicklit_detcrime_fin.sci_fi_cnt>=temp_full_scifi_chicklit_detcrime_fin.det_crime_cnt then 1
when temp_full_scifi_chicklit_detcrime_fin.chick_lit_cnt>temp_full_scifi_chicklit_detcrime_fin.sci_fi_cnt and temp_full_scifi_chicklit_detcrime_fin.chick_lit_cnt>=temp_full_scifi_chicklit_detcrime_fin.det_crime_cnt then 2
when temp_full_scifi_chicklit_detcrime_fin.det_crime_cnt>temp_full_scifi_chicklit_detcrime_fin.chick_lit_cnt and temp_full_scifi_chicklit_detcrime_fin.det_crime_cnt>temp_full_scifi_chicklit_detcrime_fin.sci_fi_cnt then 3
end as user_genre
from temp_full_scifi_chicklit_detcrime_fin);


######### SCI FI books#####################
create temporary table if not exists temp_user_genre_sci_fi(index(user_id)) as (select sci_fi.book_id, sci_fi.user_id, temp_user_genre.user_genre from sci_fi left join temp_user_genre on sci_fi.user_id=temp_user_genre.user_id);

create temporary table if not exists temp_user_genre_sci_fi_reviewer_sci_fi(index(book_id)) as (select *,count(*) as sci_fi_reviewers_cnt from temp_user_genre_sci_fi where user_genre=1 group by book_id);
create temporary table if not exists temp_user_genre_sci_fi_reviewer_chick_lit(index(book_id)) as (select *,count(*) as chick_lit_reviewers_cnt from temp_user_genre_sci_fi where user_genre=2 group by book_id);
create temporary table if not exists temp_user_genre_sci_fi_reviewer_det_crime(index(book_id)) as (select *,count(*) as det_crime_reviewers_cnt from temp_user_genre_sci_fi where user_genre=3 group by book_id);

## inner join
create table if not exists sci_fi_books_other_reviewers(index(book_id)) as (select temp_user_genre_sci_fi_reviewer_sci_fi.book_id,temp_user_genre_sci_fi_reviewer_sci_fi.sci_fi_reviewers_cnt,temp_user_genre_sci_fi_reviewer_chick_lit.chick_lit_reviewers_cnt,temp_user_genre_sci_fi_reviewer_det_crime.det_crime_reviewers_cnt,(((temp_user_genre_sci_fi_reviewer_chick_lit.chick_lit_reviewers_cnt+temp_user_genre_sci_fi_reviewer_det_crime.det_crime_reviewers_cnt)/(temp_user_genre_sci_fi_reviewer_chick_lit.chick_lit_reviewers_cnt+temp_user_genre_sci_fi_reviewer_det_crime.det_crime_reviewers_cnt+temp_user_genre_sci_fi_reviewer_sci_fi.sci_fi_reviewers_cnt))*100) as percent_other_reviewers from temp_user_genre_sci_fi_reviewer_sci_fi
inner join temp_user_genre_sci_fi_reviewer_chick_lit
inner join temp_user_genre_sci_fi_reviewer_det_crime on temp_user_genre_sci_fi_reviewer_sci_fi.book_id=temp_user_genre_sci_fi_reviewer_chick_lit.book_id and temp_user_genre_sci_fi_reviewer_sci_fi.book_id=temp_user_genre_sci_fi_reviewer_det_crime.book_id
order by (temp_user_genre_sci_fi_reviewer_chick_lit.chick_lit_reviewers_cnt+temp_user_genre_sci_fi_reviewer_det_crime.det_crime_reviewers_cnt) desc limit 50);

## outer join
create temporary table if not exists temp_left_reviewer_sci_fi_chick_lit(index(user_id)) as (select temp_user_genre_sci_fi_reviewer_sci_fi.user_id, sci_fi_cnt, chick_lit_cnt from temp_user_genre_sci_fi_reviewer_sci_fi left join temp_chick_lit on temp_sci_fi.user_id=temp_chick_lit.user_id);
create temporary table if not exists temp_right_scifi_chicklit(index(user_id)) as (select temp_chick_lit.user_id, sci_fi_cnt, chick_lit_cnt from temp_sci_fi right join temp_chick_lit on temp_sci_fi.user_id=temp_chick_lit.user_id where temp_sci_fi.user_id is NULL);
create temporary table if not exists temp_full_scifi_chicklit(index(user_id)) as (select * from (select * from temp_left_scifi_chicklit union select * from temp_right_scifi_chicklit) as temp);

create temporary table if not exists temp_left_scifi_chicklit_detcrime(index(user_id)) as (select temp_full_scifi_chicklit.user_id, sci_fi_cnt, chick_lit_cnt, det_crime_cnt from temp_full_scifi_chicklit left join temp_det_crime on temp_full_scifi_chicklit.user_id=temp_det_crime.user_id);
create temporary table if not exists temp_right_scifi_chicklit_detcrime(index(user_id)) as (select temp_det_crime.user_id, sci_fi_cnt, chick_lit_cnt, det_crime_cnt from temp_full_scifi_chicklit right join temp_det_crime on temp_full_scifi_chicklit.user_id=temp_det_crime.user_id where temp_full_scifi_chicklit.user_id is NULL);
create temporary table if not exists temp_full_scifi_chicklit_detcrime(index(user_id)) as (select * from(select * from temp_left_scifi_chicklit_detcrime union all select * from temp_right_scifi_chicklit_detcrime) as temp);



mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from sci_fi_books_other_reviewers" > sci_fi_books_other_reviewers.csv
scp -r rahuldhakecha@ssh.wwbp.org:sci_fi_books_other_reviewers.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/
##############################################


######### CHICK LIT books#####################
create temporary table if not exists temp_user_genre_chick_lit(index(user_id)) as (select chick_lit.book_id, chick_lit.user_id, temp_user_genre.user_genre from chick_lit left join temp_user_genre on chick_lit.user_id=temp_user_genre.user_id);

create temporary table if not exists temp_user_genre_chick_lit_reviewer_sci_fi(index(book_id)) as (select *,count(*) as sci_fi_reviewers_cnt from temp_user_genre_chick_lit where user_genre=1 group by book_id);
create temporary table if not exists temp_user_genre_chick_lit_reviewer_chick_lit(index(book_id)) as (select *,count(*) as chick_lit_reviewers_cnt from temp_user_genre_chick_lit where user_genre=2 group by book_id);
create temporary table if not exists temp_user_genre_chick_lit_reviewer_det_crime(index(book_id)) as (select *,count(*) as det_crime_reviewers_cnt from temp_user_genre_chick_lit where user_genre=3 group by book_id);

## inner join
create table if not exists chick_lit_books_other_reviewers(index(book_id)) as (select temp_user_genre_chick_lit_reviewer_sci_fi.book_id,temp_user_genre_chick_lit_reviewer_sci_fi.sci_fi_reviewers_cnt,temp_user_genre_chick_lit_reviewer_chick_lit.chick_lit_reviewers_cnt,temp_user_genre_chick_lit_reviewer_det_crime.det_crime_reviewers_cnt,(((temp_user_genre_chick_lit_reviewer_sci_fi.sci_fi_reviewers_cnt+temp_user_genre_chick_lit_reviewer_det_crime.det_crime_reviewers_cnt)/(temp_user_genre_chick_lit_reviewer_sci_fi.sci_fi_reviewers_cnt+temp_user_genre_chick_lit_reviewer_det_crime.det_crime_reviewers_cnt+temp_user_genre_chick_lit_reviewer_chick_lit.chick_lit_reviewers_cnt))*100) as percent_other_reviewers   from temp_user_genre_chick_lit_reviewer_sci_fi
inner join temp_user_genre_chick_lit_reviewer_chick_lit
inner join temp_user_genre_chick_lit_reviewer_det_crime on temp_user_genre_chick_lit_reviewer_sci_fi.book_id=temp_user_genre_chick_lit_reviewer_chick_lit.book_id and temp_user_genre_chick_lit_reviewer_sci_fi.book_id=temp_user_genre_chick_lit_reviewer_det_crime.book_id
order by (temp_user_genre_chick_lit_reviewer_sci_fi.sci_fi_reviewers_cnt+temp_user_genre_chick_lit_reviewer_det_crime.det_crime_reviewers_cnt) desc limit 50);

## outer join
create temporary table if not exists temp_left_reviewer_sci_fi_chick_lit(index(user_id)) as (select temp_user_genre_sci_fi_reviewer_sci_fi.user_id, sci_fi_cnt, chick_lit_cnt from temp_user_genre_sci_fi_reviewer_sci_fi left join temp_chick_lit on temp_sci_fi.user_id=temp_chick_lit.user_id);
create temporary table if not exists temp_right_scifi_chicklit(index(user_id)) as (select temp_chick_lit.user_id, sci_fi_cnt, chick_lit_cnt from temp_sci_fi right join temp_chick_lit on temp_sci_fi.user_id=temp_chick_lit.user_id where temp_sci_fi.user_id is NULL);
create temporary table if not exists temp_full_scifi_chicklit(index(user_id)) as (select * from (select * from temp_left_scifi_chicklit union select * from temp_right_scifi_chicklit) as temp);

create temporary table if not exists temp_left_scifi_chicklit_detcrime(index(user_id)) as (select temp_full_scifi_chicklit.user_id, sci_fi_cnt, chick_lit_cnt, det_crime_cnt from temp_full_scifi_chicklit left join temp_det_crime on temp_full_scifi_chicklit.user_id=temp_det_crime.user_id);
create temporary table if not exists temp_right_scifi_chicklit_detcrime(index(user_id)) as (select temp_det_crime.user_id, sci_fi_cnt, chick_lit_cnt, det_crime_cnt from temp_full_scifi_chicklit right join temp_det_crime on temp_full_scifi_chicklit.user_id=temp_det_crime.user_id where temp_full_scifi_chicklit.user_id is NULL);
create temporary table if not exists temp_full_scifi_chicklit_detcrime(index(user_id)) as (select * from(select * from temp_left_scifi_chicklit_detcrime union all select * from temp_right_scifi_chicklit_detcrime) as temp);

mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from chick_lit_books_other_reviewers" > chick_lit_books_other_reviewers.csv
scp -r rahuldhakecha@ssh.wwbp.org:chick_lit_books_other_reviewers.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/
##############################################



######### CHICK LIT books#####################
create temporary table if not exists temp_user_genre_det_crime(index(user_id)) as (select det_crime.book_id, det_crime.user_id, temp_user_genre.user_genre from det_crime left join temp_user_genre on det_crime.user_id=temp_user_genre.user_id);

create temporary table if not exists temp_user_genre_det_crime_reviewer_sci_fi(index(book_id)) as (select *,count(*) as sci_fi_reviewers_cnt from temp_user_genre_det_crime where user_genre=1 group by book_id);
create temporary table if not exists temp_user_genre_det_crime_reviewer_chick_lit(index(book_id)) as (select *,count(*) as chick_lit_reviewers_cnt from temp_user_genre_det_crime where user_genre=2 group by book_id);
create temporary table if not exists temp_user_genre_det_crime_reviewer_det_crime(index(book_id)) as (select *,count(*) as det_crime_reviewers_cnt from temp_user_genre_det_crime where user_genre=3 group by book_id);

## inner join
create table if not exists det_crime_books_other_reviewers(index(book_id)) as (select temp_user_genre_det_crime_reviewer_sci_fi.book_id,temp_user_genre_det_crime_reviewer_sci_fi.sci_fi_reviewers_cnt,temp_user_genre_det_crime_reviewer_chick_lit.chick_lit_reviewers_cnt,temp_user_genre_det_crime_reviewer_det_crime.det_crime_reviewers_cnt,(((temp_user_genre_det_crime_reviewer_chick_lit.chick_lit_reviewers_cnt+temp_user_genre_det_crime_reviewer_sci_fi.sci_fi_reviewers_cnt)/(temp_user_genre_det_crime_reviewer_chick_lit.chick_lit_reviewers_cnt+temp_user_genre_det_crime_reviewer_sci_fi.sci_fi_reviewers_cnt+temp_user_genre_det_crime_reviewer_det_crime.det_crime_reviewers_cnt))*100) as percent_other_reviewers   from temp_user_genre_det_crime_reviewer_sci_fi
inner join temp_user_genre_det_crime_reviewer_chick_lit
inner join temp_user_genre_det_crime_reviewer_det_crime on temp_user_genre_det_crime_reviewer_sci_fi.book_id=temp_user_genre_det_crime_reviewer_chick_lit.book_id and temp_user_genre_det_crime_reviewer_sci_fi.book_id=temp_user_genre_det_crime_reviewer_det_crime.book_id
order by (temp_user_genre_det_crime_reviewer_chick_lit.chick_lit_reviewers_cnt+temp_user_genre_det_crime_reviewer_sci_fi.sci_fi_reviewers_cnt) desc limit 50);

## outer join
create temporary table if not exists temp_left_reviewer_sci_fi_chick_lit(index(user_id)) as (select temp_user_genre_sci_fi_reviewer_sci_fi.user_id, sci_fi_cnt, chick_lit_cnt from temp_user_genre_sci_fi_reviewer_sci_fi left join temp_chick_lit on temp_sci_fi.user_id=temp_chick_lit.user_id);
create temporary table if not exists temp_right_scifi_chicklit(index(user_id)) as (select temp_chick_lit.user_id, sci_fi_cnt, chick_lit_cnt from temp_sci_fi right join temp_chick_lit on temp_sci_fi.user_id=temp_chick_lit.user_id where temp_sci_fi.user_id is NULL);
create temporary table if not exists temp_full_scifi_chicklit(index(user_id)) as (select * from (select * from temp_left_scifi_chicklit union select * from temp_right_scifi_chicklit) as temp);

create temporary table if not exists temp_left_scifi_chicklit_detcrime(index(user_id)) as (select temp_full_scifi_chicklit.user_id, sci_fi_cnt, chick_lit_cnt, det_crime_cnt from temp_full_scifi_chicklit left join temp_det_crime on temp_full_scifi_chicklit.user_id=temp_det_crime.user_id);
create temporary table if not exists temp_right_scifi_chicklit_detcrime(index(user_id)) as (select temp_det_crime.user_id, sci_fi_cnt, chick_lit_cnt, det_crime_cnt from temp_full_scifi_chicklit right join temp_det_crime on temp_full_scifi_chicklit.user_id=temp_det_crime.user_id where temp_full_scifi_chicklit.user_id is NULL);
create temporary table if not exists temp_full_scifi_chicklit_detcrime(index(user_id)) as (select * from(select * from temp_left_scifi_chicklit_detcrime union all select * from temp_right_scifi_chicklit_detcrime) as temp);

mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from det_crime_books_other_reviewers" > det_crime_books_other_reviewers.csv
scp -r rahuldhakecha@ssh.wwbp.org:det_crime_books_other_reviewers.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/
##############################################



