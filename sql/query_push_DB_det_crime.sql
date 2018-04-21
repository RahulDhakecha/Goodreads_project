DROP TABLE IF EXISTS `detective_crime`;

CREATE TABLE `det_crime` (
  `book_id` int(20),
  `review_id` int(20),
  `review_text` varchar(2000),
  `user_id` int(20),
  `user_rating` float(20),
  PRIMARY KEY (`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

load data local infile '/tmp/Detective-Crime-Novels-Review-Data_mod.csv' into table det_crime fields terminated by ',' lines terminated by '\n';

LOCK TABLES `detective_crime` WRITE;

INSERT INTO `detective_crime` VALUES ;

UNLOCK TABLES;