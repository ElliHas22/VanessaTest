#language: ru

@tree

Функционал: Расчет поля Количество (итог) документа Заказ

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий 

Сценарий: расчет поля Количество (итог) документа Заказ
	// Экспортные сценарии
	И открываю форму создания документа Заказ
	И заполняю шапку документа Заказ
		
	// Заполнение табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'КомандаПодбор'
	Тогда открылось окно 'Подбор товара'
	И в таблице "ДеревоТоваров" я разворачиваю текущую строку
	И в таблице "ДеревоТоваров" я перехожу к строке:
		| 'Наименование' |
		| 'Обувь'        |
	И в таблице "СписокТоваров" я выбираю текущую строку
	И в таблице "ДеревоТоваров" я перехожу к строке:
		| 'Наименование' |
		| 'Продукты'     |
	И в таблице "СписокТоваров" я перехожу к строке:
		| 'Код'       | 'Количество' | 'Наименование' | 'Цена'   |
		| '000000030' | '150,00'     | 'Колбаса'      | '400,00' |
	И в таблице "СписокТоваров" я выбираю текущую строку
	И в таблице "ДеревоТоваров" я разворачиваю текущую строку
	И в таблице "ДеревоТоваров" я перехожу к строке:
		| 'Наименование' |
		| 'Молочные'     |
	И в таблице "СписокТоваров" я выбираю текущую строку
	И в таблице "СписокТоваров" я перехожу к строке:
		| 'Код'       | 'Количество' | 'Наименование' | 'Цена'  |
		| '000000021' | '150,00'     | 'Масло'        | '55,00' |
	И в таблице "СписокТоваров" я выбираю текущую строку
	И в таблице "ДеревоТоваров" я перехожу к строке:
		| 'Наименование' |
		| 'Услуги'       |
	И в таблице "СписокТоваров" я выбираю текущую строку
	И в таблице "ДеревоТоваров" я перехожу к строке:
		| 'Наименование'  |
		| 'Электротовары' |
	И в таблице "ДеревоТоваров" я разворачиваю текущую строку
	И в таблице "ДеревоТоваров" я перехожу к строке:
		| 'Наименование' |
		| 'Пылесосы'     |
	И в таблице "СписокТоваров" я выбираю текущую строку
	И в таблице "ДеревоТоваров" я перехожу к строке:
		| 'Наименование' |
		| 'Телевизоры'   |
	И в таблице "ДеревоТоваров" я разворачиваю текущую строку
	И в таблице "СписокТоваров" я выбираю текущую строку
	И в таблице "ДеревоТоваров" я перехожу к строке:
		| 'Наименование' |
		| 'Чайники'      |
	И в таблице "СписокТоваров" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ОК'
	
	И я запоминаю количество строк таблицы "Товары" как "КоличествоИтог"
			
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '$КоличествоИтог$'		

	И Проверка создания документа		