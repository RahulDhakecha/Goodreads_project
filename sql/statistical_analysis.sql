## Query to find books read by users whose primary genre is different, for ex, for chick_lit users, find sci_fi and det_crime books read by them
# we limit to the users who have atleast reviewed more than 6 books in particular genre

## CHICK LIT WITH OTHERS
drop temporary table if exists chick_lit_users;
create temporary table if not exists chick_lit_users(index(user_id)) as (select * from (select user_id,count(*) as cnt from chick_lit group by user_id) as temp where temp.cnt>6);
# most frequently read sci_fi books by chick_lit readers	
select book_id, count(*) as book_cnt from (select * from sci_fi where user_id in (select user_id from chick_lit_users)) as temp group by temp.book_id order by book_cnt desc;
# most frequently read det_crime books by chick_lit readers	
select book_id, count(*) as book_cnt from (select * from det_crime where user_id in (select user_id from chick_lit_users)) as temp group by temp.book_id order by book_cnt desc;



## SCI FI WITH OTHERS
drop temporary table if exists sci_fi_users;
create temporary table if not exists sci_fi_users(index(user_id)) as (select * from (select user_id,count(*) as cnt from sci_fi group by user_id) as temp where temp.cnt>6);
# most frequently read chick_lit books by sci_fi readers	
select book_id, count(*) as book_cnt from (select * from chick_lit where user_id in (select user_id from sci_fi_users)) as temp group by temp.book_id order by book_cnt desc;
# most frequently read det_crime books by sci_fi readers	
select book_id, count(*) as book_cnt from (select * from det_crime where user_id in (select user_id from sci_fi_users)) as temp group by temp.book_id order by book_cnt desc;


## DET CRIME WITH OTHERS
drop temporary table if exists det_crime_users;
create temporary table if not exists det_crime_users(index(user_id)) as (select * from (select user_id,count(*) as cnt from det_crime group by user_id) as temp where temp.cnt>6);
# most frequently read sci_fi books by det_crime readers	
select book_id, count(*) as book_cnt from (select * from sci_fi where user_id in (select user_id from det_crime_users)) as temp group by temp.book_id order by book_cnt desc;
# most frequently read chick_lit books by det_crime readers	
select book_id, count(*) as book_cnt from (select * from chick_lit where user_id in (select user_id from det_crime_users)) as temp group by temp.book_id order by book_cnt desc;


## BEST SELLER WITH PRIZE LISTED
drop temporary table if exists prize_listed_users;
create temporary table if not exists prize_listed_users(index(uid)) as (select * from (select uid,count(*) as cnt from review_prize_novel group by uid) as temp where temp.cnt>6);
select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select uid from prize_listed_users)) as temp group by temp.bid order by book_cnt desc;
## PRIZE LISTED WITH BEST SELLER
drop temporary table if exists best_seller_users;
create temporary table if not exists best_seller_users(index(uid)) as (select * from (select uid,count(*) as cnt from review_best_seller group by uid) as temp where temp.cnt>6);
select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select uid from best_seller_users)) as temp group by temp.bid order by book_cnt desc;


## most frequently read best seller books by chick_lit readers
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select user_id from chick_lit_users)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from book) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read best seller books by sci_fi readers
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select user_id from sci_fi_users)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from book) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read best seller books by det_crime readers
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select user_id from det_crime_users)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from book) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read best seller books by chick_lit readers
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select user_id from chick_lit_users)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from book) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read best seller books by sci_fi readers
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select user_id from sci_fi_users)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from book) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read best seller books by det_crime readers
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select user_id from det_crime_users)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from book) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;


############# RECENT 200 BOOKS ####################
drop temporary table if exists best_seller_books_recent_200;
create temporary table if not exists best_seller_books_recent_200(index(bid)) as
(select temp2.*, temp1.orig_publ_date from 
(select * from book_pub_date) as temp1
inner join 
(select bname, bid from book) as temp2 on temp1.title=temp2.bname order by temp1.orig_publ_date desc limit 200);
## most frequently read best seller books(recent 200 novels) by chick_lit readers
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select user_id from chick_lit_users)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read best seller books by sci_fi readers
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select user_id from sci_fi_users)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read best seller books by det_crime readers
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select user_id from det_crime_users)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;

## most frequently read best seller books by chick_lit readers
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select user_id from chick_lit_users)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read best seller books by sci_fi readers
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select user_id from sci_fi_users)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read best seller books by det_crime readers
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select user_id from det_crime_users)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;


