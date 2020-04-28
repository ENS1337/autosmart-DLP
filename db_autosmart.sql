-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Апр 28 2020 г., 23:53
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `db_autosmart`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id_cars` int(11) NOT NULL,
  `cart_price` int(11) NOT NULL,
  `cart_count` int(11) NOT NULL DEFAULT '1',
  `cart_datetime` datetime NOT NULL,
  `cart_ip` varchar(100) NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `category_cars`
--

CREATE TABLE IF NOT EXISTS `category_cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_car` varchar(20) NOT NULL,
  `mark_auto` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Дамп данных таблицы `category_cars`
--

INSERT INTO `category_cars` (`id`, `type_car`, `mark_auto`) VALUES
(1, 'cars', 'Audi'),
(2, 'cars', 'Ford'),
(3, 'cars', 'Honda'),
(4, 'cars', 'Hyundai'),
(5, 'cars', 'Kia'),
(6, 'cars', 'Lada'),
(7, 'cars', 'Mitsubishi'),
(8, 'cars', 'Nissan'),
(9, 'cars', 'Toyota'),
(10, 'cars', 'Volkswagen'),
(11, 'trucks', 'Daf'),
(12, 'trucks', 'Gaz'),
(13, 'trucks', 'Howo'),
(14, 'trucks', 'Iveco'),
(15, 'trucks', 'Kamaz'),
(16, 'trucks', 'Man'),
(17, 'trucks', 'Mercedes-Benz'),
(18, 'trucks', 'Renault'),
(19, 'trucks', 'Scania'),
(20, 'trucks', 'Volvo'),
(21, 'passenger', 'Citroen'),
(22, 'passenger', 'Fiat'),
(23, 'passenger', 'Ford'),
(24, 'passenger', 'Gazel'),
(25, 'passenger', 'Man'),
(26, 'passenger', 'Peugeot'),
(27, 'passenger', 'Volkswagen');

-- --------------------------------------------------------

--
-- Структура таблицы `reg_admin`
--

CREATE TABLE IF NOT EXISTS `reg_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `reg_admin`
--

