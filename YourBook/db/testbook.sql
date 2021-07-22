-- Creazione database YourBook
DROP DATABASE IF EXISTS TestBook;
CREATE DATABASE TestBook;

USE TestBook;


-- Creazione tabelle

-- auth, serve a identificare se un utente è un utente normale o avanzato
-- false, significa che è un utente normale
CREATE TABLE Utente (
                        id_utente INT NOT NULL AUTO_INCREMENT,
                        email VARCHAR(25) NOT NULL,
                        pwd VARCHAR(255) NOT NULL,
                        nome VARCHAR(25) NOT NULL,
                        nazionalita VARCHAR(50) NULL,
                        eta INT,
                        auth BOOL NOT NULL DEFAULT FALSE,

                        PRIMARY KEY(id_utente)
);

-- L'immagine è memorizzata come una stringa perchè facciamo uso di link, modificata la dimensione
CREATE TABLE Libro (
                       isbn VARCHAR(255) NOT NULL,
                       titolo VARCHAR(255) NOT NULL,
                       autore VARCHAR(255) NOT NULL,
                       casaEditrice VARCHAR(255) NOT NULL,
                       immagine VARCHAR(100) NULL,
                       genere VARCHAR(100),
                       anno_pubb int NOT NULL,

                       PRIMARY KEY(isbn)
);

-- Tabella con i libri che l'utente vorrebbe leggere
-- id_wishlist e id_utente messi come chiave primaria per avere che l'utente ha solo una wishlist
CREATE TABLE Wishlist (
                          id_wishlist INT NOT NULL,
                          id_utente INT NOT NULL,
                          isbn VARCHAR(255) NOT NULL,

                          PRIMARY KEY(id_wishlist, id_utente),

                          FOREIGN KEY(id_utente) REFERENCES Utente(id_utente),
                          FOREIGN KEY(isbn) REFERENCES Libro(isbn)
);

-- Tabella come i libri che l'utene ha letto
CREATE TABLE UtenteLibro (
                             id_utente INT NOT NULL,
                             isbn VARCHAR(255) NOT NULL,
                             valutazione INT NOT NULL,

                             PRIMARY KEY(id_utente, isbn),
                             FOREIGN KEY(id_utente) REFERENCES Utente(id_utente),
                             FOREIGN KEY(isbn) REFERENCES Libro(isbn)
);

-- Inserimento Utenti
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Franco@gmail.com',sha1("prova"),'Franco','nyc, new york, usa',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Gianluca@gmail.com',sha1("prova"),'Gianluca','stockton, california, usa',18,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Smith@gmail.com',sha1("prova"),'Smith','moscow, yukon territory, russia',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Frank@gmail.com',sha1("prova"),'Frank','porto, v.n.gaia, portugal',17,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Serena@gmail.com',sha1("prova"),'Serena','farnborough, hants, united kingdom',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Paolo@gmail.com',sha1("prova"),'Paolo','santa monica, california, usa',61,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Riccardo@gmail.com',sha1("prova"),'Riccardo','washington, dc, usa',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Vincenzo@gmail.com',sha1("prova"),'Vincenzo','timmins, ontario, canada',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Adam@gmail.com',sha1("prova"),'Adam','germantown, tennessee, usa',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Michele@gmail.com',sha1("prova"),'Michele','albacete, wisconsin, spain',26,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Carolina@gmail.com',sha1("prova"),'Carolina','melbourne, victoria, australia',14,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Jack@gmail.com',sha1("prova"),'Jack','fort bragg, california, usa',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Joe@gmail.com',sha1("prova"),'Joe','barcelona, barcelona, spain',26,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Alex@gmail.com',sha1("prova"),'Alex','mediapolis, iowa, usa',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Isabel@gmail.com',sha1("prova"),'Isabel','calgary, alberta, canada',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Clary@gmail.com',sha1("prova"),'Clary','albuquerque, new mexico, usa',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Simon@gmail.com',sha1("prova"),'Simon','chesapeake, virginia, usa',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Lucas@gmail.com',sha1("prova"),'Lucas','rio de janeiro, rio de janeiro, brazil',25,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Joseline@gmail.com',sha1("prova"),'Joseline','weston, ,',14,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Walt@gmail.com',sha1("prova"),'Walt','langhorne, pennsylvania, usa',19,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Clark@gmail.com',sha1("prova"),'Clark','ferrol / spain, alabama, spain',46,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Jessie@gmail.com',sha1("prova"),'Jessie','erfurt, thueringen, germany',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Gas@gmail.com',sha1("prova"),'Gas','philadelphia, pennsylvania, usa',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Saul@gmail.com',sha1("prova"),'Saul','cologne, nrw, germany',19,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Mike@gmail.com',sha1("prova"),'Mike','oakland, california, usa',55,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Skyler@gmail.com',sha1("prova"),'Skyler','bellevue, washington, usa',NULL,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Mary@gmail.com',sha1("prova"),'Mary','chicago, illinois, usa',32,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Hank@gmail.com',sha1("prova"),'Hank','freiburg, baden-wuerttemberg, germany',24,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('Junior@gmail.com',sha1("prova"),'Junior','cuernavaca, alabama, mexico',19,0);
INSERT INTO Utente(email,pwd,nome,nazionalita,eta,auth) VALUES ('admin@gmail.com',sha1("Serena99utentelibro"),'Admin','italia',19,1);



