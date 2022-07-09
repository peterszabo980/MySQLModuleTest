/*
Adatbázis létrehozása feladat

Készíts adatbázis-táblákat a feladat leírása alapján!
(Magát az adatbázist nem kell létrehoznod.)

Amit be kell adnod:
    - a táblák létrehozásának MySQL utasítása
    - a táblák mezőinek létrehozásához és beállításához szükséges MySQL utasítások

Az utasításokat jelen fájl tartalmazza!

A bónusz feladat megoldása nem kötelező.

Nem futtatható (azaz szintaktikai hibás) SQL utasításokért nem jár pont.
A feladatot részben teljesítő megoldásokért részpontszám jár.
A bónusz feladatnál csak a teljesen helyes megoldásért jár pont.

A feladat leírása törölhető.

Jó munkát!
*/

/*
Adatbázis-táblák létrehozása (20 pont)

Az általad létrehozott adatbázist egy üzenetküldő alkalmazáshoz szeretnénk használni.
Az alkalmazásban a felhasználók regisztrálás után tudnak üzenetet küldeni szintén regisztrált felhasználóknak,
valamint a kapott üzenetekre válaszolhatnak.
Nincs lehetőség több címzett megadására - azaz egy üzenetet csak egy felhasználó részére lehet küldeni.

Az adatbázisnak képesnek kell lennie a következő adatok tárolására:
    1. regisztrált felhasználók adatai
        - kötelező adatok: név, email-cím, jelszó, aktív felhasználó-e, a regisztrálás időpontja
    2. a regisztrált felhasználók által egymásnak küldött üzenetek adatai
        - kötelező adatok: küldő, címzett, üzenet szövege, az üzenet küldésének időpontja,
          továbbá ha az üzenet egy korábban kapottra válasz, akkor hivatkozás a megválaszolt üzenetre

Kritériumok az adatbázissal kapcsolatban:
    - legalább kettő, legfeljebb négy táblát tartalmazzon
    - legyen legalább egy kapcsolat a létrehozott táblák között (idegen kulccsal)
      (egy tábla saját magával is kapcsolódhat)
    - a fent leírt adatokon kívül más adatokat is tárolhat, de egy táblán legfeljebb 8 mező lehet
    - az adatbázis, a táblák és a mezők elnevezése rajtad áll, azonban használj angol megnevezéseket, méghozzá következetesen
      (ha az egyik táblában camel-case szerinti mező-neveket adtál, akkor a másik táblában is tégy úgy)

CREATE DATABASE email_sender;
CREATE TABLE `email_sender` (
 `id` int(255) NOT NULL AUTO_INCREMENT,
 `name` varchar(100) NOT NULL,
 `e_mail` varchar(50) NOT NULL,
 `password` int(10) NOT NULL,
 `active_user` enum('T','F') NOT NULL DEFAULT 'F',
 `reg_time` timestamp NULL DEFAULT current_timestamp(),
 `e_mail_ID` int(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

CREATE TABLE `message` (
 `sender` varchar(50) NOT NULL,
 `addressee` varchar(100) NOT NULL,
 `message_text` text NOT NULL,
 `message_time` timestamp NOT NULL DEFAULT current_timestamp(),
 `id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

ALTER TABLE `email_sender` ADD `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`id`);
ALTER TABLE `message` ADD FOREIGN KEY (`e_mail_ID`) REFERENCES `email_sender`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;


*/


-- ---------------------------------------------------------------------------------------------------------------------

/*
Bónusz feladat (5 pont)

Adj hozzá adatokat mindegyik táblához!
(Az adatoknak nem kell valósnak lenniük. Egy felhasználói email-cím lehet például: 'valami@valami.va')
INSERT INTO `email_sender`(`name`, `e_mail`, `password`, `active_user`, `reg_time`) VALUES ('Kiss Bála]','kis@ba.la','1234','F','2021-12-12]');
INSERT INTO `email_sender` (`id`, `name`, `e_mail`, `password`, `active_user`, `reg_time`) VALUES (NULL, 'Nagy Bála', 'nagy@ba.la', '4321', 'T', '2021-05-12 00:00:00');

INSERT INTO `message`(`sender`, `addressee`, `message_text`, `message_time`, `id`) VALUES ('Kiss Bála','nagy@ba.la','Na, elég legyen már ebből','2022-05-12','2');
*/