INSERT INTO `reg_admin` (`id`, `login`, `pass`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- Структура таблицы `reg_user`
--

CREATE TABLE IF NOT EXISTS `reg_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `patronymic` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `datetime` datetime NOT NULL,
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `reg_user`
--

INSERT INTO `reg_user` (`id`, `login`, `pass`, `surname`, `name`, `patronymic`, `email`, `phone`, `address`, `datetime`, `ip`) VALUES
(4, 'admin', '9nm2rv8q0cc4856e4fbbab44b76c641ed8c0bb5f2yo6z', 'Иванчик', 'Иван', 'Иванович', 'sokol0198@yandex.ru', '89134352256', 'г. Новосибирск, ул Титова 223', '2020-04-23 18:37:50', '127.0.0.1'),
(5, 'sokol0198', '9nm2rv8q7e9522f9908fc588871b760d22e633fe2yo6z', 'asdada', 'sadasdad', 'sadasdad', 'sokiu@sdad.rt', '111', 'asdasdsad', '2020-04-25 00:14:26', '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `table_cars`
--

CREATE TABLE IF NOT EXISTS `table_cars` (
  `cars_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `price` int(8) NOT NULL,
  `mark_auto` varchar(64) NOT NULL,
  `seo_words` text NOT NULL,
  `seo_description` text NOT NULL,
  `mini_description` varchar(512) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `mini_featurescar` varchar(128) NOT NULL,
  `featurescar` text NOT NULL,
  `datetime` datetime NOT NULL,
  `new` int(11) NOT NULL DEFAULT '0',
  `leader` int(11) NOT NULL DEFAULT '0',
  `sale` int(11) NOT NULL DEFAULT '0',
  `visible` int(11) NOT NULL DEFAULT '1',
  `count_views` int(11) NOT NULL DEFAULT '0',
  `type_car` varchar(64) NOT NULL,
  `mark_auto_id` int(11) NOT NULL,
  `like_cars` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cars_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `table_cars`
--

INSERT INTO `table_cars` (`cars_id`, `title`, `price`, `mark_auto`, `seo_words`, `seo_description`, `mini_description`, `image`, `description`, `mini_featurescar`, `featurescar`, `datetime`, `new`, `leader`, `sale`, `visible`, `count_views`, `type_car`, `mark_auto_id`, `like_cars`) VALUES
(1, 'Honda Accord', 535000, 'Honda', '', '', 'Accord образца 2002 года отличает достаточно яркий экстерьер — японцы отказались наконец от стиля «биодизайн» и прежние округло-плавные формы уступили место резким, стремительным линиям. Все это положительно отразилось на продажах и помогло сохранить стратегическое значение модели в борьбе компании Honda за мировой рынок.', 'Accord1.jpg', '', 'Двигатель: L4<br/>\nТопливо: бензин<br/>\nОбъем: 1850 куб. см<br/>\nМощность, л.с.: 136<br/>\nМакс скорость, км/ч: 205', '', '2020-04-19 14:31:44', 1, 0, 0, 1, 0, 'cars', 3, 0),
(2, 'Audi Q3', 2045000, 'Audi', '', '', 'В 2016 году компания Audi представила обновленную версию компактного кроссовера Q3. Он получил измененный дизайн передней части, который варьируется в зависимости от комплектации. Так, у версии Sport — привычная для современных Ауди массивная решетка радиатора, окрашенная в серый цвет, а исполнение S Line имеет увеличенные воздухозаборники со вставками ромбовидной формы, новую переднюю «юбку» и глянцевое черное обрамление решетки.', 'Audi1.jpg', '', 'Двигатель: TSI/TFSI<br/>\nТопливо: бензин<br/>\nОбъем: 1395 куб. см<br/>\nМощность, л.с.: 150<br/>\nМакс скорость, км/ч: 204', '', '2020-04-19 12:34:28', 1, 0, 0, 1, 1, 'cars', 1, 0),
(3, 'Toyota Corolla', 550000, 'Toyota', '', '', 'Рестайлинговый вариант Toyota Corolla десятого поколения был представлен на российском рынке 1 июля 2010 года. Обновился внешний вид седана: нового дизайна передний бампер, хромированная решетка радиатора и фары головного света. Сзади также обновились бампер и фонари. Список изменений дополнили новые диски и зеркала заднего вида с поворотниками — в итоге седан существенно преобразился. В салон обновленной Короллы установили новый руль с плоским нижним краем, обнови', 'toyotaCorolla1.jpg', '', 'Двигатель: L4<br/> Топливо: бензин<br/> Объем: 1975 куб. см<br/> Мощность, л.с.: 143<br/> Макс скорость, км/ч: 199', '', '2020-04-21 12:20:40', 1, 0, 0, 1, 1, 'cars', 9, 0),
(4, 'Nissan Skyline 250GT (V35)', 345000, 'Nissan', '', '', 'Тип двигателя:V6\r\nМарка топлива:бензин\r\nОбъем двигателя, куб. см.:2495\r\nКлапанов на цилиндр:4\r\nМощность, л.с.:215\r\nДостигается при об. в мин.:6400\r\nКрутящий момент, Нм/об. в мин.:270/4400\r\nМаксимальная скорость, км/ч:210', 'nissan_skyline1.jpg', '', 'Двигатель: L4<br/> Топливо: бензин<br/> Объем: 1975 куб. см<br/> Мощность, л.с.: 143<br/> Макс скорость, км/ч: 199', '', '2020-04-21 15:23:08', 1, 0, 0, 1, 2, 'cars', 8, 0),
(5, 'Hyundai Solaris', 620000, 'Hyundai', '', '', 'Компактный седан Hyundai Solaris был представлен в сентябре 2010 года на Московском международном автосалоне. Этот автомобиль представляет собой локальную версию модели Accent четвертого поколения (2010), которая специально доработана под российскую эксплуатацию с учетом отечественного климата и дорог. Выпуск серийного Solaris начался в январе 2011 года на заводе Hyundai Motor Manufacturing Rus (HMMR) в Санкт-Петербурге.', 'Solaris1.jpg', '', 'Двигатель: Gamma<br/> Топливо: бензин<br/> Объем: 1591 куб. см<br/> Мощность, л.с.: 123<br/>\nМакс скорость, км/ч: 185', '', '2020-04-22 11:46:20', 0, 1, 0, 1, 1, 'cars', 4, 0),
(6, 'Hyundai Sonata', 1585000, 'Hyundai', '', '', 'Компания Hyundai представила седан Sonata седьмого поколения в 2014 году. Мировая премьера автомобиля состоялась на автосалоне в Нью-Йорке. Через три года появился обновленный седан. Спереди модернизированную Сонату можно узнать по более крупной решетке радиатора и агрессивным фарам. Ниша под задний номерной знак располагается не на крышке багажника, а в бампере. Форма фонарей стала более строгой, теперь в них применены три световые «галочки».', 'Sonata1.jpg', '', 'Двигатель: Gamma<br/> Топливо: бензин<br/> Объем: 1999 куб. см<br/> Мощность, л.с.: 150<br/>\nМакс скорость, км/ч: 202', '', '2020-04-01 09:41:43', 0, 1, 0, 1, 1, 'cars', 4, 0),
(7, 'Hyundai Elantra', 230000, 'Hyundai', '', '', 'Четвертое поколение Hyundai Elantra серии HD было представлено на Нью-Йоркском Моторшоу в 2006 году. Для модели была разработана совершенно новая платформа, аналогичная моделям Hyundai i30 и Kia Cee''d. На южнокорейском рынке седан продавался под названием Hyundai Avante. Внешний облик автомобиля кардинально преобразился, стал более утонченным и дорогим. Российские покупатели могли приобрести автомобиль с двигателем объемом 1,6 литра (122 л.с.)', 'Elantra1.jpg', '', 'Двигатель: L4<br/> Топливо: бензин<br/> Объем: 1975 куб. см<br/> Мощность, л.с.: 143<br/> Макс скорость, км/ч: 199', '', '2020-04-22 19:26:50', 0, 1, 0, 1, 5, 'cars', 4, 1),
(8, 'Ford Mustang', 14530000, 'Ford', '', '', 'Рестайлинговый Мустанг получил доработанную версию атмосферного V8 объемом 5,0 литра, который теперь выдает 450 л.с. мощности вместо прежних 410 л.с. Новых показателей удалось достичь благодаря применению прямого впрыска высокого давления и распределенного впрыска низкого давления, который помогает агрегату развивать крутящий момент на невысоких оборотах. Примечательно, что для европейского рынка 2,3-литровый турбомотор после обновления стал менее мощным — 290 л.с.', 'Mustang1.jpg', '', 'Двигатель: V8<br/> Tопливо: бензин<br/> Объем: 4951 куб. см<br/> Мощность, л.с.: 450<br/> Макс скорость, км/ч: 250', '', '2020-04-08 21:43:21', 0, 0, 0, 1, 5, 'cars', 2, 0),
(9, 'Volkswagen Polo', 850000, 'Volkswagen', '', '', 'Volkswagen Polo Sedan — модель, созданная на базе хэтчбека Polo специально для России и рынков развивающихся стран. Мировой дебют Polo Sedan состоялся 2 июня на Московском автосалоне 2010 года. В 2015 году компания представила на российском рынке обновлённую версию. От прежнего седан отличают изменения в экстерьере (новые передний и задний бамперы, новая оптика, изменённая решётка радиатора, изменившийся дизайн колёсных дисков, новые цвета кузова).', 'Polo1.jpg', '', 'Двигатель: TSI/GTI<br/> Tопливо: бензин<br/> Объем: 1984 куб. см<br/> Мощность, л.с.: 200<br/>Макс скорость, км/ч: 234', '', '2020-04-03 00:00:00', 0, 1, 0, 1, 2, 'cars', 10, 1),
(10, 'Kia Rio', 520000, 'Kia', '', '', 'Продажи обновленной версии седана Kia Rio третьего поколения (QB) начались в апреле 2015 года. Rio получил измененную внешность с новой оптикой, бамперами и дизайном колесных дисков. Задние фонари можно заказать в светодиодном варианте. В интерьере седана появились качественные материалы, как отметили в Kia, «более привлекательные внешне и тактильно».', 'Rio1.jpg', '', 'Двигатель: G4FA<br/> Tопливо: бензин<br/> Объем:  1396 куб. см<br/> Мощность, л.с.: 109<br/> Макс скорость, км/ч: 183', '', '2020-04-18 20:23:09', 0, 0, 0, 1, 3, 'cars', 5, 0),
(11, 'Lada 2114 Samara', 125000, 'Lada', '', '', 'ВАЗ-2114 или «Лада 2114» — пятидверный хэтчбек производства Волжского Автомобильного Завода. Созданный на основе автомобиля ВАЗ 2109, он некоторое время выпускался параллельно в качестве проекта «Лада Самара-2», призванного повысить интерес покупателя к уже полюбившейся модели за счет широкого списка улучшений. Первый автомобиль сошел с конвейера в октябре 2001 года. Серийное же производство началось в апреле 2003 года и продолжалось до декабря 2013 года.', 'Lada14-1.jpg', '', 'Двигатель: L4/1.6і<br/> Tопливо: бензин<br/> Объем: 1596 куб. см<br/> Мощность, л.с.: 83<br/> Макс скорость, км/ч: 160', '', '2020-04-13 08:42:12', 0, 0, 0, 1, 11, 'cars', 6, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `uploads_images`
--

CREATE TABLE IF NOT EXISTS `uploads_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cars_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `uploads_images`
--

INSERT INTO `uploads_images` (`id`, `cars_id`, `image`) VALUES
(1, 12, 'Mitsubishi2.jpg'),
(2, 12, 'Mitsubishi3.jpg'),
(3, 12, 'Mitsubishi4.jpg'),
(4, 12, 'Mitsubishi5.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