## we repeat above process by dividing users into US and non US categories
## CHICK LIT WITH OTHERS
drop temporary table if exists chick_lit_users_nonUS;
create temporary table if not exists chick_lit_users_nonUS(index(user_id)) as (select * from (select temp1.user_id, temp1.cnt from (select user_id, count(*) as cnt from chick_lit group by user_id) as temp1 inner join (select * from user_location_USnonUS where USnonUS=1) as temp2 where 
temp1.user_id=temp2.user_id) as temp where temp.cnt>6);
drop temporary table if exists chick_lit_users_US;
create temporary table if not exists chick_lit_users_US(index(user_id)) as (select * from (select temp1.user_id, temp1.cnt from (select user_id, count(*) as cnt from chick_lit group by user_id) as temp1 inner join (select * from user_location_USnonUS where USnonUS=2 order by rand(1) limit 18000) as temp2 where temp1.user_id=temp2.user_id) as temp where temp.cnt>6);
# most frequently read sci_fi books by chick_lit readers	
select book_id, count(*) as book_cnt from (select * from sci_fi where user_id in (select user_id from chick_lit_users_US)) as temp group by temp.book_id order by book_cnt desc;
select book_id, count(*) as book_cnt from (select * from sci_fi where user_id in (select user_id from chick_lit_users_nonUS)) as temp group by temp.book_id order by book_cnt desc;
# most frequently read det_crime books by chick_lit readers	
select book_id, count(*) as book_cnt from (select * from det_crime where user_id in (select user_id from chick_lit_users_US)) as temp group by temp.book_id order by book_cnt desc;
select book_id, count(*) as book_cnt from (select * from det_crime where user_id in (select user_id from chick_lit_users_nonUS)) as temp group by temp.book_id order by book_cnt desc;
## most frequently read best seller books by chick_lit readers_US
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select user_id from chick_lit_users_US)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read best seller books by chick_lit readers_nonUS
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select user_id from chick_lit_users_nonUS)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read prize listed books by chick_lit readers_US
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select user_id from chick_lit_users_US)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read prize listed books by chick_lit readers_nonUS
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select user_id from chick_lit_users_nonUS)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;



## SCI-FI WITH OTHERS
drop temporary table if exists sci_fi_users_nonUS;
create temporary table if not exists sci_fi_users_nonUS(index(user_id)) as (select * from (select temp1.user_id, temp1.cnt from (select user_id, count(*) as cnt from sci_fi group by user_id) as temp1 inner join (select * from user_location_USnonUS where USnonUS=1) as temp2 where 
temp1.user_id=temp2.user_id) as temp where temp.cnt>6);
drop temporary table if exists sci_fi_users_US;
create temporary table if not exists sci_fi_users_US(index(user_id)) as (select * from (select temp1.user_id, temp1.cnt from (select user_id, count(*) as cnt from sci_fi group by user_id) as temp1 inner join (select * from user_location_USnonUS where USnonUS=2 order by rand(1) limit 18000) as temp2 where temp1.user_id=temp2.user_id) as temp where temp.cnt>6);
# most frequently read sci_fi books by chick_lit readers	
select book_id, count(*) as book_cnt from (select * from chick_lit where user_id in (select user_id from sci_fi_users_US)) as temp group by temp.book_id order by book_cnt desc;
select book_id, count(*) as book_cnt from (select * from chick_lit where user_id in (select user_id from sci_fi_users_nonUS)) as temp group by temp.book_id order by book_cnt desc;
# most frequently read det_crime books by chick_lit readers	
select book_id, count(*) as book_cnt from (select * from det_crime where user_id in (select user_id from sci_fi_users_US)) as temp group by temp.book_id order by book_cnt desc;
select book_id, count(*) as book_cnt from (select * from det_crime where user_id in (select user_id from sci_fi_users_nonUS)) as temp group by temp.book_id order by book_cnt desc;
## most frequently read best seller books by chick_lit readers_US
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select user_id from sci_fi_users_US)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read best seller books by chick_lit readers_nonUS
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select user_id from sci_fi_users_nonUS)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read prize listed books by chick_lit readers_US
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select user_id from sci_fi_users_US)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read prize listed books by chick_lit readers_nonUS
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select user_id from sci_fi_users_nonUS)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;



