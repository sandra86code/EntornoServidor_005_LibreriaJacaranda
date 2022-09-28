
-- DataBase LibreriaJacaranda

-- Users table

CREATE TABLE users
(
userCod VARCHAR(20),
pasword	VARCHAR(10),

CONSTRAINT pk_users PRIMARY KEY (userCod)
);


CREATE TABLE articles (
isbn VARCHAR(10),
title VARCHAR(50),
author VARCHAR(50),
published_date DATE,
quantity INTEGER,
price DECIMAL(5,2),
stock TINYINT(1),

CONSTRAINT pk_articles PRIMARY KEY (isbn)
);


-- Adding users 

INSERT INTO users  VALUES ('ChiselaC', 'adm1');
INSERT INTO users  VALUES ('NadiaC', 'adm2');
INSERT INTO users  VALUES ('SandraR', 'adm3');
INSERT INTO users  VALUES ('User1', 'user1');

-- Adding articles


INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('0152960937','Kings of Pastry (Les rois de la pâtisserie)','Lil Sink','2020-10-21',0,47.88,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('0287344541','Road to Utopia','Bearnard Steptoe','2021-08-05',100,83.51,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('0322677696','Hollywood and The Pentagon: A Dangerous Liaison','Jeramie Base','2022-04-13',95,31.33,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('0341854743','It''s a Wonderful Afterlife','Tabitha McFayden','2022-04-17',40,12.28,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('0503969079','Hangman''s Curse','Ilyse Joselevitch','2022-09-19',50,88.22,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('0537044191','Now!','Sofia Kleinhandler','2021-08-29',0,97.62,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('054865607X','Welcome, or No Trespassing','Roxana Menear','2022-06-06',97,13.40,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('1596860561','Aningaaq','Baryram Remmer','2021-04-22',0,79.13,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('1604480653','China 9, Liberty 37 (Amore, piombo e furore)','Deidre Staneland','2021-05-14',0,38.56,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('1708487727','California Conquest','Mariya Scoffins','2020-12-19',38,58.03,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('1778193803','The Hire: Hostage','Hasheem Hundall','2022-06-23',99,21.10,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('1800977832','Comedian','Maria Flacknell','2022-09-08',0,81.03,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('1805349187','Ethan Mao','Bonni Lowcock','2020-12-07',78,89.68,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('1886620164','Great Escape: The Untold Story','Burk Keers','2020-11-29',0,64.31,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('1964626889','Camp Hell','Ferd Fidelli','2020-09-18',0,42.73,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('2005488526','Callan','Connie Fairlamb','2020-12-05',6,78.97,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('2029587486','Island of Dr. Moreau, The','Alick Dmytryk','2022-06-04',0,15.58,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('2104657342','Bible, The (a.k.a. Bible... In the Beginning, The)','Martita Joinson','2022-05-09',0,51.13,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('2231555875','Mr. Lucky','Isadore O'' Hogan','2022-06-19',28,98.38,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('2239451564','Seventh Veil, The','Katy Esslemont','2020-05-28',0,88.03,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('2276265272','Big Hit, The','Fanechka Featonby','2020-09-29',0,42.64,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('2367678601','Scooby-Doo! Camp Scare','Alphonse Dossantos','2020-03-03',0,29.46,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('2432827214','Superman III','Debi Keyser','2020-05-19',0,79.83,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('2679824449','Public Access','Addie Vanini','2020-11-17',98,29.94,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('2744295825','What If','Gilberto Avramovsky','2020-12-19',49,90.58,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('2766835482','Cathy Come Home','Cam Scowcraft','2020-08-11',0,70.27,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('278564722X','10 MPH','Stanfield Brogi','2021-05-27',63,69.59,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('283504793X','Fortress 2','Marrilee Jasiak','2021-05-06',61,76.86,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('2924124646','Woodsman and the Rain (Kitsutsuki to ame)','Julieta Partener','2021-07-26',34,70.90,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3010737351','Snipes','Bondy Pilkington','2020-09-20',6,40.70,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3124125711','Heart of a Dog (Sobachye serdtse)','Morna Wildman','2020-02-02',0,71.72,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3153216673','Carson City','Crichton Woodhall','2022-05-21',0,19.05,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3183667134','Paz!','Bob Fransson','2022-01-18',28,3.73,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3187848295','Jacky in the Kingdom of Women','Haroun Wasiel','2022-09-14',0,60.10,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3206082480','Dreamchild','Cori Dudbridge','2021-10-27',42,7.58,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3441758196','Decoys 2: Alien Seduction ','Brigida Findlay','2021-04-12',97,4.95,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3546314719','Now You See Him, Now You Don''t','Carly Cardenosa','2021-05-02',94,50.28,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('362740324X','Shadowlands','Kirsti Pregal','2021-09-03',0,47.11,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3644496137','Born to Fight','Constancy Cramer','2022-05-12',42,31.49,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3679348797','Shutter','Veriee Bladge','2021-02-01',0,35.90,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3681221367','Italian Job, The','Godiva Orhtmann','2022-07-01',0,60.59,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3812321483','Frankie Starlight','Lurette Kilrow','2021-11-14',0,50.63,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3935774303','Waiting for Superman','Gayelord Jameson','2022-08-23',0,91.49,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3949814132','Alice in Wonderland','Hannah Ellson','2021-08-28',11,34.06,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('3955984636','From One Second to the Next','Lane Tubritt','2020-08-12',28,93.19,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('4031357635','Oldboy','Hortensia Worms','2022-09-24',0,91.19,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('4071439416','Road to Bali','Maxy Powles','2020-04-27',81,90.20,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('4085570803','Business of Being Born, The','Oby Harrald','2022-02-22',0,4.52,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('4116114693','When a Man Loves a Woman','Kennan Pfiffer','2021-08-03',80,62.47,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('4253574351','Monday','Sandy Giorgielli','2022-05-11',48,84.84,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('4268941924','Yes, Madam','Stillman Albery','2020-02-08',70,44.74,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('4449460162','Comic Book Villains','Calla Corlett','2020-06-06',0,66.79,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('4512726772','Nosferatu the Vampyre','Barny Pointing','2020-03-10',0,20.23,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('4707538614','Coming Home','Stacey Kelleway','2022-01-20',62,6.19,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('4800952506','Hitch-Hiker, The','Milzie Wisden','2020-09-15',0,97.81,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('4802999232','Ellen DeGeneres: The Beginning','Garth Halpeine','2022-08-03',0,78.71,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('4828271526','Postcards From the Edge','Frasquito Brendel','2021-11-19',28,76.71,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('5072975552','Before Night Falls','Sergent Drayn','2021-02-02',0,68.54,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('5149872881','Adventures of Picasso, The (Picassos äventyr)','Rosemaria Linturn','2021-12-05',0,61.46,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('5158176159','Please Don''t Eat the Daisies','Aime Colvin','2021-02-27',0,23.29,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('5302203863','Cowboy Bebop','Atlanta MacPaike','2021-07-08',70,18.96,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('5314148587','Karate Kid, Part II, The','Joete Didsbury','2022-02-01',0,26.90,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('5408917231','Tie Xi Qu: West of the Tracks (Tiexi qu)','Pascal Dwyr','2021-03-08',22,25.70,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('5493341743','War Photographer','Gwenni Niblock','2021-04-07',38,79.35,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('5721654929','Hustle','Lillis Brithman','2022-06-29',41,36.07,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('5773373718','The Counterfeit Coin','Ashlie Watkinson','2022-06-20',51,98.18,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('6042290398','1408','Nero Davidoff','2021-06-06',0,37.08,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('6055159354','Phantom of the Opera, The','Stephenie Shallo','2020-06-26',0,29.28,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('6364242122','Blue Kite, The (Lan feng zheng)','Jeffie Hache','2020-02-28',10,60.19,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('6382376272','Smile Like Yours, A','Sauveur Dericut','2021-08-02',7,66.86,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('6445858791','April in Paris','Marcy Lanktree','2021-03-08',0,28.66,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('6773438810','Wedding in Blood (Noces rouges, Les)','Giffie Tremmil','2021-06-15',46,5.54,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('6871225145','Square, The','Mufinella Jeanneau','2020-11-22',0,4.04,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('7012414099','Keep, The','Vally Ethersey','2020-05-09',0,28.56,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('7051081837','Two Jakes, The','Nelson Teague','2021-08-13',0,31.99,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('7194580632','Martian Child','Vere Hammerman','2020-07-31',0,80.16,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('7272023589','Specials, The','Tonye Dukesbury','2021-10-02',0,80.45,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('7370033368','Zathura','Michale Daen','2021-06-28',84,25.19,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('7493467188','Homeward Bound II: Lost in San Francisco','Lucine Sullens','2021-09-18',0,99.65,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('7592552523','Shock Corridor','Marley Sear','2020-10-23',0,8.17,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('7635119540','Another Stakeout','Clayson Tyers','2020-02-22',95,54.91,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('7637713628','Ed','Valle Alan','2020-01-23',0,72.05,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('7885666875','I Remember Mama','Susanetta Trubshaw','2020-07-05',0,85.40,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('7914704466','Cropsey','Elsinore Dillinton','2022-07-20',0,95.60,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('8134830935','Goya''s Ghosts','Noach Wooland','2021-03-21',2,47.37,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('8174954325','Trap: What Happened to Our Dream of Freedom, The','Frances Cardenas','2020-05-07',21,16.58,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('8291014183','World According to Sesame Street, The','Banky Minett','2020-01-31',47,84.67,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('8301584424','Gone Girl','Carmel Walliker','2021-08-26',75,95.56,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('8335510830','Little Lord Fauntleroy','Lorianne Webben','2021-02-01',97,20.63,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('8390426501','Pitch Black','Eartha Nobes','2022-08-08',67,87.14,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('8471698668','Bunch Of Amateurs, A','Arvie Gulland','2021-06-14',0,94.21,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('8482855597','Your Highness','Elset Kidgell','2020-01-01',98,34.13,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('8718684254','Brothers Rico, The','Emmalynn Brearty','2020-10-14',0,55.10,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('8840626549','Raiders From Beneath the Sea','Basia Iddens','2022-09-07',17,92.52,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('9114842228','This Is the Night','Martita McGettrick','2021-03-14',0,16.71,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('9286630115','Gone Baby Gone','Dolf Taylot','2020-02-15',2,16.69,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('9526106784','Creature with the Atom Brain','Nicky Tooth','2022-04-27',0,45.13,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('9716678096','Snowman, The','Hetty Hanbidge','2020-07-12',0,84.30,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('9781041307','Age of Heroes','Halli Poff','2021-03-11',0,25.16,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('9840021249','Easy','Any Scarman','2020-03-10',0,25.64,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('9885813873','Chase a Crooked Shadow','Gil Koeppke','2020-11-25',11,30.98,1);









