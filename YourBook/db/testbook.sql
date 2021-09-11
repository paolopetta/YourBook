-- Creazione database YourBook
DROP
DATABASE IF EXISTS TestBook;
CREATE
DATABASE TestBook;

USE
TestBook;


-- Creazione tabelle

-- auth, serve a identificare se un utente è un utente normale o avanzato
-- false, significa che è un utente normale
CREATE TABLE Utente
(
    id_utente   INT          NOT NULL AUTO_INCREMENT,
    email       VARCHAR(25)  NOT NULL,
    pwd         VARCHAR(255) NOT NULL,
    nome        VARCHAR(25)  NOT NULL,
    nazionalita VARCHAR(50) NULL,
    eta         INT,
    auth        BOOL         NOT NULL DEFAULT FALSE,

    PRIMARY KEY (iD_utente)
);

-- L'immagine è memorizzata come una stringa perchè facciamo uso di link, modificata la dimensione
CREATE TABLE LIBro
(
    isbn         VARCHAR(255) NOT NULL,
    titolo       VARCHAR(255) NOT NULL,
    autore       VARCHAR(255) NOT NULL,
    casaEditrice VARCHAR(255) NOT NULL,
    immagine     VARCHAR(100) NULL,
    genere       VARCHAR(100),
    anno_pubb    int          NOT NULL,

    PRIMARY KEY (ISbN)
);

-- Tabella con i libri che l'utente vorrebbe leggere
-- id_wishlist e id_utente messi come chiave primaria per avere che l'utente ha solo una wishlist
CREATE TABLE WIShlist
(
    id_wishlist INT          NOT NULL,
    id_utente   INT          NOT NULL,
    isbn        VARCHAR(255) NOT NULL,

    PRIMARY KEY (ID_Wishlist, id_utente),

    FOREIGN KEY (ID_Utente) REFERENCES UTEnte (id_Utente),
    FOREIGN KEY (ISbN) REFERENCES LIBro (isbN)
);

-- Tabella come i libri che l'utene ha letto
CREATE TABLE UTEnteLibro
(
    id_utente   INT          NOT NULL,
    isbn        VARCHAR(255) NOT NULL,
    valutazione INT          NOT NULL,

    PRIMARY KEY (ID_Utente, isBn),
    FOREIGN KEY (ID_Utente) REFERENCES UTEnte (id_Utente),
    FOREIGN KEY (ISbN) REFERENCES LIBro (isbN)
);