## DET_CRIME WITH OTHERS
drop temporary table if exists det_crime_users_nonUS;
create temporary table if not exists det_crime_users_nonUS(index(user_id)) as (select * from (select temp1.user_id, temp1.cnt from (select user_id, count(*) as cnt from det_crime group by user_id) as temp1 inner join (select * from user_location_USnonUS where USnonUS=1) as temp2 where 
temp1.user_id=temp2.user_id) as temp where temp.cnt>6);
drop temporary table if exists det_crime_users_US;
create temporary table if not exists det_crime_users_US(index(user_id)) as (select * from (select temp1.user_id, temp1.cnt from (select user_id, count(*) as cnt from det_crime group by user_id) as temp1 inner join (select * from user_location_USnonUS where USnonUS=2 order by rand(1) limit 18000) as temp2 where temp1.user_id=temp2.user_id) as temp where temp.cnt>6);
# most frequently read sci_fi books by chick_lit readers	
select book_id, count(*) as book_cnt from (select * from chick_lit where user_id in (select user_id from det_crime_users_US)) as temp group by temp.book_id order by book_cnt desc;
select book_id, count(*) as book_cnt from (select * from chick_lit where user_id in (select user_id from det_crime_users_nonUS)) as temp group by temp.book_id order by book_cnt desc;
# most frequently read det_crime books by chick_lit readers	
select book_id, count(*) as book_cnt from (select * from sci_fi where user_id in (select user_id from det_crime_users_US)) as temp group by temp.book_id order by book_cnt desc;
select book_id, count(*) as book_cnt from (select * from sci_fi where user_id in (select user_id from det_crime_users_nonUS)) as temp group by temp.book_id order by book_cnt desc;
## most frequently read best seller books by chick_lit readers_US
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select user_id from det_crime_users_US)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read best seller books by chick_lit readers_nonUS
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_best_seller where uid in (select user_id from det_crime_users_nonUS)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read prize listed books by chick_lit readers_US
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select user_id from det_crime_users_US)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;
## most frequently read prize listed books by chick_lit readers_nonUS
select temp2.bname, book_cnt from 
(select bid, count(*) as book_cnt from (select * from review_prize_novel where uid in (select user_id from det_crime_users_nonUS)) as temp group by temp.bid order by book_cnt desc) as temp1
inner join 
(select bname, bid from best_seller_books_recent_200) as temp2 on temp1.bid=temp2.bid order by temp1.book_cnt desc limit 50;






select tmp1.*, tmp2.USnonUS from 
(select user_id, count(*) as cnt from sci_fi where user_id is not NULL group by user_id) as tmp1
inner join
(select * from user_location_USnonUS) as tmp2
on tmp1.user_id=tmp2.user_id where USnonUS=2 order by cnt desc limit 50;


## For each user(from 3 popular genres), we find total number of books he read in 3 different genres, best seller books, prize listed novels and location info
drop temporary table if exists sci_fi_users_count;
create temporary table if not exists sci_fi_users_count(index(user_id)) as (select user_id,count(*) as sci_fi_cnt from sci_fi where user_id is not NULL and user_id!=0 group by user_id);
drop temporary table if exists chick_lit_users_count;
create temporary table if not exists chick_lit_users_count(index(user_id)) as (select user_id,count(*) as chick_lit_cnt from chick_lit where user_id is not NULL and user_id!=0 group by user_id);
drop temporary table if exists det_crime_users_count;
create temporary table if not exists det_crime_users_count(index(user_id)) as (select user_id,count(*) as det_crime_cnt from det_crime where user_id is not NULL and user_id!=0 group by user_id);
drop temporary table if exists prize_novel_users_count;
create temporary table if not exists prize_novel_users_count(index(user_id)) as (select uid as user_id,count(*) as prize_novel_cnt from review_prize_novel where uid is not NULL and uid!=0 group by uid);
drop temporary table if exists best_seller_users_count;
create temporary table if not exists best_seller_users_count(index(user_id)) as (select uid as user_id,count(*) as best_seller_cnt from review_best_seller where uid is not NULL and uid!=0 group by uid);

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
create temporary table if not exists temp1(index(user_id)) as (select sci_fi_chick_lit_det_crime.user_id, sci_fi_chick_lit_det_crime.sci_fi_cnt, sci_fi_chick_lit_det_crime.chick_lit_cnt, sci_fi_chick_lit_det_crime.det_crime_cnt, prize_novel_users_count.prize_novel_cnt from sci_fi_chick_lit_det_crime
left join
prize_novel_users_count on sci_fi_chick_lit_det_crime.user_id=prize_novel_users_count.user_id);
drop temporary table if exists temp2;
create temporary table if not exists temp2(index(user_id)) as (select prize_novel_users_count.user_id, sci_fi_chick_lit_det_crime.sci_fi_cnt, sci_fi_chick_lit_det_crime.chick_lit_cnt, sci_fi_chick_lit_det_crime.det_crime_cnt, prize_novel_users_count.prize_novel_cnt from sci_fi_chick_lit_det_crime
right join
prize_novel_users_count on sci_fi_chick_lit_det_crime.user_id=prize_novel_users_count.user_id where sci_fi_chick_lit_det_crime.user_id is NULL);
drop temporary table if exists sci_fi_chick_lit_det_crime_prize;
create temporary table if not exists sci_fi_chick_lit_det_crime_prize(index(user_id)) as (select * from (select * from temp1 union select * from temp2) as temp);

