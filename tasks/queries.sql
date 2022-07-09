/*
Lekérdezések feladatsor

A feladatok a `world` adatbázishoz vonatkoznak.
Ez az adatbázis három táblát tartalmaz: `city`, `country`, `countrylanguage`.
A phpMyAdmin online felületén a `gigapoli_progmatic` néven található meg.

Kötelezően megoldandó feladatok: 1 - 15.
A bónusz feladatok nem kötelezőek.

A megoldásaidat a megfelelő feladat után írd! A feladat szövege törölhető, de a sorszáma nem.
Azaz legyen teljesen egyértelmű, hogy melyik feladatra mi a megoldásod.

A nem beazonosítható, nem egyértelmű megoldásokért nem jár pont.
Nem futtatható (azaz szintaktikai hibás) SQL utasításokért nem jár pont.
(Nem minősül szintaktikai hibának az utasítást lezáró pontosvessző elhagyása.)
Nem teljesen helyes, azonban a feladatot részben teljesítő megoldásokért részpontszám jár.
A bónusz feladatoknál csak a teljesen helyes megoldásért jár pont.

Fokozottan ügyelj arra, hogy kövesd a feladat leírását. (Például csak olyan mezőket tartalmazzon a találati lista,
amelyeket a feladat kér; olyan sorrendben jelenjenek meg a találatok, amit a feladat kér - stb.)

Ne feledd, hogy a megoldásaidat jelen fájlnak tartalmaznia kell.

Jó munkát!
*/

/*
1. feladat (2 pont)
    Melyik évben nyerte el egy ország legkorábban a függetlenségét?
    Írj lekérdezést, amely visszaadja azt az évszámot, amikor az első ország független lett! (IndepYear)

    Elvárt eredmény:
        -1523

    Megoldás:
    SELECT MIN(IndepYear) FROM `country`;

*/


/*
2. feladat (4 pont)
    És melyik az az ország, amely legkorábban nyerte el a függetlenségét?
    Írj lekérdezést, amely visszaadja annak az országnak az összes adatát, amelyik legkorábban nyerte el a függetlenségét!
    A feladatot egy lekérdezésben oldd meg! Azaz nem elfogadható, ha először lekérdezed a legkorábbi függetlenség évszámát,
    azt kimásolod, és beilleszted a lekérdezésbe.

    Elvárt eredmény:
        CHN Code-ú ország (China)

    Megoldás:
    SELECT * FROM `country` WHERE `IndepYear`=(SELECT MIN(`IndepYear`) FROM country);
*/


/*
3. feladat (2 pont)
    Melyek azok a városok, amelyeknél a város neve ugyanaz, mint a körzeté?
    Írj lekérdezést, amely visszaadja a városok összes adatát, amelyeknél a név megegyezik a körzet nevével! (District)

    Elvárt eredmény:
        550 rekord
        ID szerint növekvő sorrendben az első 5 darab: 2, 3, 8, 11, 34
        ID szerint növekvő sorrendben az utolsó 3 darab: 4076, 4078, 4079

    Megoldás:
    SELECT * FROM `city` WHERE `Name`=`District` ORDER BY `ID` ASC;
*/


/*
4. feladat (3 pont)
    Mely országoknál tartalmazza az államfő neve az 'Ahmad', az 'Ahmed' vagy a 'Hamad' szavakat?
    Írj lekérdezést, amely visszaadja az ország nevét és az államfő nevét, amennyiben az államfő neve tartalmazza
    a fent leírt szavak bármelyikét! (HeadOfState)

    Elvárt eredmény:
        7 rekord
        országnevek: Bangladesh, Bahrain, Kuwait, Mauritania, Qatar, Sudan, Sierra Leone

    Megoldás:
    SELECT `Name`, `HeadOfState` FROM `country` WHERE `HeadOfState` LIKE '%Ahmad%' OR `HeadOfState` LIKE '%Ahmed%' OR `HeadOfState` LIKE '%Hamad%';
*/


/*
5. feladat (3 pont)
    Melyek azok az országok, amelyeknél nincs megadva várható életkor, de van lakosságuk?
    Írj lekérdezést, amely visszaadja azoknak az országoknak az összes adatát, ahol nem szerepel várható életkor (LifeExpectancy),
    de nem lakatlanok.

    Elvárt eredmény:
        10 rekord
        kontinensek: Oceania (7 db), Europe (2), South America (1)

    Megoldás:
    SELECT * FROM `country` WHERE `LifeExpectancy` is NULL AND `Population` != '0';
*/