-- Inserimento Utenti
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('FrAnco@gmail.com', shA1("PROva"), 'FRanco', 'nYc, new york, usa', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('GiAnluca@gmail.com', shA1("PROva"), 'GIanluca', 'sTockton, california, usa', 18, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('SmIth@gmail.com', shA1("PROva"), 'SMith', 'mOscow, yukon territory, russia', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('FrAnk@gmail.com', shA1("PROva"), 'FRank', 'pOrto, v.n.gaia, portugal', 17, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('SeRena@gmail.com', shA1("PROva"), 'SErena', 'fArnborough, hants, united kingdom', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('PaOlo@gmail.com', shA1("PROva"), 'PAolo', 'sAnta monica, california, usa', 61, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('RiCcardo@gmail.com', shA1("PROva"), 'RIccardo', 'wAshington, dc, usa', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('ViNcenzo@gmail.com', shA1("PROva"), 'VIncenzo', 'tImmins, ontario, canada', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('AdAm@gmail.com', shA1("PROva"), 'ADam', 'gErmantown, tennessee, usa', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('MiChele@gmail.com', shA1("PROva"), 'MIchele', 'aLbacete, wisconsin, spain', 26, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('CaRolina@gmail.com', shA1("PROva"), 'CArolina', 'mElbourne, victoria, australia', 14, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('JaCk@gmail.com', shA1("PROva"), 'JAck', 'fOrt bragg, california, usa', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('JoE@gmail.com', shA1("PROva"), 'JOe', 'bArcelona, barcelona, spain', 26, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('AlEx@gmail.com', shA1("PROva"), 'ALex', 'mEdiapolis, iowa, usa', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('IsAbel@gmail.com', shA1("PROva"), 'ISabel', 'cAlgary, alberta, canada', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('ClAry@gmail.com', shA1("PROva"), 'CLary', 'aLbuquerque, new mexico, usa', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('SiMon@gmail.com', shA1("PROva"), 'SImon', 'cHesapeake, virginia, usa', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('LuCas@gmail.com', shA1("PROva"), 'LUcas', 'rIo de janeiro, rio de janeiro, brazil', 25, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('JoSeline@gmail.com', shA1("PROva"), 'JOseline', 'wEston, ,', 14, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('WaLt@gmail.com', shA1("PROva"), 'WAlt', 'lAnghorne, pennsylvania, usa', 19, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('ClArk@gmail.com', shA1("PROva"), 'CLark', 'fErrol / spain, alabama, spain', 46, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('JeSsie@gmail.com', shA1("PROva"), 'JEssie', 'eRfurt, thueringen, germany', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('GaS@gmail.com', shA1("PROva"), 'GAs', 'pHiladelphia, pennsylvania, usa', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('SaUl@gmail.com', shA1("PROva"), 'SAul', 'cOlogne, nrw, germany', 19, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('MiKe@gmail.com', shA1("PROva"), 'MIke', 'oAkland, california, usa', 55, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('SkYler@gmail.com', shA1("PROva"), 'SKyler', 'bEllevue, washington, usa', NULL, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('MaRy@gmail.com', shA1("PROva"), 'MAry', 'cHicago, illinois, usa', 32, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('HaNk@gmail.com', shA1("PROva"), 'HAnk', 'fReiburg, baden-wuerttemberg, germany', 24, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('JuNior@gmail.com', shA1("PROva"), 'JUnior', 'cUernavaca, alabama, mexico', 19, 0);
INSERT INTO UTEnte(emaIl, pwD, noMe, naZionalita, etA, auTh)
VALUES ('AdMin@gmail.com', shA1("SERena99utentelibro"), 'ADmin', 'iTalia', 19, 1);


-- Inserimento libri
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('195153448', 'CLassical Mythology', 'MArk P. O. Morford', 2002, 'OXford University Press',
        'http://images.amazon.com/images/P/0195153448.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('2005018', 'CLara Callan', 'RIchard Bruce Wright', 2001, 'HArperFlamingo Canada',
        'http://images.amazon.com/images/P/0002005018.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('60973129', 'DEcision in Normandy', 'CArlo D''Este', 1991, 'HArperPerennial',
        'http://images.amazon.com/images/P/0060973129.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('374157065',
        'Flu: The Story of the Great Influenza Pandemic of 1918 and the Search for the Virus That Caused It',
        'Gina Bari Kolata', 1999, 'FArrar Straus Giroux',
        'http://images.amazon.com/images/P/0374157065.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('393045218', 'THe Mummies of Urumchi', 'E. J. W. Barber', 1999, 'W. W. Norton &amp; Company',
        'http://images.amazon.com/images/P/0393045218.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('399135782', 'THe Kitchen God''s Wife', 'AMy Tan', 1991, 'PUtnam Pub Group',
        'http://images.amazon.com/images/P/0399135782.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('425176428', 'WHat If?: The World''s Foremost Military Historians Imagine What Might Have Been',
        'Robert Cowley', 2000, 'BErkley Publishing Group',
        'http://images.amazon.com/images/P/0425176428.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('671870432', 'PLEADING GUILTY', 'SCott Turow', 1993, 'AUdioworks',
        'http://images.amazon.com/images/P/0671870432.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('679425608', 'UNder the Black Flag: The Romance and the Reality of Life Among the Pirates', 'DAvid Cordingly',
        1996, 'RAndom House', 'hTtp://images.amazon.com/images/P/0679425608.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('074322678X', 'WHere You''ll Find Me: And Other Stories', 'ANn Beattie', 2002, 'SCribner',
        'http://images.amazon.com/images/P/074322678X.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('771074670', 'NIghts Below Station Street', 'DAvid Adams Richards', 1988, 'EMblem Editions',
        'http://images.amazon.com/images/P/0771074670.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('080652121X', 'HItler''s Secret Bankers: The Myth of Swiss Neutrality During the Holocaust', 'ADam Lebor', 2000,
        'Citadel Press', 'hTtp://images.amazon.com/images/P/080652121X.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('887841740', 'THe Middle Stories', 'SHeila Heti', 2004, 'HOuse of Anansi Press',
        'http://images.amazon.com/images/P/0887841740.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('1552041778', 'JAne Doe', 'R. J. Kaiser', 1999, 'MIra Books',
        'http://images.amazon.com/images/P/1552041778.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('1558746218', 'A Second Chicken Soup for the Woman''s Soul (Chicken Soup for the Soul Series)', 'JAck Canfield',
        1998, 'HEalth Communications', 'hTtp://images.amazon.com/images/P/1558746218.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('1567407781', 'THe Witchfinder (Amos Walker Mystery Series)', 'LOren D. Estleman', 1998,
        'Brilliance Audio - Trade', 'hTtp://images.amazon.com/images/P/1567407781.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('1575663937', 'MOre Cunning Than Man: A Social History of Rats and Man', 'RObert Hendrickson', 1999,
        'Kensington Publishing Corp.', 'hTtp://images.amazon.com/images/P/1575663937.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('1881320189', 'GOodbye to the Buttermilk Sky', 'JUlia Oliver', 1994, 'RIver City Pub',
        'http://images.amazon.com/images/P/1881320189.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('440234743', 'THe Testament', 'JOhn Grisham', 1999, 'DEll',
        'http://images.amazon.com/images/P/0440234743.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('452264464', 'BEloved (Plume Contemporary Fiction)', 'TOni Morrison', 1994, 'PLume',
        'http://images.amazon.com/images/P/0452264464.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('609804618', 'OUr Dumb Century: The Onion Presents 100 Years of Headlines from America''s Finest News Source',
        'The Onion', 1999, 'THree Rivers Press', 'hTtp://images.amazon.com/images/P/0609804618.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('1841721522', 'NEw Vegetarian: Bold and Beautiful Recipes for Every Occasion', 'CElia Brooks Brown', 2001,
        'Ryland Peters &amp; Small Ltd', 'hTtp://images.amazon.com/images/P/1841721522.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('1879384493',
        'If I''d Known Then What I Know Now: Why Not Learn from the Mistakes of Others? : You Can''t Afford to Make Them All Yourself',
        'J. R. Parrish', 2003, 'CYpress House', 'hTtp://images.amazon.com/images/P/1879384493.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('61076031', 'MAry-Kate &amp; Ashley Switching Goals (Mary-Kate and Ashley Starring in)',
        'Mary-Kate &amp; Ashley Olsen', 2000, 'HArperEntertainment',
        'http://images.amazon.com/images/P/0061076031.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('439095026', 'TEll Me This Isn''t Happening', 'RObynn Clairday', 1999, 'SCholastic',
        'http://images.amazon.com/images/P/0439095026.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('689821166', 'FLood : Mississippi 1927', 'KAthleen Duey', 1998, 'ALaddin',
        'http://images.amazon.com/images/P/0689821166.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('971880107', 'WIld Animus', 'RIch Shapero', 2004, 'TOo Far',
        'http://images.amazon.com/images/P/0971880107.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('345402871', 'AIrframe', 'MIchael Crichton', 1997, 'BAllantine Books',
        'http://images.amazon.com/images/P/0345402871.01.LZZZZZZZ.jpg');
INSERT INTO LIBro(isbN, tiTolo, auTore, anNo_pubb, caSaEditrice, imMagine)
VALUES ('345417623', 'TImeline', 'MICHAEL CRICHTON', 2000, 'BAllantine Books',
        'http://images.amazon.com/images/P/0345417623.01.LZZZZZZZ.jpg');