drop temporary table if exists temp1;
create temporary table if not exists temp1(index(user_id)) as (select sci_fi_chick_lit_det_crime_prize.user_id, sci_fi_chick_lit_det_crime_prize.sci_fi_cnt, sci_fi_chick_lit_det_crime_prize.chick_lit_cnt, sci_fi_chick_lit_det_crime_prize.det_crime_cnt, sci_fi_chick_lit_det_crime_prize.prize_novel_cnt, best_seller_users_count.best_seller_cnt from sci_fi_chick_lit_det_crime_prize
left join
best_seller_users_count on sci_fi_chick_lit_det_crime_prize.user_id=best_seller_users_count.user_id);
drop temporary table if exists temp2;
create temporary table if not exists temp2(index(user_id)) as (select best_seller_users_count.user_id, sci_fi_chick_lit_det_crime_prize.sci_fi_cnt, sci_fi_chick_lit_det_crime_prize.chick_lit_cnt, sci_fi_chick_lit_det_crime_prize.det_crime_cnt, sci_fi_chick_lit_det_crime_prize.prize_novel_cnt, best_seller_users_count.best_seller_cnt from sci_fi_chick_lit_det_crime_prize
right join
best_seller_users_count on sci_fi_chick_lit_det_crime_prize.user_id=best_seller_users_count.user_id where sci_fi_chick_lit_det_crime_prize.user_id is NULL);
drop temporary table if exists sci_fi_chick_lit_det_crime_prize_best;
create temporary table if not exists sci_fi_chick_lit_det_crime_prize_best(index(user_id)) as (select * from (select * from temp1 union select * from temp2) as temp);

###################################################################################################################################

## combining sci_fi_chick_lit_det_crime_prize_best with location info
select sci_fi_chick_lit_det_crime_prize_best.*,user_location_USnonUS.USnonUS  from sci_fi_chick_lit_det_crime_prize_best
inner join user_location_USnonUS on sci_fi_chick_lit_det_crime_prize_best.user_id=user_location_USnonUS.user_id where user_location_USnonUS.USnonUS!=3;

drop table if exists all_users_count_location_info;
create table if not exists all_users_count_location_info as (select sci_fi_chick_lit_det_crime_prize_best.*,user_location_USnonUS.USnonUS  from sci_fi_chick_lit_det_crime_prize_best
inner join user_location_USnonUS on sci_fi_chick_lit_det_crime_prize_best.user_id=user_location_USnonUS.user_id where user_location_USnonUS.USnonUS!=3);

mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from all_users_count_location_info" > all_users_count_location_info.csv
scp -r rahuldhakecha@ssh.wwbp.org:all_users_count_location_info.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/





## query to select all users of prize_novels and best_seller
create table if not exists users_prize_best as (select * from (select distinct(uid) from review_best_seller union select distinct(uid) from review_prize_novel) as temp);
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from users_prize_best" > users_prize_best.csv
scp -r rahuldhakecha@ssh.wwbp.org:users_prize_best.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/




## create table for recent 200 prize and best selling novels
scp '/Users/rahuldhakecha/coursesfall2017/goodreads/files/books_pub_date_best_seller.csv' rahuldhakecha@ssh.wwbp.org:
ssh -L 10001:localhost:22 rahuldhakecha@ssh.wwbp.org
mv books_pub_date_best_seller.csv /tmp/
mysql -u rahuldhakecha -p --local-infile

