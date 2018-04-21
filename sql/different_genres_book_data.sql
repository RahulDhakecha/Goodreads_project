# from the folder where file is stored
scp '/Users/rahuldhakecha/Box Sync/Goodreads Project/Goodreads_Summer2017_SharvinShah/Popular_Genres_Basic_Stats_Scrape/Chick_Lit_List_output.csv' rahuldhakecha@ssh.wwbp.org:
#login to wwbp
# if not using port forwarding
ssh rahuldhakecha@ssh.wwbp.org -p 22
# if using port forwarding
ssh -L 10001:localhost:22 rahuldhakecha@ssh.wwbp.org
mv Chick_Lit_List_output.csv /tmp/
#login to database
mysql -u rahuldhakecha -p --local-infile
DROP TABLE IF EXISTS `chick_lit_books_data`;
CREATE TABLE `chick_lit_books_data` (
  `TITLE` varchar(50),
  `AUTHOR` varchar(50),
  `GOODREADS_URL` varchar(200),
  `LIST_WHERE_FOUND` float(20),
  `POPULARITY_LOW_MED_HIGH` float(20),
  `NUMBER_REVIEWS` float(20),
  `ORIG_PUBL_DATE` float(20),
  `GOODREADS_ID` float(20),
  `PRIZE_Y/N` varchar(20),
  `total_reviews` float(20),
  `total_ratings` float(20),
  `average_rating` float(20),
  PRIMARY KEY (`GOODREADS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
load data local infile '/tmp/Chick_Lit_List_output.csv' into table chick_lit_books_data fields terminated by ',' lines terminated by '\n';

drop table if exists chick_lit_top_50_ratings;
create table if not exists chick_lit_top_50_ratings as (select * from chick_lit_books_data where total_ratings>=150 order by total_ratings desc limit 50);
drop table if exists chick_lit_bottom_50_ratings;
create table if not exists chick_lit_bottom_50_ratings as (select * from chick_lit_books_data where total_ratings>=150 order by total_ratings asc limit 50);
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from chick_lit_top_50_ratings" > chick_lit_top_50_ratings.csv
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from chick_lit_bottom_50_ratings" > chick_lit_bottom_50_ratings.csv
scp -r rahuldhakecha@ssh.wwbp.org:chick_lit_top_50_ratings.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/
scp -r rahuldhakecha@ssh.wwbp.org:chick_lit_bottom_50_ratings.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/

# from the folder where file is stored
scp '/Users/rahuldhakecha/Box Sync/Goodreads Project/Goodreads_Summer2017_SharvinShah/Popular_Genres_Basic_Stats_Scrape/Detective_Crime_Novels_List_out_1.csv' rahuldhakecha@ssh.wwbp.org:
#login to wwbp
# if not using port forwarding
ssh rahuldhakecha@ssh.wwbp.org -p 22
# if using port forwarding
ssh -L 10001:localhost:22 rahuldhakecha@ssh.wwbp.org
mv Detective_Crime_Novels_List_out_1.csv /tmp/
#login to database
mysql -u rahuldhakecha -p --local-infile
DROP TABLE IF EXISTS `det_crime_books_data`;
CREATE TABLE `det_crime_books_data` (
  `TITLE` varchar(50),
  `AUTH_LAST` varchar(50),
  `AUTH_FIRST` varchar(200),
  `ORIG_PUBL_DATE` float(20),
  `GOODREADS_ID` float(20),
  `PRIZE_Y_N` varchar(5),
  `NOTES` varchar(20),
  `PRIZE_DATE` float(20),
  `EDGAR_CATEGORY` varchar(200),
  `total_reviews` float(20),
  `total_ratings` float(20),
  `average_rating` float(20),
  PRIMARY KEY (`GOODREADS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
load data local infile '/tmp/Detective_Crime_Novels_List_out_1.csv' into table det_crime_books_data fields terminated by ',' lines terminated by '\n';

drop table if exists det_crime_top_50_ratings;
create table if not exists det_crime_top_50_ratings as (select * from det_crime_books_data where total_ratings>=150 order by total_ratings desc limit 50);
drop table if exists det_crime_bottom_50_ratings;
create table if not exists det_crime_bottom_50_ratings as (select * from det_crime_books_data where total_ratings>=150 order by total_ratings asc limit 50);
drop table if exists det_crime_top_50_price_winning;
create table if not exists det_crime_top_50_price_winning as (select * from det_crime_books_data where total_ratings>=150 and prize_y_n='Y' order by total_ratings desc limit 50);
drop table if exists det_crime_bottom_50_price_winning;
create table if not exists det_crime_bottom_50_price_winning as (select * from det_crime_books_data where total_ratings>=150 and prize_y_n='Y' order by total_ratings asc limit 50);
drop table if exists det_crime_top_50_best_seller;
create table if not exists det_crime_top_50_best_seller as (select * from det_crime_books_data where total_ratings>=150 and prize_y_n='N' order by total_ratings desc limit 50);
drop table if exists det_crime_bottom_50_best_seller;
create table if not exists det_crime_bottom_50_best_seller as (select * from det_crime_books_data where total_ratings>=150 and prize_y_n='N' order by total_ratings asc limit 50);
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from det_crime_top_50_ratings" > det_crime_top_50_ratings.csv
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from det_crime_bottom_50_ratings" > det_crime_bottom_50_ratings.csv
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from det_crime_top_50_price_winning" > det_crime_top_50_price_winning.csv
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from det_crime_bottom_50_price_winning" > det_crime_bottom_50_price_winning.csv
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from det_crime_top_50_best_seller" > det_crime_top_50_best_seller.csv
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from det_crime_bottom_50_best_seller" > det_crime_bottom_50_best_seller.csv
scp -r rahuldhakecha@ssh.wwbp.org:det_crime_top_50_ratings.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/
scp -r rahuldhakecha@ssh.wwbp.org:det_crime_bottom_50_ratings.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/
scp -r rahuldhakecha@ssh.wwbp.org:det_crime_top_50_price_winning.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/
scp -r rahuldhakecha@ssh.wwbp.org:det_crime_bottom_50_price_winning.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/
scp -r rahuldhakecha@ssh.wwbp.org:det_crime_top_50_best_seller.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/
scp -r rahuldhakecha@ssh.wwbp.org:det_crime_bottom_50_best_seller.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/

# from the folder where file is stored
scp '/Users/rahuldhakecha/Box Sync/Goodreads Project/Goodreads_Summer2017_SharvinShah/Popular_Genres_Basic_Stats_Scrape/Sci-Fi-Texts_output_1.csv' rahuldhakecha@ssh.wwbp.org:
#login to wwbp
# if not using port forwarding
ssh rahuldhakecha@ssh.wwbp.org -p 22
# if using port forwarding
ssh -L 10001:localhost:22 rahuldhakecha@ssh.wwbp.org
mv Sci-Fi-Texts_output_1.csv /tmp/
#login to database
mysql -u rahuldhakecha -p --local-infile
DROP TABLE IF EXISTS `sci_fi_books_data`;
CREATE TABLE `sci_fi_books_data` (
  `TITLE` varchar(50),
  `AUTH_LAST` varchar(50),
  `AUTH_FIRST` varchar(200),
  `ORIG_PUBL_DATE` float(20),
  `ISBN` float(20),
  `GOODREADS_ID` float(20),
  `STATUS` float(20),
  `total_reviews` float(20),
  `total_ratings` float(20),
  `average_rating` float(20),
  PRIMARY KEY (`GOODREADS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
load data local infile '/tmp/Sci-Fi-Texts_output_1.csv' into table sci_fi_books_data fields terminated by ',' lines terminated by '\n';

drop table if exists sci_fi_top_50_ratings;
create table if not exists sci_fi_top_50_ratings as (select * from sci_fi_books_data where total_ratings>=150 order by total_ratings desc limit 50);
drop table if exists sci_fi_bottom_50_ratings;
create table if not exists sci_fi_bottom_50_ratings as (select * from sci_fi_books_data where total_ratings>=150 order by total_ratings asc limit 50);
drop table if exists sci_fi_top_50_price_winning;
create table if not exists sci_fi_top_50_price_winning as (select * from sci_fi_books_data where total_ratings>=150 and status=1 order by total_ratings desc limit 50);
drop table if exists sci_fi_bottom_50_price_winning;
create table if not exists sci_fi_bottom_50_price_winning as (select * from sci_fi_books_data where total_ratings>=150 and status=1 order by total_ratings asc limit 50);
drop table if exists sci_fi_top_50_best_seller;
create table if not exists sci_fi_top_50_best_seller as (select * from sci_fi_books_data where total_ratings>=150 and status=2 or status=0 order by total_ratings desc limit 50);
drop table if exists sci_fi_bottom_50_best_seller;
create table if not exists sci_fi_bottom_50_best_seller as (select * from sci_fi_books_data where total_ratings>=150 and status=2 or status=0 order by total_ratings asc limit 50);
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from sci_fi_top_50_ratings" > sci_fi_top_50_ratings.csv
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from sci_fi_bottom_50_ratings" > sci_fi_bottom_50_ratings.csv
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from sci_fi_top_50_price_winning" > sci_fi_top_50_price_winning.csv
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from sci_fi_bottom_50_price_winning" > sci_fi_bottom_50_price_winning.csv
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from sci_fi_top_50_best_seller" > sci_fi_top_50_best_seller.csv
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from sci_fi_bottom_50_best_seller" > sci_fi_bottom_50_best_seller.csv
scp -r rahuldhakecha@ssh.wwbp.org:sci_fi_top_50_ratings.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/
scp -r rahuldhakecha@ssh.wwbp.org:sci_fi_bottom_50_ratings.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/
scp -r rahuldhakecha@ssh.wwbp.org:sci_fi_top_50_price_winning.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/
scp -r rahuldhakecha@ssh.wwbp.org:sci_fi_bottom_50_price_winning.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/
scp -r rahuldhakecha@ssh.wwbp.org:sci_fi_top_50_best_seller.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/
scp -r rahuldhakecha@ssh.wwbp.org:sci_fi_bottom_50_best_seller.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/books/



























