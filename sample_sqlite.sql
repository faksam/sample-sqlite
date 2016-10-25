-- sqlite3 speedtest.db

create table User
(
UserID int identity (1,1) primary key,
Fullname varchar(80) not null,
EmailAddress varchar (150),
Username varchar(30) not null,
[Password] varchar(15) not null 
);

create table Test 
(
TestID int identity (1,1) primary key,
TestParagraph varchar(150) not null,
TestResult varchar(20) not null,
TestTime DateTime not null
);

create table UserTest
(
  TestID     INTEGER, 
  UserID   TEXT, 
  FOREIGN KEY(TestID) REFERENCES Test(TestID)
  FOREIGN KEY(UserID) REFERENCES User(UserID)
);

INSERT INTO `Test` (`TestId`,`TestParagraph`,`TestResult`,`TestTime`) VALUES (1,"magnis dis parturient montes, nascetur","Cum sociis natoque penatibus et","04/01/16"),(2,"amet lorem semper auctor. Mauris","diam luctus lobortis. Class aptent","05/02/17"),(3,"feugiat tellus lorem eu metus.","blandit at, nisi. Cum sociis","16/12/15"),(4,"malesuada vel, venenatis vel, faucibus","dapibus gravida. Aliquam tincidunt, nunc","11/07/16"),(5,"interdum. Sed auctor odio a","Pellentesque ut ipsum ac mi","11/10/17"),(6,"lacus, varius et, euismod et,","sem egestas blandit. Nam nulla","23/06/17"),(7,"Pellentesque ut ipsum ac mi","orci lacus vestibulum lorem, sit","03/08/16"),(8,"molestie. Sed id risus quis","Aliquam tincidunt, nunc ac mattis","21/01/17"),(9,"pharetra. Quisque ac libero nec","nascetur ridiculus mus. Donec dignissim","25/03/16"),(10,"sit amet ultricies sem magna","est, vitae sodales nisi magna","15/11/16");
INSERT INTO `Test` (`TestId`,`TestParagraph`,`TestResult`,`TestTime`) VALUES (11,"Mauris blandit enim consequat purus.","sapien. Aenean massa. Integer vitae","15/03/16"),(12,"consequat enim diam vel arcu.","vel arcu. Curabitur ut odio","26/01/16"),(13,"mollis. Phasellus libero mauris, aliquam","felis. Donec tempor, est ac","01/06/17"),(14,"litora torquent per conubia nostra,","at sem molestie sodales. Mauris","05/02/17"),(15,"diam. Proin dolor. Nulla semper","In scelerisque scelerisque dui. Suspendisse","11/06/16"),(16,"odio. Aliquam vulputate ullamcorper magna.","semper cursus. Integer mollis. Integer","10/11/15"),(17,"tempor diam dictum sapien. Aenean","in sodales elit erat vitae","08/09/16"),(18,"a mi fringilla mi lacinia","Maecenas iaculis aliquet diam. Sed","15/12/16"),(19,"neque pellentesque massa lobortis ultrices.","luctus sit amet, faucibus ut,","06/05/16"),(20,"neque non quam. Pellentesque habitant","volutpat. Nulla dignissim. Maecenas ornare","01/04/16");

INSERT INTO `User` (`UserID`,`Fullname`,`EmailAddress`,`Username`,`Password`) VALUES (1,"Vielka Kirkland","vitae.risus.Duis@vehiculaetrutrum.net","Wyatt","1671111924299"),(2,"Virginia Sweeney","amet.consectetuer.adipiscing@penatibusetmagnis.edu","Nunez","1674052362799"),(3,"Aubrey Larsen","massa.Mauris.vestibulum@maurisid.org","Morris","1676021125799"),(4,"Arthur Morales","turpis.egestas.Fusce@NullafacilisiSed.edu","Nolan","1693101254699"),(5,"Caldwell Woodward","enim.Suspendisse@nuncsedlibero.co.uk","Carver","1601011847599"),(6,"McKenzie Bean","purus.accumsan.interdum@euaugueporttitor.com","Ayala","1699032352799"),(7,"Ariel Battle","dolor@nonluctussit.co.uk","Craft","1670041764999"),(8,"Gray Jones","nunc@Aenean.com","Hardin","1662050302099"),(9,"Vanna Grimes","ac.sem.ut@ultricessitamet.ca","Parker","1684091648699"),(10,"Tanya Russo","magna.Duis@et.com","Albert","1687060793099");

INSERT INTO `UserTest` (`UserID`,`TestID`) VALUES (4,4),(9,3),(1,1),(3,1),(3,10),(9,8),(1,5),(4,4),(5,7),(9,8);

SELECT Fullname, EmailAddress, Username
FROM User
WHERE UserID < 50;

SELECT User.Fullname, User.EmailAddress, Test.TestResult
FROM User
INNER JOIN UserTest
ON User.UserID = UserTest.UserID 
INNER JOIN Test
ON Test.TestId = UserTest.TestId 
ORDER BY Test.TestResult;
