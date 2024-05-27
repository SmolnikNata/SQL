Создать таблицу друзей с использованием механизма валидации данных в SQL

create table friends(
friendship_id int primary key auto_increment,
created_at timestamp not null default current_timestamp,
user_id int not null,
friend_id int not null,
foreign key(user_id)references users(id), 
foreign key(friend_id)references users(id) 
)

Добавить в таблицу друзей несколько записей

INSERT INTO friends(user_id, friend_id)
values
(1, 2),
(2, 3),
(1, 3);



Вывести сумму всех транзакций отдельно по каждой валюте (в упорядоченном виде)

select currency, SUM(amount) AS total_amount
from accounts
join txs on accounts.id=txs.sender_account_id
group by currency
order by currency
