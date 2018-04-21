# Full outer join based on left join and right join

# Table A, B, C

create temporary table if not exists temp_left_A_B(index(user_id)) as (select A.key from A left join B on A.key=B.key);
create temporary table if not exists temp_right_A_B(index(user_id)) as (select B.key from A right join B on A.key=B.key where A.key is NULL);
create temporary table if not exists temp_full_A_B(index(user_id)) as (select * from (select * from temp_left_A_B union select * from temp_right_A_B) as temp);

create temporary table if not exists temp_left_A_B_C(index(user_id)) as (select temp_full_A_B.key from temp_full_A_B left join C on temp_full_A_B.key=C.key);
create temporary table if not exists temp_right_A_B_C(index(user_id)) as (select C.key from temp_full_A_B right join C on temp_full_A_B.key=C.key where temp_full_A_B.key is NULL);
create temporary table if not exists temp_full_A_B_C(index(user_id)) as (select * from(select * from temp_left_A_B_C union all select * from temp_right_A_B_C) as temp);
