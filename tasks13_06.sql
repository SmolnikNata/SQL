/*Вывести названия двух произвольных треков с тегом mega*/

db.videos.aggregate([
    { $match: { tags: "mega" } },
    { $sample: { size: 2 } },
    { $project: { title: 1, _id: 0 } }
])
/*Вывести имя юзера с самым минимальным балансом*/
db.users.aggregate([
    { $sort: { balance:-1 } },
    { $limit: 1 },
    { $project: { fullname: 1, _id: 0 } }
])

/*Используя метод countDocuments(), вывести ко-во заблокированных юзеров с балансом 
от 10 до 1000 EUR (вкл.)*/
db.users.countDocuments({
    is_blocked: true,
    balance: { $gte: 10, $lte: 1000 }
}) 
/*Используя метод aggregate(), вывести ко-во незаблокированных юзеров не из Germany
 и не из France с балансом до 1000 EUR (не вкл.)*/

db.users.aggregate([
    { $match: { 
        is_blocked: { $ne: true }, /*не заблокированные */
        country: { $nin: ["Germany", "France"] },/* не из Франции и Германии*/
        balance: { $lt: 1000 } /*бфланс до 1000 не вкл*/
    }},
    { $count: 'total_user' }/* число клиентов*/
])
