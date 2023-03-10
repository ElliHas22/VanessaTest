#language: ru



Функционал: расчет итоговой суммы документа Заказ

Как Менеджер по продажам я хочу
расчет итоговой суммы документа Заказ 
чтобы произвести перерасчет суммы документа

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: расчет итоговой суммы документа Заказ
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Пантера АО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Закупочная'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000027' | 'Ряженка'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку "Записать"
* Номер документа
	И я запоминаю значение поля "Номер" как "$Номер$"	
* Проверка итоговой суммы документа при изменении количества
	И элемент формы с именем "ВидЦен" стал равен 'Закупочная'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '450'		
* Изменение вида цены товара
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Оптовая'
* Проверка итоговой суммы документа при изменении цены
	И элемент формы с именем "ВидЦен" стал равен 'Оптовая'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '550'
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
* Проверка создания документа
	Тогда таблица "Список" содержит строки:
		| 'Номер'   |
		| '$Номер$' |
