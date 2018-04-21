DROP TABLE IF EXISTS `sci_fi`;

CREATE TABLE `sci_fi` (
  `book_id` int(20),
  `review_id` int(20),
  `review_text` varchar(2000),
  `user_id` int(20),
  `user_rating` float(20),
  PRIMARY KEY (`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# from the folder where file is stored
scp '/Users/rahuldhakecha/Box Sync/Goodreads Project/Goodreads_Summer2017_SharvinShah/Review Data Files/edited/Sci-Fi-Novels-Review-Data_mod.csv' rahuldhakecha@ssh.wwbp.org:
#login to wwbp
# if not using port forwarding
ssh rahuldhakecha@ssh.wwbp.org -p 22
# if using port forwarding
ssh -L 10001:localhost:22 rahuldhakecha@ssh.wwbp.org
mv chick-lit-review-data.csv /tmp/
#login to database
mysql -u rahuldhakecha -p --local-infile
load data local infile '/tmp/Sci-Fi-Novels-Review-Data_mod.csv' into table sci_fi fields terminated by ',' lines terminated by '\n';

LOCK TABLES `sci_fi` WRITE;

INSERT INTO `sci_fi` VALUES ;

UNLOCK TABLES;


