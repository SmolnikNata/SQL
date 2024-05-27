/*1.Вывести видео с продолжительностью от 15 мин и более MDB*/
db.videos.find(
{},
{duration_secs: {$gte: 15*60}}       
)

/*2.Вывести данные юзеров не из Germany (в проекции - без страны)*/

db.users.find(
{country:{$ne:"Germany"}},
{country: 0}     
)

/*3.Вывести данные о всех видео (в проекции - без первичного ключа)*/  

db.videos.find(
{},
{_id:0}    
)


/*4.Вывести страны и имена всех юзеров*/
db.users.find(
{},
{fullname:1, country:1, _id:0}    
)
   
