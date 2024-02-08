-- Сщздать таблицу комментариев с использованием механизма 
--валидации данных в SQL
create table comments(
id int primary key auto_increment,
created_at timestamp default current_timestamp,
user_id int not null,
foreign key(user_id)references users(id),
track_id int not null,
foreign key(track_id) references tracks(id),
comment_text text not null
);
--Добавить в таблицу комментариев несколько записей
insert into comments(user_id, track_id, comment_text)
values
(4, 4, 'Super'),
(3, 2, 'Very nice'),
(1, 3,'super track')
--Вывести ко-во комментариев на каждый трек (в упорядоченном виде).
--Выводим все комментарии на треки,группируя треки, по убыванию
SELECT  COUNT(*) AS comment_count,track_id
FROM comments
GROUP BY track_id
ORDER BY comment_count DESC