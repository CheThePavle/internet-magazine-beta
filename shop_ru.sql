-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 15 2021 г., 13:37
-- Версия сервера: 8.0.15
-- Версия PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop_ru`
--

-- --------------------------------------------------------

--
-- Структура таблицы `картинки`
--

CREATE TABLE `картинки` (
  `id_картинки` int(11) NOT NULL,
  `id_товара` int(11) NOT NULL,
  `название_карт` varchar(50) NOT NULL,
  `путь_карт` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `картинки`
--

INSERT INTO `картинки` (`id_картинки`, `id_товара`, `название_карт`, `путь_карт`) VALUES
(1, 1, 'название1', 'путь1'),
(2, 1, 'название2', 'путь2'),
(3, 2, 'название3', 'путь3');

-- --------------------------------------------------------

--
-- Структура таблицы `категории`
--

CREATE TABLE `категории` (
  `id_категории` int(11) NOT NULL,
  `название_кат` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `категории`
--

INSERT INTO `категории` (`id_категории`, `название_кат`) VALUES
(1, 'для Нее'),
(2, 'для Него'),
(3, 'для Двоих'),
(4, 'для Компании'),
(5, 'Детский');

-- --------------------------------------------------------

--
-- Структура таблицы `корзина`
--

CREATE TABLE `корзина` (
  `id_пользователя` int(11) NOT NULL,
  `id_товара` int(11) NOT NULL,
  `кол_в_корзине` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `корзина`
--

INSERT INTO `корзина` (`id_пользователя`, `id_товара`, `кол_в_корзине`) VALUES
(1, 1, 2),
(1, 2, 3),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `пользователи`
--

CREATE TABLE `пользователи` (
  `id_пользователя` int(11) NOT NULL,
  `фио` varchar(100) NOT NULL,
  `дата_рождения` date NOT NULL,
  `телефон_при_рег` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `согласие` bit(1) NOT NULL,
  `логин` varchar(50) NOT NULL,
  `пароль` varchar(100) NOT NULL,
  `статус` varchar(20) NOT NULL,
  `дата_рег` date NOT NULL,
  `скидка` int(3) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `пользователи`
--

INSERT INTO `пользователи` (`id_пользователя`, `фио`, `дата_рождения`, `телефон_при_рег`, `email`, `согласие`, `логин`, `пароль`, `статус`, `дата_рег`, `скидка`, `token`) VALUES
(1, 'Чикуров Павел Алексеевич', '2020-12-20', '+7(999)999-99-99', 'pashatchikurov2@yandex.ru', b'0', 'chethepavle', '2517', 'Админ', '2021-05-15', 0, ''),
(2, 'Медведев Даниил Наумович', '2013-04-20', '+7(951)342-23-76', 'medvedev@mail.ru', b'1', 'medvedev', '228', 'Менеджер', '2021-05-15', 0, '609f97c998597'),
(3, 'Шашков Корней Геннадиевич', '1996-11-09', '+7(911)282-28-51', 'shashkov2292@mail.ru', b'1', 'shashkov2292', '1234', 'Пользователь', '2021-05-15', 0, ''),
(4, 'Баранов Герасим Мэлорович', '1998-10-10', '+7(921)761-76-15', 'baranchik1234@mail.ru', b'1', 'baranchik1234', '4321', 'Пользователь', '2021-05-15', 0, ''),
(5, 'Маликов Владимир Маратович', '1988-05-11', '+7(902)333-22-11', '', b'0', '', '', 'Курьер', '2021-05-15', 0, ''),
(6, 'Тестовый Курьер Курьерович', '2021-05-01', '8(800)-555-35-35', 'teshitn@mail.ru', b'1', 'kyrier', 'da', 'Курьер', '2021-05-15', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `виды_отдыха`
--

CREATE TABLE `виды_отдыха` (
  `id_вида` int(11) NOT NULL,
  `название_вида` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `виды_отдыха`
--

INSERT INTO `виды_отдыха` (`id_вида`, `название_вида`) VALUES
(1, 'Экстрим'),
(2, 'SPA и красота'),
(3, 'Полеты'),
(4, 'Развлечения и отдых'),
(5, 'Мастер классы и обучение'),
(6, 'Загородный отдых'),
(7, 'Вождение'),
(8, 'Водные развлечения'),
(9, 'Романтика'),
(10, 'Фтосессии'),
(11, 'Спорт'),
(12, 'Эксклюзив');

-- --------------------------------------------------------

--
-- Структура таблицы `заказы`
--

CREATE TABLE `заказы` (
  `id_заказа` int(11) NOT NULL,
  `телефон_при_зак` varchar(30) NOT NULL,
  `адрес_доставки` varchar(150) NOT NULL,
  `способ_оплаты` varchar(50) NOT NULL,
  `дата_нов_прин` date DEFAULT NULL,
  `id_менеджера` int(11) DEFAULT NULL,
  `дата_прин_вып` date DEFAULT NULL,
  `id_курьера` int(11) DEFAULT NULL,
  `общая_стоимость` int(11) NOT NULL,
  `id_пользователя` int(11) NOT NULL,
  `статус_зак` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `заказы`
--

INSERT INTO `заказы` (`id_заказа`, `телефон_при_зак`, `адрес_доставки`, `способ_оплаты`, `дата_нов_прин`, `id_менеджера`, `дата_прин_вып`, `id_курьера`, `общая_стоимость`, `id_пользователя`, `статус_зак`) VALUES
(1, '+7(777)777-77-77', 'г. Москва, ул. Дабова, д. 3', 'WebMoney', '2021-05-13', 2, '2021-05-14', 5, 4500, 3, 'выполнен'),
(2, '+7(222)222-22-22', 'г. Москва, ул. Недова, д. 33', 'QIWI', '2021-05-14', 2, '2021-05-14', 5, 5000, 4, 'выполнен'),
(3, '+7(912)327-27-43', 'г. Москва, ул. Нетова, д. 22', 'QIWI', NULL, NULL, NULL, NULL, 3500, 4, 'новый'),
(4, '+7(942)123-67-25', 'г. Москва, ул. Ванова, д. 1', 'WebMoney', NULL, NULL, NULL, NULL, 5000, 4, 'новый');

-- --------------------------------------------------------

--
-- Структура таблицы `набор_товаров`
--

CREATE TABLE `набор_товаров` (
  `id_заказа` int(11) NOT NULL,
  `id_товара` int(11) NOT NULL,
  `кол_тов_зак` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `набор_товаров`
--

INSERT INTO `набор_товаров` (`id_заказа`, `id_товара`, `кол_тов_зак`) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 1, 2),
(3, 2, 1),
(4, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `товары`
--

CREATE TABLE `товары` (
  `id_товара` int(11) NOT NULL,
  `название_тов` varchar(50) NOT NULL,
  `гл_карт_тов_путь` text NOT NULL,
  `описание_тов` text NOT NULL,
  `цена_тов` int(11) NOT NULL,
  `сезон_проведения` varchar(50) NOT NULL,
  `время_проведения` varchar(50) NOT NULL,
  `возраст` int(3) NOT NULL,
  `важная_инфа` text NOT NULL,
  `id_категории` int(11) NOT NULL,
  `id_вида` int(11) NOT NULL,
  `количество_тов` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `товары`
--

INSERT INTO `товары` (`id_товара`, `название_тов`, `гл_карт_тов_путь`, `описание_тов`, `цена_тов`, `сезон_проведения`, `время_проведения`, `возраст`, `важная_инфа`, `id_категории`, `id_вида`, `количество_тов`) VALUES
(1, 'Товар1', 'путь1', 'описание1', 1000, 'сезон', 'время', 14, 'инфа1', 2, 1, 10),
(2, 'Товар2', 'путь2', 'описание2', 2500, 'сезон', 'время', 16, 'инфа2', 2, 2, 5),
(3, 'Товар3', 'путь3', 'описание3', 5000, 'сезон', 'время', 16, 'инфа3', 4, 12, 20);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `картинки`
--
ALTER TABLE `картинки`
  ADD PRIMARY KEY (`id_картинки`),
  ADD KEY `id_картинки` (`id_картинки`,`id_товара`),
  ADD KEY `id_товара` (`id_товара`),
  ADD KEY `id_картинки_2` (`id_картинки`);

--
-- Индексы таблицы `категории`
--
ALTER TABLE `категории`
  ADD PRIMARY KEY (`id_категории`);

--
-- Индексы таблицы `корзина`
--
ALTER TABLE `корзина`
  ADD KEY `id_пользователя` (`id_пользователя`,`id_товара`),
  ADD KEY `id_товара` (`id_товара`);

--
-- Индексы таблицы `пользователи`
--
ALTER TABLE `пользователи`
  ADD PRIMARY KEY (`id_пользователя`);

--
-- Индексы таблицы `виды_отдыха`
--
ALTER TABLE `виды_отдыха`
  ADD PRIMARY KEY (`id_вида`);

--
-- Индексы таблицы `заказы`
--
ALTER TABLE `заказы`
  ADD PRIMARY KEY (`id_заказа`),
  ADD KEY `id_менеджера` (`id_менеджера`,`id_курьера`,`id_пользователя`),
  ADD KEY `id_курьера` (`id_курьера`),
  ADD KEY `id_пользователя` (`id_пользователя`);

--
-- Индексы таблицы `набор_товаров`
--
ALTER TABLE `набор_товаров`
  ADD KEY `id_заказа` (`id_заказа`,`id_товара`),
  ADD KEY `id_товара` (`id_товара`);

--
-- Индексы таблицы `товары`
--
ALTER TABLE `товары`
  ADD PRIMARY KEY (`id_товара`),
  ADD KEY `id_категории` (`id_категории`,`id_вида`),
  ADD KEY `id_вида` (`id_вида`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `картинки`
--
ALTER TABLE `картинки`
  MODIFY `id_картинки` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `категории`
--
ALTER TABLE `категории`
  MODIFY `id_категории` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `пользователи`
--
ALTER TABLE `пользователи`
  MODIFY `id_пользователя` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `виды_отдыха`
--
ALTER TABLE `виды_отдыха`
  MODIFY `id_вида` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `заказы`
--
ALTER TABLE `заказы`
  MODIFY `id_заказа` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `товары`
--
ALTER TABLE `товары`
  MODIFY `id_товара` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `картинки`
--
ALTER TABLE `картинки`
  ADD CONSTRAINT `картинки_ibfk_1` FOREIGN KEY (`id_товара`) REFERENCES `товары` (`id_товара`);

--
-- Ограничения внешнего ключа таблицы `корзина`
--
ALTER TABLE `корзина`
  ADD CONSTRAINT `корзина_ibfk_1` FOREIGN KEY (`id_товара`) REFERENCES `товары` (`id_товара`),
  ADD CONSTRAINT `корзина_ibfk_2` FOREIGN KEY (`id_пользователя`) REFERENCES `пользователи` (`id_пользователя`);

--
-- Ограничения внешнего ключа таблицы `заказы`
--
ALTER TABLE `заказы`
  ADD CONSTRAINT `заказы_ibfk_1` FOREIGN KEY (`id_менеджера`) REFERENCES `пользователи` (`id_пользователя`),
  ADD CONSTRAINT `заказы_ibfk_2` FOREIGN KEY (`id_курьера`) REFERENCES `пользователи` (`id_пользователя`),
  ADD CONSTRAINT `заказы_ibfk_3` FOREIGN KEY (`id_пользователя`) REFERENCES `пользователи` (`id_пользователя`);

--
-- Ограничения внешнего ключа таблицы `набор_товаров`
--
ALTER TABLE `набор_товаров`
  ADD CONSTRAINT `набор_товаров_ibfk_1` FOREIGN KEY (`id_товара`) REFERENCES `товары` (`id_товара`),
  ADD CONSTRAINT `набор_товаров_ibfk_2` FOREIGN KEY (`id_заказа`) REFERENCES `заказы` (`id_заказа`);

--
-- Ограничения внешнего ключа таблицы `товары`
--
ALTER TABLE `товары`
  ADD CONSTRAINT `товары_ibfk_1` FOREIGN KEY (`id_категории`) REFERENCES `категории` (`id_категории`),
  ADD CONSTRAINT `товары_ibfk_2` FOREIGN KEY (`id_вида`) REFERENCES `виды_отдыха` (`id_вида`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
