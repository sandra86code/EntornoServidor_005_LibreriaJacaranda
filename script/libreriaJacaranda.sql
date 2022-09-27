
-- DataBase LibreriaJacaranda

-- Users table

CREATE TABLE users
(
userCod VARCHAR(20),
pasword	VARCHAR(10),

CONSTRAINT pk_users PRIMARY KEY (userCod)
);


CREATE TABLE articles (
isbn VARCHAR(50),
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


INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('015296093-7','Kings of Pastry (Les rois de la pâtisserie)','Lil Sink','2020-10-21',0,47.88,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('028734454-1','Road to Utopia','Bearnard Steptoe','2021-08-05',100,83.51,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('032267769-6','Hollywood and The Pentagon: A Dangerous Liaison','Jeramie Base','2022-04-13',95,31.33,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('034185474-3','It''s a Wonderful Afterlife','Tabitha McFayden','2022-04-17',40,12.28,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('050396907-9','Hangman''s Curse','Ilyse Joselevitch','2022-09-19',50,88.22,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('053704419-1','Now!','Sofia Kleinhandler','2021-08-29',0,97.62,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('054865607-X','Welcome, or No Trespassing','Roxana Menear','2022-06-06',97,13.40,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('159686056-1','Aningaaq','Baryram Remmer','2021-04-22',0,79.13,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('160448065-3','China 9, Liberty 37 (Amore, piombo e furore)','Deidre Staneland','2021-05-14',0,38.56,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('170848772-7','California Conquest','Mariya Scoffins','2020-12-19',38,58.03,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('177819380-3','The Hire: Hostage','Hasheem Hundall','2022-06-23',99,21.10,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('180097783-2','Comedian','Maria Flacknell','2022-09-08',0,81.03,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('180534918-X','Ethan Mao','Bonni Lowcock','2020-12-07',78,89.68,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('188662016-4','Great Escape: The Untold Story','Burk Keers','2020-11-29',0,64.31,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('196462688-9','Camp Hell','Ferd Fidelli','2020-09-18',0,42.73,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('200548852-6','Callan','Connie Fairlamb','2020-12-05',6,78.97,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('202958748-6','Island of Dr. Moreau, The','Alick Dmytryk','2022-06-04',0,15.58,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('210465734-2','Bible, The (a.k.a. Bible... In the Beginning, The)','Martita Joinson','2022-05-09',0,51.13,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('223155587-5','Mr. Lucky','Isadore O'' Hogan','2022-06-19',28,98.38,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('223945156-4','Seventh Veil, The','Katy Esslemont','2020-05-28',0,88.03,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('227626527-2','Big Hit, The','Fanechka Featonby','2020-09-29',0,42.64,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('236767860-X','Scooby-Doo! Camp Scare','Alphonse Dossantos','2020-03-03',0,29.46,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('243282721-X','Superman III','Debi Keyser','2020-05-19',0,79.83,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('267982444-X','Public Access','Addie Vanini','2020-11-17',98,29.94,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('274429582-5','What If','Gilberto Avramovsky','2020-12-19',49,90.58,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('276683548-2','Cathy Come Home','Cam Scowcraft','2020-08-11',0,70.27,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('278564722-X','10 MPH','Stanfield Brogi','2021-05-27',63,69.59,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('283504793-X','Fortress 2','Marrilee Jasiak','2021-05-06',61,76.86,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('292412464-6','Woodsman and the Rain (Kitsutsuki to ame)','Julieta Partener','2021-07-26',34,70.90,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('301073735-1','Snipes','Bondy Pilkington','2020-09-20',6,40.70,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('312412571-1','Heart of a Dog (Sobachye serdtse)','Morna Wildman','2020-02-02',0,71.72,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('315321667-3','Carson City','Crichton Woodhall','2022-05-21',0,19.05,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('318366713-4','Paz!','Bob Fransson','2022-01-18',28,3.73,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('318784829-X','Jacky in the Kingdom of Women','Haroun Wasiel','2022-09-14',0,60.10,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('320608248-X','Dreamchild','Cori Dudbridge','2021-10-27',42,7.58,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('344175819-6','Decoys 2: Alien Seduction ','Brigida Findlay','2021-04-12',97,4.95,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('354631471-9','Now You See Him, Now You Don''t','Carly Cardenosa','2021-05-02',94,50.28,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('362740324-X','Shadowlands','Kirsti Pregal','2021-09-03',0,47.11,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('364449613-7','Born to Fight','Constancy Cramer','2022-05-12',42,31.49,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('367934879-7','Shutter','Veriee Bladge','2021-02-01',0,35.90,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('368122136-7','Italian Job, The','Godiva Orhtmann','2022-07-01',0,60.59,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('381232148-3','Frankie Starlight','Lurette Kilrow','2021-11-14',0,50.63,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('393577430-3','Waiting for Superman','Gayelord Jameson','2022-08-23',0,91.49,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('394981413-2','Alice in Wonderland','Hannah Ellson','2021-08-28',11,34.06,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('395598463-X','From One Second to the Next','Lane Tubritt','2020-08-12',28,93.19,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('403135763-X','Oldboy','Hortensia Worms','2022-09-24',0,91.19,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('407143941-6','Road to Bali','Maxy Powles','2020-04-27',81,90.20,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('408557080-3','Business of Being Born, The','Oby Harrald','2022-02-22',0,4.52,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('411611469-3','When a Man Loves a Woman','Kennan Pfiffer','2021-08-03',80,62.47,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('425357435-1','Monday','Sandy Giorgielli','2022-05-11',48,84.84,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('426894192-4','Yes, Madam','Stillman Albery','2020-02-08',70,44.74,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('444946016-2','Comic Book Villains','Calla Corlett','2020-06-06',0,66.79,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('451272677-2','Nosferatu the Vampyre','Barny Pointing','2020-03-10',0,20.23,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('470753861-4','Coming Home','Stacey Kelleway','2022-01-20',62,6.19,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('480095250-6','Hitch-Hiker, The','Milzie Wisden','2020-09-15',0,97.81,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('480299923-2','Ellen DeGeneres: The Beginning','Garth Halpeine','2022-08-03',0,78.71,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('482827152-X','Postcards From the Edge','Frasquito Brendel','2021-11-19',28,76.71,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('507297555-X','Before Night Falls','Sergent Drayn','2021-02-02',0,68.54,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('514987288-1','Adventures of Picasso, The (Picassos äventyr)','Rosemaria Linturn','2021-12-05',0,61.46,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('515817615-9','Please Don''t Eat the Daisies','Aime Colvin','2021-02-27',0,23.29,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('530220386-3','Cowboy Bebop','Atlanta MacPaike','2021-07-08',70,18.96,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('531414858-7','Karate Kid, Part II, The','Joete Didsbury','2022-02-01',0,26.90,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('540891723-1','Tie Xi Qu: West of the Tracks (Tiexi qu)','Pascal Dwyr','2021-03-08',22,25.70,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('549334174-3','War Photographer','Gwenni Niblock','2021-04-07',38,79.35,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('572165492-9','Hustle','Lillis Brithman','2022-06-29',41,36.07,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('577337371-8','The Counterfeit Coin','Ashlie Watkinson','2022-06-20',51,98.18,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('604229039-8','1408','Nero Davidoff','2021-06-06',0,37.08,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('605515935-X','Phantom of the Opera, The','Stephenie Shallo','2020-06-26',0,29.28,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('636424212-X','Blue Kite, The (Lan feng zheng)','Jeffie Hache','2020-02-28',10,60.19,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('638237627-2','Smile Like Yours, A','Sauveur Dericut','2021-08-02',7,66.86,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('644585879-1','April in Paris','Marcy Lanktree','2021-03-08',0,28.66,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('677343881-0','Wedding in Blood (Noces rouges, Les)','Giffie Tremmil','2021-06-15',46,5.54,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('687122514-5','Square, The','Mufinella Jeanneau','2020-11-22',0,4.04,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('701241409-X','Keep, The','Vally Ethersey','2020-05-09',0,28.56,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('705108183-7','Two Jakes, The','Nelson Teague','2021-08-13',0,31.99,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('719458063-2','Martian Child','Vere Hammerman','2020-07-31',0,80.16,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('727202358-9','Specials, The','Tonye Dukesbury','2021-10-02',0,80.45,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('737003336-8','Zathura','Michale Daen','2021-06-28',84,25.19,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('749346718-8','Homeward Bound II: Lost in San Francisco','Lucine Sullens','2021-09-18',0,99.65,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('759255252-3','Shock Corridor','Marley Sear','2020-10-23',0,8.17,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('763511954-0','Another Stakeout','Clayson Tyers','2020-02-22',95,54.91,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('763771362-8','Ed','Valle Alan','2020-01-23',0,72.05,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('788566687-5','I Remember Mama','Susanetta Trubshaw','2020-07-05',0,85.40,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('791470446-6','Cropsey','Elsinore Dillinton','2022-07-20',0,95.60,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('813483093-5','Goya''s Ghosts','Noach Wooland','2021-03-21',2,47.37,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('817495432-5','Trap: What Happened to Our Dream of Freedom, The','Frances Cardenas','2020-05-07',21,16.58,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('829101418-3','World According to Sesame Street, The','Banky Minett','2020-01-31',47,84.67,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('830158442-4','Gone Girl','Carmel Walliker','2021-08-26',75,95.56,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('833551083-0','Little Lord Fauntleroy','Lorianne Webben','2021-02-01',97,20.63,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('839042650-1','Pitch Black','Eartha Nobes','2022-08-08',67,87.14,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('847169866-8','Bunch Of Amateurs, A','Arvie Gulland','2021-06-14',0,94.21,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('848285559-X','Your Highness','Elset Kidgell','2020-01-01',98,34.13,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('871868425-4','Brothers Rico, The','Emmalynn Brearty','2020-10-14',0,55.10,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('884062654-9','Raiders From Beneath the Sea','Basia Iddens','2022-09-07',17,92.52,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('911484222-X','This Is the Night','Martita McGettrick','2021-03-14',0,16.71,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('928663011-5','Gone Baby Gone','Dolf Taylot','2020-02-15',2,16.69,1);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('952610678-4','Creature with the Atom Brain','Nicky Tooth','2022-04-27',0,45.13,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('971667809-6','Snowman, The','Hetty Hanbidge','2020-07-12',0,84.30,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('978104130-7','Age of Heroes','Halli Poff','2021-03-11',0,25.16,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('984002124-9','Easy','Any Scarman','2020-03-10',0,25.64,0);
INSERT INTO libreriaJacaranda.articles (isbn,title,author,published_date,quantity,price,stock) VALUES ('988581387-X','Chase a Crooked Shadow','Gil Koeppke','2020-11-25',11,30.98,1);









