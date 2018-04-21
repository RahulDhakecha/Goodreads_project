DROP TABLE IF EXISTS `chick_lit`;


CREATE TABLE `chick_lit` (
  `book_id` int(20),
  `review_id` int(20),
  `review_text` varchar(2000),
  `user_id` int(20),
  `user_rating` float(20),
  PRIMARY KEY (`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

load data local infile '/tmp/chick-lit-review-data_mod.csv' into table chick_lit fields terminated by ',' lines terminated by '\n';

LOCK TABLES `chick_lit` WRITE;

