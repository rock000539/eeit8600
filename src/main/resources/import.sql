INSERT INTO DRAMA (NAME, EPISODES, ACTOR, GENRE) VALUES ('The Walking Dead', 16,  'Andrew Lincoln', 'Horror' );
INSERT INTO MOVIE (NAME, ACTOR, GENRE, RATING) VALUES ('Minions', 'Sandra Bullock', 'Animation', 6.5);
INSERT INTO COFFEE (NAME, LOCAL, PRICE, TESTING) VALUES ('first', 'U.S', 200, 'yes');
INSERT INTO Notebook (BRAND, NAME, CPU, PRICE) VALUES ('ASUS', 'ZenBook-UX305FA', 'Intel Core M 5Y10 處理器', 40000);

INSERT INTO GAME (NAME, EVALUATION, DOWNLOAD, URL) VALUES ('部落衝突', 5, 3000000, 'www.coc.com.tw')
INSERT INTO GAME (NAME, EVALUATION, DOWNLOAD, URL) VALUES ('皇室戰爭', 4, 1000000, 'www.cor.com.tw')
INSERT INTO GAME (NAME, EVALUATION, DOWNLOAD, URL) VALUES ('神魔之塔', 5, 4000000, 'www.tos.com.tw')
INSERT INTO GAME (NAME, EVALUATION, DOWNLOAD, URL) VALUES ('爐石戰記', 4, 6000000, 'www.heartstone.com.tw')
INSERT INTO GAME (NAME, EVALUATION, DOWNLOAD, URL) VALUES ('列王的紛爭', 3, 2000000, 'www.cok.com.tw')

INSERT INTO BRAND (BRANDNAME, BRANDIMG, WEBSITE, BCFUNC, BRANDSHOW) VALUES ('蜜妮', 'src/...', 'http://www.kao.com/tw/biore/' , 'biore',1)
INSERT INTO BRAND (BRANDNAME, BRANDIMG, WEBSITE, BCFUNC, BRANDSHOW) VALUES ('倩碧', 'src/...', 'http://www.clinique.com.tw/' , 'elca',1)
INSERT INTO BRAND (BRANDNAME, BRANDIMG, WEBSITE, BCFUNC, BRANDSHOW) VALUES ('M.A.C', 'src/...', 'https://www.maccosmetics.com.tw/' , 'elca',1)
INSERT INTO BRAND (BRANDNAME, BRANDIMG, WEBSITE, BCFUNC, BRANDSHOW) VALUES ('蘭蔻', 'src/...', 'http://www.lancome.com.tw/lancome/_zh/_tw/index.aspx' , 'loreal',1)
INSERT INTO BRAND (BRANDNAME, BRANDIMG, WEBSITE, BCFUNC, BRANDSHOW) VALUES ('巴黎萊雅', 'src/...', 'http://www.loreal.com.tw/' , 'loreal',1)

INSERT INTO Category (CATEGORYKIND, CATEGORYLEVEL) VALUES ('lotion ',10.0);
INSERT INTO Category (CATEGORYKIND, CATEGORYLEVEL) VALUES ('cream',13.0);
INSERT INTO Category (CATEGORYKIND, CATEGORYLEVEL) VALUES ('facial mask',8.0);
INSERT INTO Category (CATEGORYKIND, CATEGORYLEVEL) VALUES ('foundation ',20.0);
INSERT INTO Category (CATEGORYKIND, CATEGORYLEVEL) VALUES ('sun protection ',18.0);

INSERT INTO Ingredient (INGREDName, INGREDCName, INGREDChar, INGREDIrritant, INGREDAcne, INGREDSafety) values ('Titanium Dioxide', '二氧化鈦', '防曬', 0, 0, 2)