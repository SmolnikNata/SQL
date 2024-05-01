create table video_commets(
id int primary key auto_increment,
created_at timestamp,
video_id int,
user_id int,
comment text
);

insert into video_commets(
created_at, video_id, author_id, comment)
values
(current_timestamp(), 5, 2, "Super"),
(current_timestamp(), 2, 3, "Perfekt"),
(current_timestamp(), 3, 4, "Good"),
(current_timestamp(), 2, 1, "Super video"),
(current_timestamp(), 1, 5, "Very nice"),
(current_timestamp(), 4, 4, "WOW")

create table video_reactions(
id int primary key auto_increment,
created_at timestamp,
video_id int,
user_id int,
value int
);

insert into video_reactions(
created_at, video_id, user_id, value)
values
(current_timestamp(), 5, 2, 4),
(current_timestamp(), 2, 3, 5),
(current_timestamp(), 3, 4, 3),
(current_timestamp(), 2, 1, 5),
(current_timestamp(), 1, 5, 1),
(current_timestamp(), 4, 4, 4)