## create user info table
CREATE TABLE `books_pub_date_best_seller` (
  `title` varchar(100),
  `orig_publ_date` int(10),
  PRIMARY KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

load data local infile '/tmp/books_pub_date_best_seller.csv' into table books_pub_date_best_seller fields terminated by ',' lines terminated by '\n';

scp '/Users/rahuldhakecha/coursesfall2017/goodreads/files/books_pub_date_prize_novels.csv' rahuldhakecha@ssh.wwbp.org:
ssh -L 10001:localhost:22 rahuldhakecha@ssh.wwbp.org
mv books_pub_date_prize_novels.csv /tmp/
mysql -u rahuldhakecha -p --local-infile
## create user info table
CREATE TABLE `books_pub_date_prize_novels` (
  `title` varchar(100),
  `orig_publ_date` int(10),
  PRIMARY KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

load data local infile '/tmp/books_pub_date_prize_novels.csv' into table books_pub_date_prize_novels fields terminated by ',' lines terminated by '\n';



## recent 200 best seller books
drop temporary table if exists best_seller_books_recent_200;
create temporary table if not exists best_seller_books_recent_200(index(bid)) as
(select temp2.*, temp1.orig_publ_date from 
(select * from books_pub_date_best_seller) as temp1
inner join 
(select bname, bid from book) as temp2 on temp1.title=temp2.bname order by temp1.orig_publ_date desc limit 200);

## recent 200 prize novel books
drop temporary table if exists prize_novel_books_recent_200;
create temporary table if not exists prize_novel_books_recent_200(index(bid)) as
(select temp2.*, temp1.orig_publ_date from 
(select * from books_pub_date_prize_novels) as temp1
inner join 
(select bname, bid from book) as temp2 on temp1.title=temp2.bname order by temp1.orig_publ_date desc limit 200);


## recent 200 best seller books with users who have reviewed more than 4 books
create table if not exists users_best_seller_recent_200_threshold_4(index(user_id)) as (select * from users_best_seller_recent_200 where best_seller_cnt>=4);
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from users_best_seller_recent_200_threshold_4" > users_best_seller_recent_200_threshold_4.csv
scp -r rahuldhakecha@ssh.wwbp.org:users_best_seller_recent_200_threshold_4.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/
## recent 200 prize novels with users who have reviewed more than 4 books
create table if not exists users_prize_novel_recent_200_threshold_2(index(user_id)) as (select * from users_prize_novel_recent_200 where prize_novel_cnt>=2);
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from users_prize_novel_recent_200_threshold_2" > users_prize_novel_recent_200_threshold_2.csv
scp -r rahuldhakecha@ssh.wwbp.org:users_prize_novel_recent_200_threshold_2.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/


## query to access users and their respective counts who have reviewed recent 200 best seller in each category
select uid as user_id,count(*) as best_seller_cnt from review_best_seller where bid in (select bid from best_seller_books_recent_200) and uid is not NULL and uid!=0 group by uid;
drop table if exists users_best_seller_recent_200 ;
create table if not exists users_best_seller_recent_200(index(user_id)) as (select uid as user_id,count(*) as best_seller_cnt from review_best_seller where bid in (select bid from best_seller_books_recent_200) and uid is not NULL and uid!=0 group by uid);

## query to access users who have reviewed recent 200 prize novels in each category
select uid as user_id,count(*) as prize_novel_cnt from review_prize_novel where bid in (select bid from prize_novel_books_recent_200) and uid is not NULL and uid!=0 group by uid;
drop table if exists users_prize_novel_recent_200 ;
create table if not exists users_prize_novel_recent_200(index(user_id)) as (select uid as user_id,count(*) as prize_novel_cnt from review_prize_novel where bid in (select bid from prize_novel_books_recent_200) and uid is not NULL and uid!=0 group by uid);

## query to select all users of prize_novels and best_seller
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from users_prize_novel_recent_200" > users_prize_novel_recent_200.csv
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from users_best_seller_recent_200" > users_best_seller_recent_200.csv
scp -r rahuldhakecha@ssh.wwbp.org:users_prize_novel_recent_200.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/
scp -r rahuldhakecha@ssh.wwbp.org:users_best_seller_recent_200.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/



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
create table if not exists user_3genre_prize_best_recent_200(index(user_id)) as (select * from sci_fi_chick_lit_det_crime_prize_best);
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from user_3genre_prize_best_recent_200" > user_3genre_prize_best_recent_200.csv
scp -r rahuldhakecha@ssh.wwbp.org:user_3genre_prize_best_recent_200.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/





