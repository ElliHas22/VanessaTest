#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Тестирование документа Заказ

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

@ТипШага: Документ Заказ
@Описание: Экспортный сценарий который открывает форму создания документа Заказ
@ПримерИспользования: И открываю форму создания документа Заказ
Сценарий: Открываю форму создания документа Заказ
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'

@ТипШага: Документ Заказ
@Описание: Экспортный сценарий который заполняет шапку документа Заказ
@ПримерИспользования: И заполняю шапку документа Заказ
Сценарий: Заполняю шапку документа Заказ
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'       |
		| '000000013' | 'Магазин "Продукты"' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Розничная'
				
Сценарий: Проверка создания документа
	И я нажимаю на кнопку "Записать"
	И я запоминаю значение поля "Номер" как "$Номер$"
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
	Тогда таблица "Список" содержит строки:
		| 'Номер'   |
		| '$Номер$' |		