/*
6. feladat (2 pont)
    Mely országoknál nagyobb a GNPOld a GNP-nél?
    Írj lekérdezést, amely visszaadja az ország kódját, nevét, a GNP-t és a GNPOld-ot azokról az országokról,
    ahol a GNPOld nagyobb, mint a GNP!

    Elvárt eredmény:
        63 rekord

    Megoldás:
    SELECT `Code`, `Name`, `GNP`,`GNPOld` FROM `country` WHERE `GNPOld` > `GNP`;
*/


/*
7. feladat (4 pont)
    Mely nyelvek neve végződik úgy, hogy 'ian'?
    Írj lekérdezést, amely visszaadja a nyelvek nevét, ahol a név 'ian'-ra végződik!
    Mindegyik nyelv csak egyszer szerepeljen a találatok között, és rendezd őket név szerint ABC-sorrendbe!

    Elvárt eredmény:
        29 rekord

    Megoldás:
    SELECT DISTINCT `Language` FROM `countrylanguage` WHERE `Language` LIKE '%ian' ORDER BY `Language` ASC;
*/


/*
8. feladat (4 pont)
    Hány darab ország szerepel az adatbázisban a különböző európai régiókban?
    Írj lekérdezést, amely visszaadja a régiót és a régióban található országok darabszámát,
    ahol a régióban szerepel az, hogy 'Europe'!

    Elvárt eredmény:
        Southern Europe: 15
        Western Europe: 9
        Eastern Europe 10

    Megoldás:
    SELECT DISTINCT `Region`, COUNT(*) AS 'number' FROM `country` WHERE `Region` LIKE '%europe%' GROUP by `Region`;
*/


/*
9. feladat (5 pont)
    Melyek az országok fővárosai?
    Írj lekérdezést, amely visszaadja az ország kódját, nevét és a fővárosának a nevét,
    méghozzá az ország neve szerint ABC-sorrendben!
    A találati listában minden ország szerepeljen - még akkor is, ha nincsen fővárosa.

    Elvárt eredmény:
        239 rekord
        első országkód: AFG
        utolsó országkód: ZWE

    Megoldás:
    SELECT DISTINCT country.Code as 'Ország kód', country.Name AS 'Ország', city.Name AS 'Főváros' FROM `country` Left JOIN `city` ON country.Capital = city.ID ORDER BY `country`.`Name`;
*/


/*
10. feladat (3 pont)
    Melyek azok a városok, amelyeknél a populáció száma pontosan 3 számjegyből áll?
    Írj lekérdezést, amely visszaadja azoknak a városoknak az összes adatát, amelyeknél a lakosság száma pontosan 3 számjegyből áll!

    Elvárt eredmény:
        10 rekord
        a városok ID-ja: 61, 62, 1791, 2316, 2317, 2728, 2805, 2806, 3333, 3538

    Megoldás:
    SELECT * FROM `city` WHERE `Population` < 1000 AND `Population` > 99;

*/


/*
11. feladat (5 pont)
    Mely városok tartoznak olyan országokhoz, amelyek a 'Nordic Countries' régióban találhatóak?
    Írj lekérdezést, amely visszaadja azoknak a városoknak az összes adatát,
    amelyek valamilyen 'Nordic Countries' régióhoz tartozó országban vannak,
    méghozzá országkód szerint ABC-sorrendben (növekvő), populáció szerint csökkenő sorrendben!

    Elvárt eredmény:
        35 rekord
        országkódok, amelyek szerepelnek a listában: DNK, FIN, FRO, ISL, NOR, SJM, SWE

    Megoldás:
    SELECT city.* FROM `country` INNER JOIN city WHERE country.Region = 'Nordic Countries' AND country.Code = city.CountryCode;

*/


/*
12. feladat (5 pont)
    Hány ország található a különböző régiókban, amelyek időszámításunk szerint 1500 előtt nyerték el a függetlenségüket,
    vagy mindig is függetlenek voltak?
    Írj lekérdezés, amely visszaadja a régiót és a régióhoz tartozó azon országok darabszámát, amelyekre igaz,
    hogy nincs érték megadva az `IndepYear`-nél, vagy 1500 előtt nyerték el a függetlenségüket!
    A találatokat rendezd a darabszám szerint csökkenő sorrendbe!

    Elvárt eredmény:
        19 rekord
        legkisebb: Northern Africa (1)
        legnagyobb: Caribbean (11)

    Megoldás:
    SELECT `Region`, COUNT(*) AS 'DB' FROM `country` WHERE `IndepYear` < 1500 OR`IndepYear` IS NULL GROUP by `Region` ORDER by COUNT(*) DESC;
*/


