UPDATE employees
SET reportsto = NULL
WHERE employeeid= 2;


DELETE FROM employees WHERE employeeid > 9;

INSERT INTO employees (firstname,lastname,address,city,country,postalcode,homephone,title,employeeid,reportsto) VALUES
('Josephine','Boyer','463-4613 Ipsum Street','Saint-Prime','USA','73-638','741-0423','CEO',200,NULL),
('Marvin','Cole','P.O. Box 857, 9463 Et St.','Sauris','Philippines','91-806','717-0456','CFO',201,200),
('Lee','Hatfield','Ap #152-543 Facilisis. St.','Baden','Monaco','44981-785','990-7598','CTO',202,200),
('Chancellor','Hubbard','672-2470 Adipiscing Avenue','Chatteris','Macao','79613','1-655-930-7580','Head of Ops',203,200),
('Jakeem','Chaney','177 Mauris Road','Izmir','France','6729','1-849-661-5415','Ops Manager',204,203),
('Paul','Sutton','5572 Morbi St.','Fourbechies','United Kingdom','3072','1-664-924-2966','Ops Manager - Europe',205,203),
('Aaron','Erickson','2646 Sem, Avenue','Olen','USA','9656','1-713-526-0184','Ops Manager - USA',206,203),
('Azalia','Wagner','Ap #543-1195 Mi Av.','Swan Hills','USA','1481','544-1445','Warehouse USA',207,206),
('Elmo','Goodwin','Ap #609-977 Gravida Ave','Frascati','USA','5083','1-281-122-4910','Warehouse USA',208,206),
('Quon','Durham','523 Praesent Rd.','Lutsel K''e','USA','40535-562','951-4455','Warehouse USA',209,206),
('Keaton','Weber','Ap #228-2672 Nulla Av.','La Pintana','USA','6812','1-845-128-7756','Warehouse USA',210,206),
('Edward','Hahn','Ap #802-6505 Malesuada Rd.','Tuticorin','United Kingdom','017440','549-3727','Warehouse Europe',211,205),
('Ariana','Webster','7875 Tempus Avenue','Maltignano','United Kingdom','08573','137-2511','Warehouse Europe',212,205),
('Todd','Workman','3689 Ultrices Street','Northumberland','United Kingdom','8489','516-6304','Warehouse Europe',213,205),
('Zachery','May','Ap #995-8373 Urna. Ave','Malahide','Benin','60538','1-599-255-1156','Sales Assistant',214, 3),
('Bert','Hayden','Ap #302-641 Magna. Avenue','Erdemli','Netherlands','833743','699-3083','Sales Assistant',215, 6),
('Renee','Walter','P.O. Box 366, 9086 Molestie. Rd.','Spijkenisse','Turkey','24-954','1-346-528-1347','Sales Assistant',216, 3),
('Jessica','Moss','Ap #621-2177 Egestas. St.','Chépica','Ireland','2762','1-712-113-5307','Sales Assistant',217, 9),
('Kiona','Dudley','Ap #363-6364 Tincidunt Rd.','Antwerpen','Tonga','OL3H 6ZZ','1-365-255-0842','Sales Assistant',218, 4),
('Veronica','Sosa','Ap #261-3206 Tempus St.','Alcorcón','Malaysia','60804','479-1676','Sales Assistant',219, 8),
('Addison','Welch','P.O. Box 477, 206 Amet Avenue','Abbotsford','Zambia','34948-111','977-9391','Programmer',220, 202),
('Brendan','Parrish','Ap #875-923 In, Ave','Clovenfords','Ecuador','13168','949-4055','Data Analyst',221, 202),
('Dakota','Delgado','P.O. Box 653, 3364 Arcu Rd.','Valdivia','Antarctica','44623','1-206-971-7181','Accounting',222, 201),
('Kirby','Mullins','1166 Donec Rd.','Meridian','Mozambique','886609','807-6992','Accounting',223, 201),
('Stuart','Clarke','P.O. Box 177, 3565 Senectus St.','Viddalba','Libya','WS7 3JO','933-7681','Personal Assistant',224, 200);


UPDATE employees
SET reportsto = 200
WHERE employeeid= 2;