-- Inserimento libri
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('195153448','Classical Mythology','Mark P. O. Morford',2002,'Oxford University Press','http://images.amazon.com/images/P/0195153448.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('2005018','Clara Callan','Richard Bruce Wright',2001,'HarperFlamingo Canada','http://images.amazon.com/images/P/0002005018.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60973129','Decision in Normandy','Carlo D''Este',1991,'HarperPerennial','http://images.amazon.com/images/P/0060973129.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('374157065','Flu: The Story of the Great Influenza Pandemic of 1918 and the Search for the Virus That Caused It','Gina Bari Kolata',1999,'Farrar Straus Giroux','http://images.amazon.com/images/P/0374157065.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('393045218','The Mummies of Urumchi','E. J. W. Barber',1999,'W. W. Norton &amp; Company','http://images.amazon.com/images/P/0393045218.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('399135782','The Kitchen God''s Wife','Amy Tan',1991,'Putnam Pub Group','http://images.amazon.com/images/P/0399135782.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('425176428','What If?: The World''s Foremost Military Historians Imagine What Might Have Been','Robert Cowley',2000,'Berkley Publishing Group','http://images.amazon.com/images/P/0425176428.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671870432','PLEADING GUILTY','Scott Turow',1993,'Audioworks','http://images.amazon.com/images/P/0671870432.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('679425608','Under the Black Flag: The Romance and the Reality of Life Among the Pirates','David Cordingly',1996,'Random House','http://images.amazon.com/images/P/0679425608.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('074322678X','Where You''ll Find Me: And Other Stories','Ann Beattie',2002,'Scribner','http://images.amazon.com/images/P/074322678X.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('771074670','Nights Below Station Street','David Adams Richards',1988,'Emblem Editions','http://images.amazon.com/images/P/0771074670.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('080652121X','Hitler''s Secret Bankers: The Myth of Swiss Neutrality During the Holocaust','Adam Lebor',2000,'Citadel Press','http://images.amazon.com/images/P/080652121X.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('887841740','The Middle Stories','Sheila Heti',2004,'House of Anansi Press','http://images.amazon.com/images/P/0887841740.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1552041778','Jane Doe','R. J. Kaiser',1999,'Mira Books','http://images.amazon.com/images/P/1552041778.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1558746218','A Second Chicken Soup for the Woman''s Soul (Chicken Soup for the Soul Series)','Jack Canfield',1998,'Health Communications','http://images.amazon.com/images/P/1558746218.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1567407781','The Witchfinder (Amos Walker Mystery Series)','Loren D. Estleman',1998,'Brilliance Audio - Trade','http://images.amazon.com/images/P/1567407781.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1575663937','More Cunning Than Man: A Social History of Rats and Man','Robert Hendrickson',1999,'Kensington Publishing Corp.','http://images.amazon.com/images/P/1575663937.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1881320189','Goodbye to the Buttermilk Sky','Julia Oliver',1994,'River City Pub','http://images.amazon.com/images/P/1881320189.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('440234743','The Testament','John Grisham',1999,'Dell','http://images.amazon.com/images/P/0440234743.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('452264464','Beloved (Plume Contemporary Fiction)','Toni Morrison',1994,'Plume','http://images.amazon.com/images/P/0452264464.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('609804618','Our Dumb Century: The Onion Presents 100 Years of Headlines from America''s Finest News Source','The Onion',1999,'Three Rivers Press','http://images.amazon.com/images/P/0609804618.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1841721522','New Vegetarian: Bold and Beautiful Recipes for Every Occasion','Celia Brooks Brown',2001,'Ryland Peters &amp; Small Ltd','http://images.amazon.com/images/P/1841721522.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1879384493','If I''d Known Then What I Know Now: Why Not Learn from the Mistakes of Others? : You Can''t Afford to Make Them All Yourself','J. R. Parrish',2003,'Cypress House','http://images.amazon.com/images/P/1879384493.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('61076031','Mary-Kate &amp; Ashley Switching Goals (Mary-Kate and Ashley Starring in)','Mary-Kate &amp; Ashley Olsen',2000,'HarperEntertainment','http://images.amazon.com/images/P/0061076031.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('439095026','Tell Me This Isn''t Happening','Robynn Clairday',1999,'Scholastic','http://images.amazon.com/images/P/0439095026.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('689821166','Flood : Mississippi 1927','Kathleen Duey',1998,'Aladdin','http://images.amazon.com/images/P/0689821166.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('971880107','Wild Animus','Rich Shapero',2004,'Too Far','http://images.amazon.com/images/P/0971880107.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345402871','Airframe','Michael Crichton',1997,'Ballantine Books','http://images.amazon.com/images/P/0345402871.01.LZZZZZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345417623','Timeline','MICHAEL CRICHTON',2000,'Ballantine Books','http://images.amazon.com/images/P/0345417623.01.LZZZZZZZ.jpg');
