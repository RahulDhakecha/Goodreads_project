scp '/Users/rahuldhakecha/coursesfall2017/goodreads/files/top_2000_user_perspective/unscrape_books/scrape_unscrape_books_details_cleaned.csv' rahuldhakecha@grande.wwbp.org:
ssh -L 10001:localhost:22 rahuldhakecha@ssh.wwbp.org
ssh grande
mv top_2000_users_books_reviewed.csv /tmp/
mysql -u rahuldhakecha -p --local-infile

CREATE TABLE `top_2000_users_books_reviewed` (
  `user_id` int(20),
  `book_id` int(20),
  `user_rating` int(20),
  `avg_rating` float(10),
  PRIMARY KEY (`user_id`,`book_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE TABLE_NAME ADD Id INT IDENTITY(1,1) PRIMARY KEY;

load data local infile '/tmp/top_2000_users_books_reviewed.csv' into table top_2000_users_books_reviewed fields terminated by ',' lines terminated by '\n';

create table if not exists users_2000_book_cnt(index(book_id)) as (select book_id,count(*) as cnt from top_2000_users_books_reviewed group by book_id);
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from users_2000_book_cnt" > users_2000_book_cnt.csv
scp -r rahuldhakecha@grande.wwbp.org:users_2000_book_cnt.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/


scp '/Users/rahuldhakecha/coursesfall2017/goodreads/files/top_2000_user_perspective/unscrape_books/scrape_unscrape_books_details_cleaned.csv' rahuldhakecha@grande.wwbp.org:
ssh -L 10001:localhost:22 rahuldhakecha@ssh.wwbp.org
ssh grande
mv scrape_unscrape_books_details_cleaned.csv /tmp/
mysql -u rahuldhakecha -p --local-infile

CREATE TABLE `books_details` (
  `book_id` int(20),
  `book_title` varchar(100),
  `author` varchar(100),
  `rating` int(20),
  `review` int(20),
  `genre` varchar(150),
  PRIMARY KEY (`book_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

 
load data local infile '/tmp/scrape_unscrape_books_details_cleaned.csv' into table books_details fields terminated by ',' lines terminated by '\n';

select tmp1.user_id,tmp1.book_id,tmp1.user_rating,tmp1.avg_rating,tmp2.book_title, tmp2.author, tmp2.rating, tmp2.review, tmp2.genre from top_2000_users_books_reviewed as tmp1
inner join books_details as tmp2
on tmp1.book_id=tmp2.book_id;

drop table if exists users_2000_book_details;
create table if not exists users_2000_book_details(index(user_id, book_id)) as (select tmp1.user_id,tmp1.book_id,tmp1.user_rating,tmp1.avg_rating,tmp2.book_title, tmp2.author, tmp2.rating, tmp2.review, tmp2.genre from top_2000_users_books_reviewed as tmp1
inner join books_details as tmp2
on tmp1.book_id=tmp2.book_id);

/usr/local/mysql/bin/mysql -u rahuldhakecha -p -h remote.example.com -e
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from users_2000_book_details" > users_2000_book_details.csv
scp -r rahuldhakecha@grande.wwbp.org:users_2000_book_details.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/top_2000_user_perspective/unscrape_books/

##############################----------------------------- Select only those books which has at least 5 readers ------------------------------#############################
select tmp1.* from users_2000_book_limit5_details as tmp1
inner join users_2000_book_cnt as tmp2
on tmp1.book_id=tmp2.book_id
where tmp2.cnt>=5;

drop table if exists users_2000_book_limit5_details;
create table if not exists users_2000_book_limit5_details(index(user_id, book_id)) as (select tmp1.* from users_2000_book_details as tmp1
inner join users_2000_book_cnt as tmp2
on tmp1.book_id=tmp2.book_id
where tmp2.cnt>=5);

mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from users_2000_book_limit5_details" > users_2000_book_limit5_details.csv
scp -r rahuldhakecha@grande.wwbp.org:users_2000_book_limit5_details.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/top_2000_user_perspective/unscrape_books/

#############################------------------------------------------------------------------------------------------------------------------############################



## table for 2000 random user reviews
CREATE TABLE `users_2000_review_details` (
  `user_id` varchar(20),
  `book_id` varchar(20),
  `review_id` varchar(20),
  `review` varchar(10000),
  PRIMARY KEY (`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table if not exists users_2000_book_review_details(index(user_id, book_id)) as (select t1.*,t2.review_id,t2.review as review_text from users_2000_book_details t1 inner join users_2000_review_details t2 on
t1.user_id=t2.user_id and t1.book_id=t2.book_id);
mysql -u rahuldhakecha -p -h localhost goodreads -e "select * from users_2000_book_review_details" > users_2000_book_review_details.csv
scp -r rahuldhakecha@grande.wwbp.org:users_2000_book_review_details.csv /Users/rahuldhakecha/coursesfall2017/goodreads/files/top_2000_user_perspective/reviews/






