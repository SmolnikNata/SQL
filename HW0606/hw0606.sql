/*Добавить тег test для тех видео, у которых его нет*/

/*Вывести названия роликов с тегом test*/
db.videos.updateMany(
{tags: {$ne:'test'}},
{$addToSet: {tags:'test'}
}
    )


db.videos.find(
{tags : "test"},
{title:1, _id: 0}
)
