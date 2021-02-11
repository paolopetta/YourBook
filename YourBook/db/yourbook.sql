-- Creazione database YourBook
DROP DATABASE IF EXISTS YourBook;
CREATE DATABASE YourBook;

USE YourBook;

DROP user IF EXISTS 'yourbook'@'localhost';
CREATE USER 'yourbook'@'localhost' IDENTIFIED BY 'Admin';
GRANT ALL ON YourBook.* TO 'yourbook'@'localhost';

-- Creazione tabelle

-- auth, serve a identificare se un utente è un utente normale o avanzato
-- false, significa che è un utente normale
CREATE TABLE Utente (
	id_utente INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(25) NOT NULL,
    pwd VARCHAR(15) NOT NULL,
    nome VARCHAR(25) NOT NULL,
    nazionalita VARCHAR(15) NULL,
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

    PRIMARY KEY(id_utente, isbn),
    FOREIGN KEY(id_utente) REFERENCES Utente(id_utente),
    FOREIGN KEY(isbn) REFERENCES Libro(isbn)
);
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('195153448','Classical Mythology','Mark P. O. Morford','2002','Oxford University Press','http://images.amazon.com/images/P/0195153448.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('2005018','Clara Callan','Richard Bruce Wright','2001','HarperFlamingo Canada','http://images.amazon.com/images/P/0002005018.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60973129','Decision in Normandy','Carlo D''Este','1991','HarperPerennial','http://images.amazon.com/images/P/0060973129.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('374157065','Flu: The Story of the Great Influenza Pandemic of 1918 and the Search for the Virus That Caused It','Gina Bari Kolata','1999','Farrar Straus Giroux','http://images.amazon.com/images/P/0374157065.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('393045218','The Mummies of Urumchi','E. J. W. Barber','1999','W. W. Norton &amp; Company','http://images.amazon.com/images/P/0393045218.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('399135782','The Kitchen God''s Wife','Amy Tan','1991','Putnam Pub Group','http://images.amazon.com/images/P/0399135782.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('425176428','What If?: The World''s Foremost Military Historians Imagine What Might Have Been','Robert Cowley','2000','Berkley Publishing Group','http://images.amazon.com/images/P/0425176428.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671870432','PLEADING GUILTY','Scott Turow','1993','Audioworks','http://images.amazon.com/images/P/0671870432.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('679425608','Under the Black Flag: The Romance and the Reality of Life Among the Pirates','David Cordingly','1996','Random House','http://images.amazon.com/images/P/0679425608.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('074322678X','Where You''ll Find Me: And Other Stories','Ann Beattie','2002','Scribner','http://images.amazon.com/images/P/074322678X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('771074670','Nights Below Station Street','David Adams Richards','1988','Emblem Editions','http://images.amazon.com/images/P/0771074670.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('080652121X','Hitler''s Secret Bankers: The Myth of Swiss Neutrality During the Holocaust','Adam Lebor','2000','Citadel Press','http://images.amazon.com/images/P/080652121X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('887841740','The Middle Stories','Sheila Heti','2004','House of Anansi Press','http://images.amazon.com/images/P/0887841740.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1552041778','Jane Doe','R. J. Kaiser','1999','Mira Books','http://images.amazon.com/images/P/1552041778.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1558746218','A Second Chicken Soup for the Woman''s Soul (Chicken Soup for the Soul Series)','Jack Canfield','1998','Health Communications','http://images.amazon.com/images/P/1558746218.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1567407781','The Witchfinder (Amos Walker Mystery Series)','Loren D. Estleman','1998','Brilliance Audio - Trade','http://images.amazon.com/images/P/1567407781.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1575663937','More Cunning Than Man: A Social History of Rats and Man','Robert Hendrickson','1999','Kensington Publishing Corp.','http://images.amazon.com/images/P/1575663937.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1881320189','Goodbye to the Buttermilk Sky','Julia Oliver','1994','River City Pub','http://images.amazon.com/images/P/1881320189.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('440234743','The Testament','John Grisham','1999','Dell','http://images.amazon.com/images/P/0440234743.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('452264464','Beloved (Plume Contemporary Fiction)','Toni Morrison','1994','Plume','http://images.amazon.com/images/P/0452264464.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('609804618','Our Dumb Century: The Onion Presents 100 Years of Headlines from America''s Finest News Source','The Onion','1999','Three Rivers Press','http://images.amazon.com/images/P/0609804618.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1841721522','New Vegetarian: Bold and Beautiful Recipes for Every Occasion','Celia Brooks Brown','2001','Ryland Peters &amp; Small Ltd','http://images.amazon.com/images/P/1841721522.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1879384493','If I''d Known Then What I Know Now: Why Not Learn from the Mistakes of Others? : You Can''t Afford to Make Them All Yourself','J. R. Parrish','2003','Cypress House','http://images.amazon.com/images/P/1879384493.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('61076031','Mary-Kate &amp; Ashley Switching Goals (Mary-Kate and Ashley Starring in)','Mary-Kate &amp; Ashley Olsen','2000','HarperEntertainment','http://images.amazon.com/images/P/0061076031.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('439095026','Tell Me This Isn''t Happening','Robynn Clairday','1999','Scholastic','http://images.amazon.com/images/P/0439095026.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('689821166','Flood : Mississippi 1927','Kathleen Duey','1998','Aladdin','http://images.amazon.com/images/P/0689821166.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('971880107','Wild Animus','Rich Shapero','2004','Too Far','http://images.amazon.com/images/P/0971880107.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345402871','Airframe','Michael Crichton','1997','Ballantine Books','http://images.amazon.com/images/P/0345402871.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345417623','Timeline','MICHAEL CRICHTON','2000','Ballantine Books','http://images.amazon.com/images/P/0345417623.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('684823802','OUT OF THE SILENT PLANET','C.S. Lewis','1996','Scribner','http://images.amazon.com/images/P/0684823802.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375759778','Prague : A Novel','ARTHUR PHILLIPS','2003','Random House Trade Paperbacks','http://images.amazon.com/images/P/0375759778.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('425163091','Chocolate Jesus','Stephan Jaramillo','1998','Berkley Publishing Group','http://images.amazon.com/images/P/0425163091.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3404921038','Wie Barney es sieht.','Mordecai Richler','2002','L�?¼bbe','http://images.amazon.com/images/P/3404921038.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3442353866','Der Fluch der Kaiserin. Ein Richter- Di- Roman.','Eleanor Cooney','2001','Goldmann','http://images.amazon.com/images/P/3442353866.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3442410665','Sturmzeit. Roman.','Charlotte Link','1991','Goldmann','http://images.amazon.com/images/P/3442410665.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3442446937','Tage der Unschuld.','Richard North Patterson','2000','Goldmann','http://images.amazon.com/images/P/3442446937.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375406328','Lying Awake','Mark Salzman','2000','Alfred A. Knopf','http://images.amazon.com/images/P/0375406328.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('446310786','To Kill a Mockingbird','Harper Lee','1988','Little Brown &amp; Company','http://images.amazon.com/images/P/0446310786.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('449005615','Seabiscuit: An American Legend','LAURA HILLENBRAND','2002','Ballantine Books','http://images.amazon.com/images/P/0449005615.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60168013','Pigs in Heaven','Barbara Kingsolver','1993','Harpercollins','http://images.amazon.com/images/P/0060168013.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('038078243X','Miss Zukas and the Raven''s Dance','Jo Dereske','1996','Avon','http://images.amazon.com/images/P/038078243X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('055321215X','Pride and Prejudice','Jane Austen','1983','Bantam','http://images.amazon.com/images/P/055321215X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('067176537X','The Therapeutic Touch: How to Use Your Hands to Help or to Heal','Dolores Krieger','1979','Fireside','http://images.amazon.com/images/P/067176537X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('61099686','Downtown','Anne Rivers Siddons','1995','HarperTorch','http://images.amazon.com/images/P/0061099686.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('553582909','Icebound','Dean R. Koontz','2000','Bantam Books','http://images.amazon.com/images/P/0553582909.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671888587','I''ll Be Seeing You','Mary Higgins Clark','1994','Pocket','http://images.amazon.com/images/P/0671888587.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('553582747','From the Corner of His Eye','Dean Koontz','2001','Bantam Books','http://images.amazon.com/images/P/0553582747.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('425182908','Isle of Dogs','Patricia Cornwell','2002','Berkley Publishing Group','http://images.amazon.com/images/P/0425182908.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('042518630X','Purity in Death','J.D. Robb','2002','Berkley Publishing Group','http://images.amazon.com/images/P/042518630X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('440223571','This Year It Will Be Different: And Other Stories','Maeve Binchy','1997','Dell','http://images.amazon.com/images/P/0440223571.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('812523873','Proxies','Laura J. Mixon','1999','Tor Books','http://images.amazon.com/images/P/0812523873.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('842342702','Left Behind: A Novel of the Earth''s Last Days (Left Behind #1)','Tim Lahaye','2000','Tyndale House Publishers','http://images.amazon.com/images/P/0842342702.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('440225701','The Street Lawyer','JOHN GRISHAM','1999','Dell','http://images.amazon.com/images/P/0440225701.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60914068','Love, Medicine and Miracles','M.D. Bernie S. Siegel','1988','HarperCollins Publishers','http://images.amazon.com/images/P/0060914068.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('156047624','All the King''s Men','Robert Penn Warren','1982','Harvest Books','http://images.amazon.com/images/P/0156047624.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('245542957','Pacific Northwest','Hans Johannes Hoefer','1985','Chambers Harrap Publishers Ltd','http://images.amazon.com/images/P/0245542957.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('380715899','A Soldier of the Great War','Mark Helprin','1992','Avon Books','http://images.amazon.com/images/P/0380715899.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('553280333','Getting Well Again','O. Carol Simonton Md','1992','Bantam','http://images.amazon.com/images/P/0553280333.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('961769947','Northwest Wines and Wineries','Chuck Hill','1993','Speed Graphics','http://images.amazon.com/images/P/0961769947.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('964778319','An Atmosphere of Eternity: Stories of India','David Iglehart','2002','Sunflower Press','http://images.amazon.com/images/P/0964778319.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671623249','LONESOME DOVE','Larry McMurtry','1986','Pocket','http://images.amazon.com/images/P/0671623249.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('679810307','Shabanu: Daughter of the Wind (Border Trilogy)','SUZANNE FISHER STAPLES','1991','Laurel Leaf','http://images.amazon.com/images/P/0679810307.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('679865691','Haveli (Laurel Leaf Books)','SUZANNE FISHER STAPLES','1995','Laurel Leaf','http://images.amazon.com/images/P/0679865691.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('2070423204','Lieux dits','Michel Tournier','2002','Gallimard','http://images.amazon.com/images/P/2070423204.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345260317','The Dragons of Eden: Speculations on the Evolution of Human Intelligence','Carl Sagan','1978','Ballantine Books','http://images.amazon.com/images/P/0345260317.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('394743741','The yawning heights','Aleksandr Zinoviev','1980','Random House','http://images.amazon.com/images/P/0394743741.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('042511774X','Breathing Lessons','Anne Tyler','1994','Berkley Publishing Group','http://images.amazon.com/images/P/042511774X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('804106304','The Joy Luck Club','Amy Tan','1994','Prentice Hall (K-12)','http://images.amazon.com/images/P/0804106304.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1853262404','Heart of Darkness (Wordsworth Collection)','Joseph Conrad','1998','NTC/Contemporary Publishing Company','http://images.amazon.com/images/P/1853262404.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('312970242','The Angel Is Near','Deepak Chopra','2000','St. Martin''s Press','http://images.amazon.com/images/P/0312970242.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1853260053','Tess of the D''Urbervilles (Wordsworth Classics)','Thomas Hardy','1997','NTC/Contemporary Publishing Company','http://images.amazon.com/images/P/1853260053.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1414035004','The Adventures of Drew and Ellie: The Magical Dress','Charles Noland','2003','1stBooks Library','http://images.amazon.com/images/P/1414035004.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60938412','The Accidental Virgin','Valerie Frankel','2003','Avon Trade','http://images.amazon.com/images/P/0060938412.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('140067477','The Tao of Pooh','Benjamin Hoff','1983','Penguin Books','http://images.amazon.com/images/P/0140067477.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345465083','Seabiscuit','LAURA HILLENBRAND','2003','Ballantine Books','http://images.amazon.com/images/P/0345465083.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451625889','The Prince','Niccolo Machiavelli','1952','Signet Book','http://images.amazon.com/images/P/0451625889.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1558531025','Life''s Little Instruction Book (Life''s Little Instruction Books (Paperback))','H. Jackson Brown','1991','Thomas Nelson','http://images.amazon.com/images/P/1558531025.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('441783589','Starship Troopers','Robert A. Heinlein','1987','Ace Books','http://images.amazon.com/images/P/0441783589.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('394895894','The Ruby in the Smoke (Sally Lockhart Trilogy, Book 1)','PHILIP PULLMAN','1988','Laurel Leaf','http://images.amazon.com/images/P/0394895894.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1569871213','Black Beauty (Illustrated Classics)','Anna Sewell','1995','Landoll','http://images.amazon.com/images/P/1569871213.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375410538','Anil''s Ghost','MICHAEL ONDAATJE','2000','Knopf','http://images.amazon.com/images/P/0375410538.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('966986105','Prescription for Terror','Sandra Levy Ceren','1999','Andrew Scott Publishers','http://images.amazon.com/images/P/0966986105.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('087113375X','Modern Manners: An Etiquette Book for Rude People','P.J. O''Rourke','1990','Atlantic Monthly Press','http://images.amazon.com/images/P/087113375X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('340767936','Turning Thirty','Mike Gayle','2000','Hodder &amp; Stoughton General Division','http://images.amazon.com/images/P/0340767936.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('743403843','Decipher','Stel Pavlou','2002','Simon &amp; Schuster (Trade Division)','http://images.amazon.com/images/P/0743403843.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60930365','My First Cousin Once Removed: Money, Madness, and the Family of Robert Lowell','Sarah Payne Stuart','1999','Perennial','http://images.amazon.com/images/P/0060930365.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60177586','Standing Firm: A Vice-Presidential Memoir','Dan Quayle','1994','Harpercollins','http://images.amazon.com/images/P/0060177586.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('71416331','Team Bush : Leadership Lessons from the Bush White House','Donald F. Kettl','2003','McGraw-Hill','http://images.amazon.com/images/P/0071416331.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375509038','The Right Man : The Surprise Presidency of George W. Bush','DAVID FRUM','2003','Random House','http://images.amazon.com/images/P/0375509038.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('553062042','Daybreakers Louis Lamour Collection','Louis Lamour','1981','Bantam Doubleday Dell','http://images.amazon.com/images/P/0553062042.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('316769487','The Catcher in the Rye','J.D. Salinger','1991','Little, Brown','http://images.amazon.com/images/P/0316769487.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('8445071408','El Senor De Los Anillos: LA Comunidad Del Anillo (Lord of the Rings (Spanish))','J. R. R. Tolkien','2001','Minotauro','http://images.amazon.com/images/P/8445071408.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('8445071769','El Senor De Los Anillos: Las DOS Torres (Lord of the Rings (Paperback))','J. R. R. Tolkien','2001','Minotauro','http://images.amazon.com/images/P/8445071769.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('8445071777','El Senor De Los Anillos: El Retorno Del Rey (Tolkien, J. R. R. Lord of the Rings. 3.)','J. R. R. Tolkien','2001','Distribooks','http://images.amazon.com/images/P/8445071777.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('679429220','Midnight in the Garden of Good and Evil: A Savannah Story','John Berendt','1994','Random House','http://images.amazon.com/images/P/0679429220.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671867156','Pretend You Don''t See Her','Mary Higgins Clark','1998','Pocket','http://images.amazon.com/images/P/0671867156.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('312252617','Fast Women','Jennifer Crusie','2001','St. Martin''s Press','http://images.amazon.com/images/P/0312252617.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('312261594','Female Intelligence','Jane Heller','2001','St. Martin''s Press','http://images.amazon.com/images/P/0312261594.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('316748641','Pasquale''s Nose: Idle Days in an Italian Town','Michael Rips','2002','Back Bay Books','http://images.amazon.com/images/P/0316748641.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('316973742','The Gospel of Judas: A Novel','Simon Mawer','2002','Back Bay Books','http://images.amazon.com/images/P/0316973742.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('385235941','Prize Stories, 1987: The O''Henry Awards','William Abrahams','1987','Doubleday Books','http://images.amazon.com/images/P/0385235941.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('446677450','Rich Dad, Poor Dad: What the Rich Teach Their Kids About Money--That the Poor and Middle Class Do Not!','Robert T. Kiyosaki','2000','Warner Books','http://images.amazon.com/images/P/0446677450.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451166892','The Pillars of the Earth','Ken Follett','1996','Signet Book','http://images.amazon.com/images/P/0451166892.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('553347594','McDonald''s: Behind the Arches','John F. Love','1995','Bantam','http://images.amazon.com/images/P/0553347594.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671621009','Creating Wealth : Retire in Ten Years Using Allen''s Seven Principles of Wealth!','Robert G. Allen','1986','Fireside','http://images.amazon.com/images/P/0671621009.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('067976397X','Corelli''s Mandolin : A Novel','LOUIS DE BERNIERES','1995','Vintage','http://images.amazon.com/images/P/067976397X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('684822733','Love, Miracles, and Animal Healing : A heartwarming look at the spiritual bond between animals and humans','Pam Proctor','1996','Fireside','http://images.amazon.com/images/P/0684822733.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('786868716','The Five People You Meet in Heaven','Mitch Albom','2003','Hyperion','http://images.amazon.com/images/P/0786868716.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('8472238822','Tu Nombre Escrito En El Agua (La Sonrisa Vertical)','Irene Gonzalez Frei','2002','Tusquets','http://images.amazon.com/images/P/8472238822.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671864769','Relics (Star Trek: The Next Generation)','Michael Jan Friedman','1992','Star Trek','http://images.amazon.com/images/P/0671864769.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671521519','Bless The Beasts And Children : Bless The Beasts And Children','Glendon Swarthout','1995','Pocket','http://images.amazon.com/images/P/0671521519.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('440222303','The Touch of Your Shadow, the Whisper of Your Name (Babylon 5, Book 5)','Neal Barrett Jr.','1996','Dell','http://images.amazon.com/images/P/0440222303.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('312953453','Blood Oath','David Morrell','1994','St. Martin''s Press','http://images.amazon.com/images/P/0312953453.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('446608653','The Alibi','Sandra Brown','2000','Warner Books','http://images.amazon.com/images/P/0446608653.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('446612545','The Beach House','James Patterson','2003','Warner Books','http://images.amazon.com/images/P/0446612545.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('446612618','A Kiss Remembered','Sandra Brown','2003','Warner Books','http://images.amazon.com/images/P/0446612618.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451208080','The Short Forever','Stuart Woods','2003','Signet Book','http://images.amazon.com/images/P/0451208080.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('553584383','Dead Aim','IRIS JOHANSEN','2004','Bantam Books','http://images.amazon.com/images/P/0553584383.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671027360','Angels &amp; Demons','Dan Brown','2001','Pocket Star','http://images.amazon.com/images/P/0671027360.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('812575954','The Deal','Joe Hutsko','2000','Tor Books (Mm)','http://images.amazon.com/images/P/0812575954.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('316735736','All He Ever Wanted: A Novel','Anita Shreve','2004','Back Bay Books','http://images.amazon.com/images/P/0316735736.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('743439740','Every Breath You Take : A True Story of Obsession, Revenge, and Murder','Ann Rule','2002','Pocket','http://images.amazon.com/images/P/0743439740.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345372700','If I Ever Get Back to Georgia, I''m Gonna Nail My Feet to the Ground','LEWIS GRIZZARD','1991','Ballantine Books','http://images.amazon.com/images/P/0345372700.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('380619458','The Mosquito Coast','Paul Theroux','1990','Harper Mass Market Paperbacks (Mm)','http://images.amazon.com/images/P/0380619458.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('446325805','If Love Were Oil, I''d Be About a Quart Low','Lewis Grizzard','1994','Warner Books (Mm)','http://images.amazon.com/images/P/0446325805.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451406923','Goodbye, My Little Ones: The True Story of a Murderous Mother and Five Innocent Victims','Charles Hickey','1996','Onyx Books','http://images.amazon.com/images/P/0451406923.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671042858','The Girl Who Loved Tom Gordon','Stephen King','2000','Pocket','http://images.amazon.com/images/P/0671042858.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('743249992','Bringing Down the House: The Inside Story of Six M.I.T. Students Who Took Vegas for Millions','Ben Mezrich','2003','Free Press','http://images.amazon.com/images/P/0743249992.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('840734530','The Oneprince (The Redaemian Chronicles, Book 1)','Bill Hand','1992','Thomas Nelson Inc','http://images.amazon.com/images/P/0840734530.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('425184226','The Sum of All Fears','Tom Clancy','2002','Berkley Publishing Group','http://images.amazon.com/images/P/0425184226.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375500766','Care Packages : Letters to Christopher Reeve from Strangers and Other Friends','DANA REEVE','1999','Random House','http://images.amazon.com/images/P/0375500766.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('9724119378','O Deus Das Pequenas Coisas','Roy','1998','Edicoes Asa','http://images.amazon.com/images/P/9724119378.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451205197','Lady in Green/Minor Indiscretions (Signet Regency Romance)','Barbara Metzger','2002','Signet Book','http://images.amazon.com/images/P/0451205197.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60929790','One Hundred Years of Solitude','Gabriel Garcia Marquez','1998','Perennial','http://images.amazon.com/images/P/0060929790.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60976845','Little Altars Everywhere: A Novel','Rebecca Wells','1996','Perennial','http://images.amazon.com/images/P/0060976845.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('61099325','Coyote Waits (Joe Leaphorn/Jim Chee Novels)','Tony Hillerman','1992','HarperTorch','http://images.amazon.com/images/P/0061099325.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671004573','Before I Say Good-Bye','Mary Higgins Clark','2001','Pocket','http://images.amazon.com/images/P/0671004573.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('446601640','Slow Waltz in Cedar Bend','Robert James Waller','1994','Warner Books','http://images.amazon.com/images/P/0446601640.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('330484516','Twenty Minute Retreats: Revive Your Spirits in Just Minutes a Day (A Pan Self-discovery Title)','Rachel Harris','2001','Pan Macmillan','http://images.amazon.com/images/P/0330484516.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('038572179X','Atonement : A Novel','IAN MCEWAN','2003','Anchor','http://images.amazon.com/images/P/038572179X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('393020371','Next: The Future Just Happened','Michael Lewis','2001','W.W. Norton &amp; Company','http://images.amazon.com/images/P/0393020371.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1900850303','The Angelic Darkness','Richard Zimler','1999','Arcadia Books','http://images.amazon.com/images/P/1900850303.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1903019699','The Soulbane Stratagem','Norman Jetmundsen','2000','John Hunt Publishing, Ltd.','http://images.amazon.com/images/P/1903019699.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345425294','Gangster','Lorenzo Carcaterra','2002','Fawcett Books','http://images.amazon.com/images/P/0345425294.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451410319','Hush','Anne Frasier','2002','Onyx Books','http://images.amazon.com/images/P/0451410319.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('553583468','Whisper of Evil (Hooper, Kay. Evil Trilogy.)','Kay Hooper','2002','Bantam Books','http://images.amazon.com/images/P/0553583468.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('8420639133','Temor y Temblor','Soren Kierkegaard','2001','Alianza','http://images.amazon.com/images/P/8420639133.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('8476409419','Estudios sobre el amor','Jose Ortega Y Gaset','2001','Downtown Book Center','http://images.amazon.com/images/P/8476409419.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('380778556','Rebecca','Daphne Du Maurier','1994','Avon','http://images.amazon.com/images/P/0380778556.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451525221','Scarlet Letter','Nathaniel Hawthorne','1993','Signet Book','http://images.amazon.com/images/P/0451525221.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('2740230','Keep It Simple: And Get More Out of Life','Nick Page','1999','Trafalgar Square','http://images.amazon.com/images/P/0002740230.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('385336772','Diary of a Mad Mom-To-Be','Laura Wolf','2003','Delta','http://images.amazon.com/images/P/0385336772.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('440949424','Locked in Time (Laurel Leaf Books)','LOIS DUNCAN','1986','Laure Leaf','http://images.amazon.com/images/P/0440949424.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('505524996','Contact','Susan Grant','2002','Love Spell','http://images.amazon.com/images/P/0505524996.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('140252800','The Brimstone Wedding','Barbara Vine','1997','Penguin Books Ltd','http://images.amazon.com/images/P/0140252800.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451452755','The Catswold Portal','Shirley Rousseau Murphy','1993','Roc','http://images.amazon.com/images/P/0451452755.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('812575482','Through Wolf''s Eyes (Wolf)','Jane Lindskold','2002','Tor Fantasy','http://images.amazon.com/images/P/0812575482.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('044651747X','Puerto Vallarta Squeeze','Robert James Waller','1995','Warner Books','http://images.amazon.com/images/P/044651747X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60801263','Tree Grows In Brooklyn','Betty Smith','1988','Harpercollins Publisher','http://images.amazon.com/images/P/0060801263.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('61030147','Cybill Disobedience: How I Survived Beauty Pageants, Elvis, Sex, Bruce Willis, Lies, Marriage, Motherhood, Hollywood, and the Irrepressible Urge to Say What I Think','Cybill Shepherd','2001','Avon Books','http://images.amazon.com/images/P/0061030147.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('140250964','Snow Angels','Stewart O''Nan','1995','Penguin Books','http://images.amazon.com/images/P/0140250964.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('446527165','Wish You Well','David Baldacci','2000','Warner Books','http://images.amazon.com/images/P/0446527165.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671461494','The Hitchhiker''s Guide to the Galaxy','Douglas Adams','1982','Pocket','http://images.amazon.com/images/P/0671461494.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('385337639','Crow Lake (Today Show Book Club #7)','Mary Lawson','2003','Delta','http://images.amazon.com/images/P/0385337639.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('039575514X','My Antonia','Willa Cather','1995','Mariner Books','http://images.amazon.com/images/P/039575514X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451206673','Pen Pals','Olivia Goldsmith','2002','Signet Book','http://images.amazon.com/images/P/0451206673.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('330332775','Bridget Jones''s Diary','Helen Fielding','1997','Picador (UK)','http://images.amazon.com/images/P/0330332775.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('486284735','Pride and Prejudice (Dover Thrift Editions)','Jane Austen','1995','Dover Publications','http://images.amazon.com/images/P/0486284735.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671021745','EYE ON CRIME: HARDY BOYS #153','Franklin W. Dixon','1998','Aladdin','http://images.amazon.com/images/P/0671021745.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671047612','Skin And Bones','Franklin W. Dixon','2000','Aladdin','http://images.amazon.com/images/P/0671047612.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671504282','LAW OF THE JUNGLE (HARDY BOYS CASE FILE 105) : LAW OF THE JUNGLE (Hardy Boys, The)','Franklin W. Dixon','1995','Simon Pulse','http://images.amazon.com/images/P/0671504282.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('399138684','The Cat Who Came to Breakfast (Cat Who... (Hardcover))','Lilian Jackson Braun','1994','Putnam Pub Group','http://images.amazon.com/images/P/0399138684.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('785263292','If Singleness Is a Gift, What''s the Return Policy?','Holly Virden','2003','Nelson Books','http://images.amazon.com/images/P/0785263292.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('830714014','Always Daddy''s Girl: Understanding Your Father''s Impact on Who You Are','H. Norman Wright','1989','Regal Books','http://images.amazon.com/images/P/0830714014.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345354931','Night Mare (Xanth Novels (Paperback))','Piers Anthony','1990','Del Rey Books','http://images.amazon.com/images/P/0345354931.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('553278223','The Martian Chronicles','RAY BRADBURY','1984','Spectra','http://images.amazon.com/images/P/0553278223.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3150000335','Kabale Und Liebe','Schiller','0','Philipp Reclam, Jun Verlag GmbH','http://images.amazon.com/images/P/3150000335.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3257203659','Der illustrierte Mann. Erz�?¤hlungen.','Ray Bradbury','2002','Diogenes','http://images.amazon.com/images/P/3257203659.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3257207522','Der K�?¶nig in Gelb.','Raymond Chandler','1980','Diogenes Verlag','http://images.amazon.com/images/P/3257207522.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3257208626','Fahrenheit 451','Ray Bradbury','1994','Distribooks Inc','http://images.amazon.com/images/P/3257208626.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3257208634','Die Mars- Chroniken. Roman in Erz�?¤hlungen.','Ray Bradbury','1981','Diogenes Verlag','http://images.amazon.com/images/P/3257208634.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3257208669','Das B�?¶se kommt auf leisen Sohlen.','Ray Bradbury','2003','Diogenes','http://images.amazon.com/images/P/3257208669.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3257210450','L�?¶wenzahnwein. Roman.','Ray Bradbury','1999','Diogenes Verlag','http://images.amazon.com/images/P/3257210450.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3257212054','Das Kind von morgen. Erz�?¤hlungen.','Ray Bradbury','2000','Diogenes Verlag','http://images.amazon.com/images/P/3257212054.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3257212429','Die Mechanismen der Freude. Erz�?¤hlungen.','Ray Bradbury','2000','Diogenes Verlag','http://images.amazon.com/images/P/3257212429.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3257214154','Familientreffen. Erz�?¤hlungen.','Ray Bradbury','2000','Diogenes Verlag','http://images.amazon.com/images/P/3257214154.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3257216416','Der Tod kommt schnell in Mexico. Erz�?¤hlungen.','Ray Bradbury','1988','Diogenes Verlag','http://images.amazon.com/images/P/3257216416.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3257233051','Veronika Deschliesst Zu Sterben / Vernika Decides to Die','Paolo Coelho','2002','Distribooks','http://images.amazon.com/images/P/3257233051.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('342311360X','Die Liebe in Den Zelten','Gabriel Garcia Marquez','0','Deutscher Taschenbuch Verlag (DTV)','http://images.amazon.com/images/P/342311360X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3423116714','Die Klone der Joanna May. Roman.','Fay Weldon','1993','Dtv','http://images.amazon.com/images/P/3423116714.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3423241489','Ist mein Hintern wirklich so dick? Tagebuch einer empfindsamen Frau.','Arabella Weir','1998','Dtv','http://images.amazon.com/images/P/3423241489.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3426605686','Haifischfrauen.','Kiana Davenport','1996','Droemersche Verlagsanstalt Th. Knaur Nachf., GmbH &amp; Co.','http://images.amazon.com/images/P/3426605686.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3453212150','Die Cappuccino- Jahre. Aus dem Tagebuch des Adrian Mole.','Sue Townsend','2002','Heyne','http://images.amazon.com/images/P/3453212150.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3462021095','Schwarzer Tee mit drei Stück Zucker','Renan Demirkan','1991','Kiepenheuer &amp; Witsch','http://images.amazon.com/images/P/3462021095.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3492045642','Quersch�?¼sse - Downsize This!','Michael Moore','2003','Piper','http://images.amazon.com/images/P/3492045642.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3498020862','Die Korrekturen.','Jonathan Franzen','2002','Rowohlt, Reinbek','http://images.amazon.com/images/P/3498020862.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3499110695','Neun Erz�?¤hlungen.','Jerome D. Salinger','1968','Rowohlt Tb.','http://images.amazon.com/images/P/3499110695.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3499151502','Hebt den Dachbalken hoch, Zimmerleute / Seymour wird vorgestellt.','Jerome D. Salinger','1998','Rowohlt Tb.','http://images.amazon.com/images/P/3499151502.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3518111000','Ulysses (�?�?bersetzg. Wollschl�?¤ger). ( Neue Folge, 100).','James Joyce','1981','Suhrkamp','http://images.amazon.com/images/P/3518111000.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3548254268','Eine ganz normale Aff�?¤re.','Joanna Trollope','2002','Ullstein Tb','http://images.amazon.com/images/P/3548254268.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3570300099','Das Intimleben des Adrian Mole, 13 3/4 Jahre. cbt. ( Ab 14 J.).','Sue Townsend','2002','Bertelsmann, M�?¼nchen','http://images.amazon.com/images/P/3570300099.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('3596292646','Das Buch der l�?¤cherlichen Liebe.','Milan Kundera','2000','Fischer (Tb.), Frankfurt','http://images.amazon.com/images/P/3596292646.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60977493','The God of Small Things','Arundhati Roy','1998','Perennial','http://images.amazon.com/images/P/0060977493.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('312872682','The James Dean Affair: A Neil Gulliver &amp; Stevie Marriner Novel','Robert S. Levinson','2000','St Martins Pr','http://images.amazon.com/images/P/0312872682.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('316602906','The Big Bad Wolf: A Novel','James Patterson','2003','Little, Brown','http://images.amazon.com/images/P/0316602906.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('316693006','Four Blind Mice','James Patterson','2002','Little, Brown','http://images.amazon.com/images/P/0316693006.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345311396','Private Screening','Richard North Patterson','1994','Ballantine Books','http://images.amazon.com/images/P/0345311396.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345378490','Congo','Michael Crichton','1995','Ballantine Books','http://images.amazon.com/images/P/0345378490.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345404793','Protect and Defend','Richard North Patterson','2001','Ballantine Books','http://images.amazon.com/images/P/0345404793.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('345433173','The Tall Pine Polka','Lorna Landvik','1999','Ballantine Books','http://images.amazon.com/images/P/0345433173.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375400117','Memoirs of a Geisha','Arthur Golden','1997','Alfred A. Knopf','http://images.amazon.com/images/P/0375400117.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375705856','Plainsong (Vintage Contemporaries)','KENT HARUF','2000','Vintage','http://images.amazon.com/images/P/0375705856.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('380717018','Body of Evidence (Kay Scarpetta Mysteries (Paperback))','Patricia D. Cornwell','1992','Avon','http://images.amazon.com/images/P/0380717018.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('380718332','All That Remains (Kay Scarpetta Mysteries (Paperback))','Patricia D. Cornwell','1993','Avon','http://images.amazon.com/images/P/0380718332.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('380754509','The Case of the Lost Look-Alike (An Avon Camelot Book)','Carol J. Farley','1988','Avon Books','http://images.amazon.com/images/P/0380754509.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('038076654X','Petals on the River','Kathleen E. Woodiwiss','1997','Avon Trade','http://images.amazon.com/images/P/038076654X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('380807866','The Elusive Flame','Kathleen E. Woodiwiss','1999','Avon','http://images.amazon.com/images/P/0380807866.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('385316895','Legacy of Silence','Belva Plain','1998','Bantam Dell Pub Group','http://images.amazon.com/images/P/0385316895.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('385497466','The Brethren','JOHN GRISHAM','2000','Doubleday','http://images.amazon.com/images/P/0385497466.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('385508042','The King of Torts','John Grisham','2003','Doubleday Books','http://images.amazon.com/images/P/0385508042.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('385509456','The Curious Incident of the Dog in the Night-Time : A Novel','MARK HADDON','2003','Doubleday','http://images.amazon.com/images/P/0385509456.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('385511612','Bleachers','John Grisham','2003','Doubleday','http://images.amazon.com/images/P/0385511612.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('385730586','Sisterhood of the Traveling Pants','ANN BRASHARES','2003','Delacorte Books for Young Readers','http://images.amazon.com/images/P/0385730586.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('425164403','Only Love (Magical Love)','Erich Segal','1998','Berkley Publishing Group','http://images.amazon.com/images/P/0425164403.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('440234964','All or Nothing (Wheeler Large Print Books)','Elizabeth Adler','2000','Island','http://images.amazon.com/images/P/0440234964.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('446605484','Roses Are Red (Alex Cross Novels)','James Patterson','2001','Warner Vision','http://images.amazon.com/images/P/0446605484.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('446610399','The Rescue','Nicholas Sparks','2001','Warner Books','http://images.amazon.com/images/P/0446610399.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('449006522','Manhattan Hunt Club','JOHN SAUL','2002','Ballantine Books','http://images.amazon.com/images/P/0449006522.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('449911004','Patty Jane''s House of Curl (Ballantine Reader''s Circle)','LORNA LANDVIK','1996','Ballantine Books','http://images.amazon.com/images/P/0449911004.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451162072','Pet Sematary','Stephen King','1994','Signet Book','http://images.amazon.com/images/P/0451162072.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451186648','Silent Snow','Steve Thayer','2000','Signet Book','http://images.amazon.com/images/P/0451186648.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('452282152','Girl with a Pearl Earring','Tracy Chevalier','2001','Plume Books','http://images.amazon.com/images/P/0452282152.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('051513290X','Summer of Storms','Judith Kelman','2002','Jove Books','http://images.amazon.com/images/P/051513290X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('553580388','The Patient','Michael Palmer','2001','Bantam Books','http://images.amazon.com/images/P/0553580388.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('590598848','Demona''s Revenge (Gargoyles, No. 2)','Francine Hughes','1995','Scholastic','http://images.amazon.com/images/P/0590598848.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('590629719','Clifford''s Sports Day','Norman Bridwell','1996','Scholastic','http://images.amazon.com/images/P/0590629719.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671023616','Postmortem (Kay Scarpetta Mysteries (Paperback))','Patricia Cornwell','1998','Pocket','http://images.amazon.com/images/P/0671023616.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('671027387','Deception Point','Dan Brown','2002','Pocket','http://images.amazon.com/images/P/0671027387.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('684848783','Tis : A Memoir','Frank McCourt','1999','Scribner','http://images.amazon.com/images/P/0684848783.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('743486226','Angels &amp; Demons','Dan Brown','2003','Atria','http://images.amazon.com/images/P/0743486226.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('786863986','A Monk Swimming','Malachy McCourt','1998','Hyperion','http://images.amazon.com/images/P/0786863986.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('803251718','Crazy Horse','Mari Sandoz','1961','University of Nebraska Press','http://images.amazon.com/images/P/0803251718.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('804117934','The Silent Cry (William Monk Novels (Paperback))','Anne Perry','1998','Ivy Books','http://images.amazon.com/images/P/0804117934.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('140003180X','The Kalahari Typing School for Men (No. 1 Ladies'' Detective Agency)','ALEXANDER MCCALL SMITH','2004','Anchor','http://images.amazon.com/images/P/140003180X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('155874262X','Chicken Soup for the Soul (Chicken Soup for the Soul)','Jack Canfield','1993','Health Communications','http://images.amazon.com/images/P/155874262X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60987103','Wicked: The Life and Times of the Wicked Witch of the West','Gregory Maguire','1996','Regan Books','http://images.amazon.com/images/P/0060987103.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('151008116','Life of Pi','Yann Martel','2002','Harcourt','http://images.amazon.com/images/P/0151008116.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375704965','A Judgement in Stone','Ruth Rendell','2000','Vintage Books USA','http://images.amazon.com/images/P/0375704965.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('525947647','Lies and the Lying Liars Who Tell Them: A Fair and Balanced Look at the Right','Al Franken','2003','Dutton Books','http://images.amazon.com/images/P/0525947647.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('804111359','Secret History','DONNA TARTT','1993','Ballantine Books','http://images.amazon.com/images/P/0804111359.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('1558744150','Chicken Soup for the Woman''s Soul (Chicken Soup for the Soul Series (Paper))','Jack Canfield','1996','Health Communications','http://images.amazon.com/images/P/1558744150.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('435272683','Great Expectations (Heinemann Guided Readers)','John Milne','1995','Delta Systems','http://images.amazon.com/images/P/0435272683.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('316782505','The Weight of Water','Anita Shreve','2001','Little, Brown','http://images.amazon.com/images/P/0316782505.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('006102063X','Moving Pictures (Discworld Novels (Paperback))','Terry Pratchett','2002','HarperTorch','http://images.amazon.com/images/P/006102063X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60013117','Night Watch','Terry Pratchett','2002','HarperCollins','http://images.amazon.com/images/P/0060013117.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60199563','Thief of Time','Terry Pratchett','2001','HarperCollins Publishers','http://images.amazon.com/images/P/0060199563.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('006052779X','Charlotte''s Web Book and Charm (Charming Classics)','E. B. White','2003','HarperFestival','http://images.amazon.com/images/P/006052779X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60563079','Peter Pan: The Original Story (Peter Pan)','J. M. Barrie','2003','HarperFestival','http://images.amazon.com/images/P/0060563079.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('60809027','My Friend Flicka','Mary O''Hara','1988','Perennial','http://images.amazon.com/images/P/0060809027.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('61040967','The Last Hero : A Discworld Fable (Discworld Novels (Hardcover))','Terry Pratchett','2001','HarperCollins','http://images.amazon.com/images/P/0061040967.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('61050474','Jingo: A Discworld Novel (Discworld Series/Terry Pratchett)','Terry Pratchett','1998','HarperPrism','http://images.amazon.com/images/P/0061050474.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('61052515','Maskerade: A Novel of Discworld (Pratchett, Terry. Discworld Series (New York, N.Y.).)','Terry Pratchett','1997','HarperPrism','http://images.amazon.com/images/P/0061052515.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('61052523','Interesting Times: A Novel of Discworld','Terry Pratchett','1997','Harpercollins','http://images.amazon.com/images/P/0061052523.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('64472264','On the Bright Side, I''m Now the Girlfriend of a Sex God: Further Confessions of Georgia Nicolson','Louise Rennison','2002','HarperTempest','http://images.amazon.com/images/P/0064472264.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('140620664','Mansfield Park (Penguin Popular Classics)','Jane Austen','1994','Penguin Books Ltd','http://images.amazon.com/images/P/0140620664.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('312148267','The Wind in the Willows','Kenneth Grahame','1996','St. Martin''s Press','http://images.amazon.com/images/P/0312148267.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('312156960','The Winter King: A Novel of Arthur (The Warlord Chronicles: I)','Bernard Cornwell','1997','St. Martin''s Griffin','http://images.amazon.com/images/P/0312156960.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('312890044','Moonheart (Newford)','Charles de Lint','1994','Orb Books','http://images.amazon.com/images/P/0312890044.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('034543191X','The King of Elfland''s Daughter (Del Rey Impact)','Edward John Moreton Drax Plunkett Dunsany','1999','Del Rey Books','http://images.amazon.com/images/P/034543191X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('373836023','Powder and Patch','Georgette Heyer','2004','Harlequin','http://images.amazon.com/images/P/0373836023.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375751513','The Picture of Dorian Gray (Modern Library (Paperback))','OSCAR WILDE','1998','Modern Library','http://images.amazon.com/images/P/0375751513.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375801677','The Iron Giant','Ted Hughes','1999','Knopf Books for Young Readers','http://images.amazon.com/images/P/0375801677.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375814248','James and the Giant Peach','ROALD DAHL','2002','Knopf Books for Young Readers','http://images.amazon.com/images/P/0375814248.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375823352','The Amber Spyglass (His Dark Materials, Book 3)','PHILIP PULLMAN','2002','Knopf Books for Young Readers','http://images.amazon.com/images/P/0375823352.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('037582345X','The Golden Compass (His Dark Materials, Book 1)','PHILIP PULLMAN','2002','Knopf Books for Young Readers','http://images.amazon.com/images/P/037582345X.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('375823468','The Subtle Knife (His Dark Materials, Book 2)','PHILIP PULLMAN','2002','Knopf Books for Young Readers','http://images.amazon.com/images/P/0375823468.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('380730448','The Adrian Mole Diaries : The Secret Diary of Adrian Mole, Aged 13 3/4 : The Growing Pains of Adrian Mole','Sue Townsend','1997','Perennial','http://images.amazon.com/images/P/0380730448.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('380973839','Martian Chronicles','Ray Bradbury','1997','William Morrow','http://images.amazon.com/images/P/0380973839.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('385327773','The Great God Pan','Donna Jo Napoli','2003','Wendy Lamb Books','http://images.amazon.com/images/P/0385327773.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('394586239','Possession: A Romance','A. S. Byatt','1990','Random House Inc','http://images.amazon.com/images/P/0394586239.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('439510112','Born Confused','Tanuja Desai Hidier','2003','Push','http://images.amazon.com/images/P/0439510112.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('440241413','Confessions of a Shopaholic','SOPHIE KINSELLA','2003','Dell','http://images.amazon.com/images/P/0440241413.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451409256','Making Minty Malone','Isabel Wolff','2000','Onyx Books','http://images.amazon.com/images/P/0451409256.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451523415','Little Women (Signet Classic)','Louisa May Alcott','1988','Signet Classics','http://images.amazon.com/images/P/0451523415.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451526279','Emma (Signet Classics (Paperback))','Jane Austen','1996','Signet Classics','http://images.amazon.com/images/P/0451526279.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('451526341','Animal Farm','George Orwell','2004','Signet','http://images.amazon.com/images/P/0451526341.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('486415864','Great Expectations (Dover Thrift Editions)','Charles Dickens','2001','Dover Publications','http://images.amazon.com/images/P/0486415864.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('553280589','Eva Luna','Isabel Allende','1989','Bantam Books','http://images.amazon.com/images/P/0553280589.01.THUMBZZZ.jpg');
INSERT INTO Libro(isbn,titolo,autore,anno_pubb,casaEditrice,immagine) VALUES ('571197639','Poisonwood Bible Edition Uk','Barbara Kingsolver','0','Faber Faber Inc','http://images.amazon.com/images/P/0571197639.01.THUMBZZZ.jpg');
