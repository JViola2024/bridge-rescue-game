extends Node

var tema = ""
var aktualis_kerdes_index = 0
var hid_db= 0

var kerdesek = {
	"irodalom": [
	{
		"kerdes": "Mit jelent az alliteráció?",
		"valaszok": ["Azonos mondatvégi hangzás", "Szavak elején azonos vagy hasonló hang ismétlődése", "Ritmustalan szöveg", "Túlzó költői kép"],
		"helyes": 1
	},
	{
		"kerdes": "Ki írta az Egri csillagokat?",
		"valaszok": ["Gárdonyi Géza", "Jókai Mór", "Arany János", "Mikszáth Kálmán"],
		"helyes": 0
	},
	{
		"kerdes": "Mikor született Katona József?",
		"valaszok": ["1780", "1791", "1800", "1817"],
		"helyes": 1
	},
	{
		"kerdes": "Ki írta a János vitézt?",
		"valaszok": ["Arany János", "Petőfi Sándor", "Vörösmarty Mihály", "Ady Endre"],
		"helyes": 1
	},
	{
		"kerdes": "Milyen műfajú Az ember tragédiája?",
		"valaszok": ["Elbeszélő költemény", "Drámai költemény", "Regény", "Ballada"],
		"helyes": 1
	},
	{
		"kerdes": "Ki írta a Toldit?",
		"valaszok": ["Petőfi Sándor", "Arany János", "Madách Imre", "Kölcsey Ferenc"],
		"helyes": 1
	},
	{
		"kerdes": "Mit nevezünk metaforának?",
		"valaszok": ["Két dolog közti azonosítás képes formában", "Mondatvégi rímelést", "A szórend felcserélését", "Történelmi regényt"],
		"helyes": 0
	},
	{
		"kerdes": "Ki írta a Himnuszt?",
		"valaszok": ["Vörösmarty Mihály", "Kölcsey Ferenc", "Petőfi Sándor", "Arany János"],
		"helyes": 1
	},
	{
		"kerdes": "Ki írta a Szózatot?",
		"valaszok": ["Kölcsey Ferenc", "Vörösmarty Mihály", "Jókai Mór", "Ady Endre"],
		"helyes": 1
	},
	{
		"kerdes": "Mit jelent a megszemélyesítés?",
		"valaszok": ["Élettelen dolgok emberi tulajdonságokkal való felruházása", "Túlzás alkalmazása", "Szavak ismétlése", "A cselekmény csúcspontja"],
		"helyes": 0
	},
	{
		"kerdes": "Ki írta a Bánk bánt?",
		"valaszok": ["Madách Imre", "Katona József", "József Attila", "Móricz Zsigmond"],
		"helyes": 1
	},
	{
		"kerdes": "Mikor született Petőfi Sándor?",
		"valaszok": ["1823", "1801", "1848", "1791"],
		"helyes": 0
	},
	{
		"kerdes": "Ki írta a Nemzeti dalt?",
		"valaszok": ["Arany János", "Petőfi Sándor", "Ady Endre", "Kölcsey Ferenc"],
		"helyes": 1
	},
	{
		"kerdes": "Mi a ballada egyik jellemzője?",
		"valaszok": ["Vidám, könnyed hangnem", "Drámai sűrítettség és kihagyásosság", "Csak párbeszédből áll", "Mindig hosszú regény"],
		"helyes": 1
	},
	{
		"kerdes": "Ki írta a Légy jó mindhalálig című regényt?",
		"valaszok": ["Móricz Zsigmond", "Mikszáth Kálmán", "Gárdonyi Géza", "Jókai Mór"],
		"helyes": 0
	},
	{
		"kerdes": "Ki írta Az ember tragédiája című művet?",
		"valaszok": ["Katona József", "Madách Imre", "Arany János", "Vörösmarty Mihály"],
		"helyes": 1
	},
	{
		"kerdes": "Mit jelent a rím?",
		"valaszok": ["Szavak elejének hasonlósága", "Sorvégi hangzásbeli összecsengés", "A versszakok száma", "A mondatok hossza"],
		"helyes": 1
	},
	{
		"kerdes": "Ki írta a Mama című verset?",
		"valaszok": ["Radnóti Miklós", "József Attila", "Kosztolányi Dezső", "Petőfi Sándor"],
		"helyes": 1
	},
	{
		"kerdes": "Mit jelent a hasonlat?",
		"valaszok": ["Két dolog összevetése valamilyen közös tulajdonság alapján", "A szereplők felsorolása", "Egy vers címe", "Történelmi esemény leírása"],
		"helyes": 0
	},
	{
		"kerdes": "Ki írta az Ágnes asszony című balladát?",
		"valaszok": ["Arany János", "Ady Endre", "Kölcsey Ferenc", "Mikszáth Kálmán"],
		"helyes": 0
	},
	{
		"kerdes": "Melyik mű kapcsolódik Gárdonyi Gézához?",
		"valaszok": ["Egri csillagok", "Toldi", "Bánk bán", "Az ember tragédiája"],
		"helyes": 0
	},
	{
		"kerdes": "Mit jelent a versszak?",
		"valaszok": ["A vers egyik szerkezeti egysége", "A vers címe", "A rím neve", "A főszereplő jellemzése"],
		"helyes": 0
	},
	{
		"kerdes": "Ki írta a Szeptember végén című verset?",
		"valaszok": ["Ady Endre", "Petőfi Sándor", "József Attila", "Arany János"],
		"helyes": 1
	},
	{
		"kerdes": "Melyik szerzőhöz kapcsolódik a Toldi?",
		"valaszok": ["Jókai Mór", "Arany János", "Móricz Zsigmond", "Madách Imre"],
		"helyes": 1
	}
],
	"történelem": [
	{
		"kerdes": "Mikor volt a mohácsi csata?",
		"valaszok": ["1456", "1526", "1848", "1914"],
		"helyes": 1
	},
	{
		"kerdes": "Ki volt Magyarország első királya?",
		"valaszok": ["Szent László", "Könyves Kálmán", "Szent István", "Mátyás király"],
		"helyes": 2
	},
	{
		"kerdes": "Hol írták alá a Trianoni békeszerződést?",
		"valaszok": ["Versailles", "Párizs", "Trianon-palota", "Bécs"],
		"helyes": 2
	},
	{
		"kerdes": "Mikor tört ki az 1848-as forradalom Magyarországon?",
		"valaszok": ["1848. március 15.", "1849. október 6.", "1848. április 11.", "1867. június 8."],
		"helyes": 0
	},
	{
		"kerdes": "Ki vezette a magyar sereget a nándorfehérvári diadal idején?",
		"valaszok": ["Hunyadi János", "Kossuth Lajos", "Dobó István", "II. Rákóczi Ferenc"],
		"helyes": 0
	},
	{
		"kerdes": "Mikor volt a nándorfehérvári diadal?",
		"valaszok": ["1456", "1526", "1241", "1703"],
		"helyes": 0
	},
	{
		"kerdes": "Ki volt a szabadságharc kormányzó-elnöke 1849-ben?",
		"valaszok": ["Széchenyi István", "Petőfi Sándor", "Kossuth Lajos", "Batthyány Lajos"],
		"helyes": 2
	},
	{
		"kerdes": "Melyik évben ért véget a második világháború Európában?",
		"valaszok": ["1939", "1941", "1945", "1956"],
		"helyes": 2
	},
	{
		"kerdes": "Ki volt Mátyás király apja?",
		"valaszok": ["Hunyadi János", "II. Ulászló", "Szent István", "Könyves Kálmán"],
		"helyes": 0
	},
	{
		"kerdes": "Mikor volt az 1956-os forradalom kitörése?",
		"valaszok": ["1956. október 23.", "1956. március 15.", "1945. május 8.", "1989. október 23."],
		"helyes": 0
	},
	{
		"kerdes": "Hol zajlott a mohácsi csata?",
		"valaszok": ["Eger", "Mohács", "Buda", "Pákozd"],
		"helyes": 1
	},
	{
		"kerdes": "Ki védte Egert 1552-ben?",
		"valaszok": ["Hunyadi János", "Dobó István", "Kossuth Lajos", "Rákóczi Ferenc"],
		"helyes": 1
	},
	{
		"kerdes": "Mikor volt a honfoglalás körülbelül?",
		"valaszok": ["895", "1000", "1241", "1526"],
		"helyes": 0
	},
	{
		"kerdes": "Ki vezette a magyarokat a honfoglalás idején?",
		"valaszok": ["Árpád", "Szent István", "Attila", "Hunyadi János"],
		"helyes": 0
	},
	{
		"kerdes": "Melyik évben koronázták királlyá Szent Istvánt?",
		"valaszok": ["896", "1000", "1222", "1301"],
		"helyes": 1
	},
	{
		"kerdes": "Mi történt 1241-ben Magyarországon?",
		"valaszok": ["Tatárjárás", "Mohácsi csata", "Forradalom", "Kiegyezés"],
		"helyes": 0
	},
	{
		"kerdes": "Ki volt az Osztrák–Magyar Monarchia egyik uralkodója a kiegyezés után?",
		"valaszok": ["Ferenc József", "Napóleon", "Mária Terézia", "Lenin"],
		"helyes": 0
	},
	{
		"kerdes": "Mikor volt a kiegyezés?",
		"valaszok": ["1848", "1867", "1918", "1920"],
		"helyes": 1
	},
	{
		"kerdes": "Melyik város lett a dualizmus idején az ország központja?",
		"valaszok": ["Debrecen", "Szeged", "Budapest", "Pécs"],
		"helyes": 2
	},
	{
		"kerdes": "Mikor ért véget az első világháború?",
		"valaszok": ["1914", "1918", "1920", "1939"],
		"helyes": 1
	},
	{
		"kerdes": "Ki volt a kuruc szabadságharc vezetője?",
		"valaszok": ["Kossuth Lajos", "II. Rákóczi Ferenc", "Batthyány Lajos", "Széchenyi István"],
		"helyes": 1
	},
	{
		"kerdes": "Melyik évben kezdődött a második világháború?",
		"valaszok": ["1918", "1939", "1945", "1956"],
		"helyes": 1
	},
	{
		"kerdes": "Hol található az Országház?",
		"valaszok": ["Bécs", "Pozsony", "Budapest", "Debrecen"],
		"helyes": 2
	},
	{
		"kerdes": "Ki volt az utolsó magyar királyné?",
		"valaszok": ["Erzsébet királyné", "Zita királyné", "Mária Terézia", "Anjou Hedvig"],
		"helyes": 1
	}
],
	"informatika": [
	{
		"kerdes": "Mi az int adattípus C#-ban?",
		"valaszok": ["Szöveg", "Egész szám", "Logikai érték", "Lebegőpontos szám"],
		"helyes": 1
	},
	{
		"kerdes": "Mi lesz az értéke? int x = 5; x = x + 3;",
		"valaszok": ["5", "3", "8", "53"],
		"helyes": 2
	},
	{
		"kerdes": "Melyik ciklus fut le biztosan legalább egyszer?",
		"valaszok": ["for", "while", "do-while", "foreach"],
		"helyes": 2
	},
	{
		"kerdes": "Mit csinál az if utasítás?",
		"valaszok": ["Ciklust indít", "Feltételt vizsgál", "Változót töröl", "Adatot ment"],
		"helyes": 1
	},
	{
		"kerdes": "Mi a tömb (array)?",
		"valaszok": ["Egyetlen változó", "Azonos típusú elemek listája", "Fájl", "Függvény"],
		"helyes": 1
	},
	{
		"kerdes": "Melyik helyes tömb deklaráció C#-ban?",
		"valaszok": ["int tomb;", "int[] tomb;", "array int tomb;", "tomb int[];"],
		"helyes": 1
	},
	{
		"kerdes": "Mi lesz az értéke? int x = 10; if(x > 5) x = 1;",
		"valaszok": ["10", "5", "1", "0"],
		"helyes": 2
	},
	{
		"kerdes": "Mi a függvény szerepe?",
		"valaszok": ["Adat törlése", "Kód újrahasznosítása", "Memória növelése", "Program leállítása"],
		"helyes": 1
	},
	{
		"kerdes": "Mit jelent a bool adattípus?",
		"valaszok": ["Szám", "Szöveg", "Igaz/hamis", "Lista"],
		"helyes": 2
	},
	{
		"kerdes": "Mi lesz az értéke? int x = 2 * 3 + 4;",
		"valaszok": ["10", "14", "12", "8"],
		"helyes": 0
	},
	{
		"kerdes": "Melyik operátor az egyenlőség vizsgálata?",
		"valaszok": ["=", "==", "!=", "<>"],
		"helyes": 1
	},
	{
		"kerdes": "Mi a változó?",
		"valaszok": ["Fix érték", "Adat tárolására szolgáló hely", "Fájl", "Program"],
		"helyes": 1
	},
	{
		"kerdes": "Mi lesz az értéke? int x = 10; x--;",
		"valaszok": ["11", "10", "9", "0"],
		"helyes": 2
	},
	{
		"kerdes": "Mit csinál a for ciklus?",
		"valaszok": ["Egyszer fut", "Ismétel", "Feltételt vizsgál", "Töröl"],
		"helyes": 1
	},
	{
		"kerdes": "Mi az algoritmus?",
		"valaszok": ["Számítógép", "Lépések sorozata egy probléma megoldására", "Program neve", "Fájlformátum"],
		"helyes": 1
	},
	{
		"kerdes": "Mi lesz az értéke? int x = 1; x = x * 2;",
		"valaszok": ["1", "2", "3", "0"],
		"helyes": 1
	},
	{
		"kerdes": "Mi az input?",
		"valaszok": ["Kimenet", "Bevitel", "Mentés", "Törlés"],
		"helyes": 1
	},
	{
		"kerdes": "Mi az output?",
		"valaszok": ["Bevitel", "Kimenet", "Fájl", "Program"],
		"helyes": 1
	},
	{
		"kerdes": "Mi lesz az értéke? int x = 5; x += 5;",
		"valaszok": ["5", "10", "15", "0"],
		"helyes": 1
	},
	{
		"kerdes": "Melyik feltétel igaz? (5 > 3)",
		"valaszok": ["Igaz", "Hamis", "Hiba", "Null"],
		"helyes": 0
	},
	{
		"kerdes": "Mi lesz az értéke? int x = 4; if(x < 3) x = 10;",
		"valaszok": ["4", "10", "3", "0"],
		"helyes": 0
	},
	{
		"kerdes": "Mi a ciklus célja?",
		"valaszok": ["Egyszer futtat", "Ismétel műveleteket", "Töröl adatot", "Ment fájlt"],
		"helyes": 1
	},
	{
		"kerdes": "Mi lesz az értéke? int x = 6 / 2;",
		"valaszok": ["2", "3", "4", "6"],
		"helyes": 1
	},
	{
		"kerdes": "Mi az alapértelmezett értéke egy bool változónak?",
		"valaszok": ["true", "false", "0", "1"],
		"helyes": 1
	}
]
}

func uj_jatek ():
	aktualis_kerdes_index = 0
	hid_db = 0