/*
13. feladat (6 pont)
    Melyek azok az országok, amelyekben nem hivatalos nyelvként beszélik az angolt?
    Írj lekérdezést, amely visszaadja az országok összes adatát, amelyekben az angol nem hivatalos nyelv!

    Elvárt eredmény:
        16 rekord
        országkódok: ABW, ANT, BHR, BRN, COK, DNK, ISL, JPN, KWT, MAC, MCO, MDV, MYS, NOR, PRI, TTO

    Megoldás:
    SELECT country.* FROM `countrylanguage` INNER JOIN country WHERE country.Code = countrylanguage.CountryCode AND `Language` = 'English' AND `IsOfficial` = 'F' ORDER BY `countrylanguage`.`Language` ASC;
*/


/*
14. feladat (6 pont)
    Mely országokhoz nem tartozik egy város sem?
    Írj lekérdezést, amely visszaadja azoknak az országoknak az összes adatát, amelyekhez nem tartozik város az adatbázisban!

    Elvárt eredmény:
        7 rekord
        országkódok: ATA, ATF, BVT, HMD, IOT, SGS, UMI

    Megoldás:
    SELECT country.* FROM `country` WHERE `Capital` is NULL;

    vagy

    SELECT country.* FROM `country` LEFT JOIN `city` ON country.`Code` = city.`CountryCode` WHERE city.`Name` is NULL;
*/


/*
15. feladat (6 pont)
    Melyik országokhoz tartozik nyelv, ahol a nyelvet a lakosság 0%-a beszéli?
    Írj lekérdezést, amely visszaadja az ország nevét, kontinensét, régióját, a nyelv nevét és százalékát, amelyre igaz,
    hogy a nyelv százaléka 0!

    Elvárt eredmény:
        65 rekord

    Megoldás:
    SELECT country.Name, country.Continent, country.Region, countrylanguage.Language, countrylanguage.Percentage FROM `country` INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Percentage = 0.0;
*/


-- ---------------------------------------------------------------------------------------------------------------------

/*
Bónusz feladatok
*/

/*
bónusz 1. (4 pont)
    Melyek azok az országok, amelyek kétbetűs országkódja nem a hárombetűs országkód első két betűje?
    Írj lekérdezést, amely visszaadja az ország hárombetűs kódját, kétbetűs kódját és nevét,
    ahol a hárombetűs országkód első két betűje nem azonos a kétbetűs kóddal!

    Elvárt eredmény:
        88 rekord
*/


/*
bónusz 2. (4 pont)
    Mely városok tartoznak ahhoz az országhoz, amelyik legelőbb nyerte el a függetlenségét?
    Írj lekérdezést, amely visszaadja azoknak a városoknak az összes adatát,
    amelyek a legkorábban függetlenné vált országhoz tartoznak!
    A feladatot egy lekérdezésben oldd meg! Azaz nem elfogadható, ha először lekérdezed az országkódot,
    az kimásolod, és beleilleszted a lekérdezésbe.

    Elvárt eredmény:
        363 rekord
*/


/*
bónusz 3. (4 pont)
    Mekkora a százaléka a legnagyobb százalékban beszélt nyelveknek országonként?
    Írj lekérdezést, amely visszaadja az országkódot és az országban a legnagyobb százalékban beszélt nyelv százalékát!
    A feladatot egy lekérdezésben oldd meg!

    Elvárt eredmény:
        233 rekord
        néhány példa:
            ABW 76.7
            AFG 52.4
            AGO 37.2
            AIA 0.0
*/


/*
bónusz 4. (6 pont)
    Melyik nyelvet beszélik a legnagyobb százalékban országonként?
    Írj lekérdezést, amely visszaadja az országkódot, a nyelvet és a százalékot,
    méghozzá országonként kiválasztva a legnagyobb százalékban beszélt nyelvet!
    A feladatot egy lekérdezésben oldd meg!

    Elvárt eredmény:
        241 rekord (néhány országban holtverseny van - ezért lesz itt több találat, mint a bónusz 3. feladatnál)
        néhány példa:
            ABW, Papiamento, 76.7
            AFG, Pashto, 52.4
            AGO, Ovimbundu, 37.2
            AIA, English, 0.0
*/


/*
bónusz 5. (6 pont)
    Hány hivatalos és nem hivatalos nyelv tartozik a különböző országokhoz?
    Írj lekérdezést, amely visszaadja az országkódot, a hozzá tartozó hivatalos nyelvek darabszámát
    és a nem hivatalos nyelvek darabszámát!

    Elvárt eredmény:
        233 rekord
        néhány példa:
            ABW, hivatalos: 1, nem hivatalos: 3
            AFG, hivatalos: 2, nem hivatalos: 3
            AGO, hivatalos: 0, nem hivatalos: 9
            AIA, hivatalos: 1, nem hivatalos: 0
*/

