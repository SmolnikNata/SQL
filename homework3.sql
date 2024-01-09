(1) Вывести данные о товарах (проекция: названиетовара, цена,
 названиекатегории, названиекомпаниипоставщика)
SELECT 
ProductName,
Price,
Categories.CategoryName,
Suppliers.SupplierName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN     Suppliers ON Products.SupplierID = Suppliers.SupplierID

2) Вывести список стран, которые поставляют морепродукты
SELECT Country
FROM Suppliers
JOIN Products ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON  Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = "Seafood"

(3) Вывести два самых дорогих товара из категории Beverages из USA
SELECT Products.ProductName, Products.Price
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Beverages' AND Suppliers.Country = 'USA'
ORDER BY Products.Price DESC
LIMIT 2


(4)Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT Products.ProductName,Price*1.08 AS Price_usd
FROM OrderDetails
JOIN Products ON Products.ProductID=OrderDetails.ProductID
ORDER BY Price_usd DESC 
LIMIT 1


(5) Дайте короткий ответ на вопрос: в чем отличие БД от СУБД
 
 БД представляет собой сами данные, а СУБД - инструмент для работы с этими данными.