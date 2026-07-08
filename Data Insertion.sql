USE OnlineShopping;


-- 1. COUNTRY --

INSERT INTO Country (CountryName) VALUES 
('India'), ('United States'), ('United Kingdom'), ('Germany'), ('Canada'), 
('Australia'), ('France'), ('Japan'), ('Singapore'), ('United Arab Emirates'),
('Brazil'), ('South Africa'), ('South Korea'), ('Netherlands'), ('Spain'), 
('Italy'), ('Switzerland'), ('Sweden'), ('Norway'), ('Denmark'),
('New Zealand'), ('Ireland'), ('Mexico'), ('Malaysia'), ('Thailand'), 
('Saudi Arabia'), ('Egypt'), ('Turkey'), ('Vietnam'), ('Indonesia');

-- 2. PROVINCE --

INSERT INTO Province (ProvinceName) VALUES 
('Telangana'), ('California'), ('London'), ('Bavaria'), ('Ontario'), 
('New South Wales'), ('Île-de-France'), ('Tokyo'), ('Central Singapore'), ('Dubai'),
('São Paulo'), ('Gauteng'), ('Seoul'), ('North Holland'), ('Catalonia'), 
('Lazio'), ('Zurich'), ('Stockholm'), ('Oslo'), ('Hovedstaden'),
('Auckland'), ('Leinster'), ('CDMX'), ('Selangor'), ('Bangkok'), 
('Riyadh'), ('Cairo'), ('Istanbul'), ('Hanoi'), ('Jakarta');


-- 3. CITY --

INSERT INTO City (CityName) VALUES 
('Warangal'), ('Los Angeles'), ('Greenwich'), ('Munich'), ('Toronto'), 
('Sydney'), ('Paris'), ('Shinjuku'), ('Downtown Core'), ('Jumeirah'),
('Campinas'), ('Johannesburg'), ('Gangnam'), ('Amsterdam'), ('Barcelona'), 
('Rome'), ('Winterthur'), ('Solna'), ('Asker'), ('Copenhagen'),
('Manukau'), ('Dublin'), ('Coyoacán'), ('Shah Alam'), ('Pathum Wan'), 
('Diriyah'), ('Giza'), ('Uskudar'), ('Ba Dinh'), ('Bekasi');

-- 4. ZIPCODE --

INSERT INTO ZipCode (CityID, ProvinceID, CountryID) VALUES 
(1,1,1), (2,2,2), (3,3,3), (4,4,4), (5,5,5), (6,6,6), (7,7,7), (8,8,8), (9,9,9), (10,10,10),
(11,11,11), (12,12,12), (13,13,13), (14,14,14), (15,15,15), (16,16,16), (17,17,17), (18,18,18), (19,19,19), (20,20,20),
(21,21,21), (22,22,22), (23,23,23), (24,24,24), (25,25,25), (26,26,26), (27,27,27), (28,28,28), (29,29,29), (30,30,30);

-- 5. CUSTOMER --

INSERT INTO Customer (FirstName, LastName, DOB, Email, Password, Contact) VALUES 
('Aarav', 'Sharma', '2001-05-14', 'aarav.sharma@email.com', 'hash_01', '9876543210'),
('Ananya', 'Reddy', '2003-11-22', 'ananya.r@email.com', 'hash_02', '8765432109'),
('Rohan', 'Verma', '1999-08-05', 'rohan.v@email.com', 'hash_03', '7654321098'),
('Diya', 'Nair', '2002-02-28', 'diya.nair@email.com', 'hash_04', '6543210987'),
('Kabir', 'Mehta', '2000-12-15', 'kabir.m@email.com', 'hash_05', '9123456789'),
('Liam', 'Smith', '1995-04-12', 'liam.smith@email.com', 'hash_06', '2025550143'),
('Emma', 'Johnson', '1998-09-19', 'emma.j@email.com', 'hash_07', '2025550198'),
('Oliver', 'Williams', '1993-11-02', 'oliver.w@email.com', 'hash_08', '2025550112'),
('Ava', 'Brown', '2001-07-25', 'ava.b@email.com', 'hash_09', '2025550176'),
('Lucas', 'Jones', '1997-01-30', 'lucas.j@email.com', 'hash_10', '2025550155'),
('Lucas', 'Garcia', '1992-06-14', 'lucas.g@email.com', 'hash_11', '1199887766'),
('Mia', 'Silva', '1996-03-22', 'mia.silva@email.com', 'hash_12', '1199776655'),
('Hans', 'Müller', '1989-10-05', 'hans.m@email.com', 'hash_13', '1701234567'),
('Sofie', 'Schneider', '1994-12-12', 'sofie.s@email.com', 'hash_14', '1707654321'),
('Yuki', 'Sato', '2000-05-20', 'yuki.sato@email.com', 'hash_15', '08012345678'),
('Kenji', 'Tanaka', '1997-08-14', 'kenji.t@email.com', 'hash_16', '08087654321'),
('Chloe', 'Dubois', '1995-02-18', 'chloe.d@email.com', 'hash_17', '0612345678'),
('Pierre', 'Martin', '1991-07-09', 'pierre.m@email.com', 'hash_18', '0687654321'),
('Minho', 'Kim', '1998-11-04', 'minho.kim@email.com', 'hash_19', '01012345678'),
('Jiwoo', 'Park', '2002-04-16', 'jiwoo.p@email.com', 'hash_20', '01087654321'),
('Noah', 'Van Dijk', '1996-09-30', 'noah.vd@email.com', 'hash_21', '0611122233'),
('Sanne', 'De Jong', '2001-01-15', 'sanne.dj@email.com', 'hash_22', '0622233344'),
('Carlos', 'Rodriguez', '1993-05-25', 'carlos.r@email.com', 'hash_23', '0633344455'),
('Elena', 'Gomez', '1997-10-10', 'elena.g@email.com', 'hash_24', '0644455566'),
('Mateo', 'Fernandez', '1999-03-03', 'mateo.f@email.com', 'hash_25', '0655566677'),
('Sofia', 'Lopez', '2003-07-07', 'sofia.l@email.com', 'hash_26', '0666677788'),
('Jack', 'Wilson', '1994-12-24', 'jack.w@email.com', 'hash_27', '0211122233'),
('Charlotte', 'Thomas', '1996-08-11', 'charlotte.t@email.com', 'hash_28', '0222233344'),
('William', 'Taylor', '1992-02-02', 'william.t@email.com', 'hash_29', '0233344455'),
('Amelia', 'Davies', '2000-10-21', 'amelia.d@email.com', 'hash_30', '0244455566');

-- 6. ADDRESS --

INSERT INTO Address (HouseNo, Street, CustomerID, ZipCodeID, Area) VALUES 
('2-4-12', 'Hanman Junction Rd', 1, 1, 'Hanamkonda'),
('1024', 'Sunset Blvd', 2, 2, 'Hollywood'),
('Block B-7', 'Karlsplatz Ave', 3, 3, 'Maxvorstadt'),
('Flat 42', 'Baker St', 4, 4, 'Marylebone'),
('Apt 302', 'Yonge St', 5, 5, 'Downtown'),
('Suite 12', 'George St', 6, 6, 'CBD'),
('12B', 'Rue de Rivoli', 7, 7, 'Le Marais'),
('Chome 2', 'Meiji Dori', 8, 8, 'Harajuku'),
('Penthouse A', 'Orchard Rd', 9, 9, 'Newton'),
('Villa 5', 'Al Sukook St', 10, 10, 'Marina'),
('Casa 11', 'Av Paulista', 11, 11, 'Bela Vista'),
('Unit 4', 'Rivonia Rd', 12, 12, 'Sandton'),
('Room 501', 'Teheran-ro', 13, 13, 'Gangnam-gu'),
('House 8', 'Prinsengracht', 14, 14, 'Jordaan'),
('Piso 3', 'La Rambla', 15, 15, 'Gothic Quarter'),
('Interior 9', 'Via del Corso', 16, 16, 'Centro Storico'),
('Studio 1', 'Bahnhofstrasse', 17, 17, 'City Center'),
('No 55', 'Kungsgatan', 18, 18, 'Norrmalm'),
('Apt 8C', 'Karl Johans gate', 19, 19, 'Sentrum'),
('Floor 2', 'Strøget', 20, 20, 'Indre By'),
('No 33', 'Queen St', 21, 21, 'Central'),
('Flat 3', 'Grafton St', 22, 22, 'South City'),
('Casa De Campo', 'Paseo de la Reforma', 23, 23, 'Polanco'),
('Lot 102', 'Jalan Bukit Bintang', 24, 24, 'Kuala Lumpur'),
('Room 12', 'Sukhumvit Rd', 25, 25, 'Khlong Toei'),
('Gate 4', 'Tahlia St', 26, 26, 'Olaya'),
('Apt 9', 'Al Haram St', 27, 27, 'Nazlet El-Semman'),
('No 404', 'Istiklal Ave', 28, 28, 'Beyoglu'),
('Suite 88', 'Trang Tien St', 29, 29, 'Hoan Kiem'),
('Blok M', 'Sudirman St', 30, 30, 'Kebayoran Baru');

-- 7. CATEGORY --

INSERT INTO Category (CategoryName) VALUES 
('Electronics'), ('Books'), ('Apparel'), ('Home & Kitchen'), ('Beauty & Personal Care'),
('Sports & Outdoors'), ('Toys & Games'), ('Automotive'), ('Health & Wellness'), ('Grocery & Gourmet'),
('Office Supplies'), ('Pet Supplies'), ('Tools & Improvement'), ('Baby Products'), ('Jewelry & Watches'),
('Footwear'), ('Musical Instruments'), ('Garden & Outdoor'), ('Smart Home'), ('Movies & TV'),
('Video Games'), ('Luggage & Travel'), ('Arts & Crafts'), ('Industrial & Scientific'), ('Software'),
('Collectibles'), ('Handmade Crafts'), ('Automotive Parts'), ('Fitness Equipment'), ('Furniture');

-- 8. VENDOR --

INSERT INTO Vendor (Name, Address, Email, Password, Contact) VALUES 
('Nexus Tech Ltd', 'Industrial Area, Hyd', 'sales@nexustech.com', 'v_hash_01', '9111222333'),
('Alpha Books', '742 Evergreen Terrace, LA', 'orders@alphabooks.com', 'v_hash_02', '9222333444'),
('Vogue Styles', 'Regent Street, London', 'contact@voguestyles.com', 'v_hash_03', '9333444555'),
('HomeEssentials', 'Munich Hub', 'info@homeessentials.de', 'v_hash_04', '9444555666'),
('Glow Cosmetics', 'Paris Lab Cafe', 'support@glowcosmetics.fr', 'v_hash_05', '9555666777'),
('Titan Sports Co', 'Tokyo Sports City', 'wholesale@titansports.jp', 'v_hash_06', '9666777888'),
('FunZone Toys', 'Ontario Logistics Park', 'b2b@funzonetoys.ca', 'v_hash_07', '9777888999'),
('AutoGear Inc', 'Detroit Plant', 'orders@autogear.com', 'v_hash_08', '9888999000'),
('NutriLife Global', 'Sydney Wellness HQ', 'sales@nutrilife.com', 'v_hash_09', '9999000111'),
('Gourmet Delights', 'Milan Food Quarter', 'trade@gourmetdelights.it', 'v_hash_10', '9000111222'),
('PaperCraft Co', 'Singapore Business Bay', 'admin@papercraft.sg', 'v_hash_11', '8111222333'),
('Paws & Claws', 'Amsterdam Pet District', 'hello@pawsclaws.nl', 'v_hash_12', '8222333444'),
('FixIt Tools', 'Stuttgart Craft Factory', 'sales@fixittools.de', 'v_hash_13', '8333444555'),
('BabyBliss', 'Seoul Care Group', 'support@babybliss.kr', 'v_hash_14', '8444555666'),
('Aura Jewelry', 'Dubai Gold Souk', 'luxury@aurajewelry.ae', 'v_hash_15', '8555666777'),
('Sole Comfort', 'Madrid Footwear Hub', 'b2b@solecomfort.es', 'v_hash_16', '8666777888'),
('Melody Instruments', 'Vienna Music Hall', 'orders@melodyinst.at', 'v_hash_17', '8777888999'),
('GreenThumb Garden', 'Oregon Greenhouses', 'info@greenthumb.com', 'v_hash_18', '8888999000'),
('SmartLiving', 'Shenzhen Tech Complex', 'dev@smartliving.cn', 'v_hash_19', '8989000111'),
('CineMedia', 'Burbank Studios', 'licensing@cinemedia.com', 'v_hash_20', '8000111222'),
('Pixel Games', 'Kyoto Development Lab', 'sales@pixelgames.jp', 'v_hash_21', '7111222333'),
('Voyage Bags', 'Changi Airside Logistics', 'cargo@voyagebags.sg', 'v_hash_22', '7222333444'),
('Artistic Minds', 'Florentine Guild', 'artists@artisticminds.it', 'v_hash_23', '7333444555'),
('Sigma Lab Supplies', 'Zurich Science Park', 'orders@sigmalabs.ch', 'v_hash_24', '7444555666'),
('CloudSoft Apps', 'Silicon Valley Tech', 'sales@cloudsoft.com', 'v_hash_25', '7555666777'),
('Legacy Mint', 'London Antique Market', 'info@legacymint.co.uk', 'v_hash_26', '7666777888'),
('Artisan Crafted', 'Oaxaca Village Cooperative', 'trade@artisancrafted.mx', 'v_hash_27', '7777888999'),
('DriveParts Corp', 'Frankfurt Terminal', 'logistics@driveparts.de', 'v_hash_28', '7888999000'),
('IronGym Gears', 'Stockholm Heavy Industries', 'sales@irongym.se', 'v_hash_29', '7999000111'),
('Nordic Timber', 'Oslo Design Center', 'wholesale@nordictimber.no', 'v_hash_30', '7000111222');

-- 9. PRODUCT --

INSERT INTO Product (ProductName, CategoryID) VALUES 
('Mechanical Keyboard', 1), ('CLRS Algorithms Book', 2), ('Cotton Hoodie', 3), 
('Air Fryer 5L', 4), ('Hydrating Face Serum', 5), ('Ergonomic Yoga Mat', 6), 
('Building Blocks Set', 7), ('LED Headlight Bulbs', 8), ('Whey Protein Isolate', 9), 
('Organic Matcha Powder', 10), ('Gel Ink Pens 12-Pack', 11), ('Orthopedic Dog Bed', 12), 
('Cordless Drill 20V', 13), ('Hypoallergenic Baby Wipes', 14), ('Silver Minimalist Ring', 15), 
('Running Shoes', 16), ('Acoustic Guitar', 17), ('Solar Garden Lights', 18), 
('Smart Video Doorbell', 19), ('4K Ultra HD Blu-ray Player', 20), ('Wireless Gaming Controller', 21), 
('Hard Shell Suitcase 24"', 22), ('Acrylic Paint Set 24 Colors', 23), ('Digital Caliper Tool', 24), 
('Antivirus Security Suite', 25), ('Limited Edition Comic Book', 26), ('Handwoven Ceramic Vase', 27), 
('Premium Brake Pads Set', 28), ('Adjustable Dumbbells Single', 29), ('Mid-Century Modern Chair', 30);

-- 10. VENDOR PRODUCT --

INSERT INTO VendorProduct (VendorID, ProductID, Price, Quantity, Description) VALUES 
(1, 1, 4500.00, 150, 'RGB mechanical keyboard with red switches.'), (2, 2, 3200.00, 45, 'Introduction to Algorithms textbook.'), 
(3, 3, 1500.00, 200, '100% premium cotton streetwear fit hoodie.'), (4, 4, 6500.00, 80, 'Oil-free air circulation rapid fryer.'), 
(5, 5, 1200.00, 300, 'Pure hyaluronic acid skin care serum.'), (6, 6, 1800.00, 120, 'Non-slip 6mm high-density cushioning mat.'), 
(7, 7, 2500.00, 90, 'Creative engineering blocks for children.'), (8, 8, 3500.00, 60, 'Super bright cool white LED conversion kit.'), 
(9, 9, 4200.00, 110, 'Ultra-pure grass-fed chocolate whey isolate.'), (10, 10, 1400.00, 85, 'Ceremonial grade culinary organic green tea.'), 
(11, 11, 450.00, 500, 'Smooth flowing fine tip black gel pens.'), (12, 12, 2800.00, 40, 'Memory foam spine support joint-relief pet bed.'), 
(13, 13, 5500.00, 70, 'Variable speed high torque power driver drill.'), (14, 14, 350.00, 400, 'Unscented gentle organic plant-based wipes.'), 
(15, 15, 1900.00, 130, '925 sterling silver structural index band.'), (16, 16, 4800.00, 160, 'Breathable mesh elite performance road runners.'), 
(17, 17, 8500.00, 35, 'Full-size steel string warm tone guitar.'), (18, 18, 999.00, 250, 'Waterproof auto-on dusk to dawn stakes.'), 
(19, 19, 7900.00, 65, '1080p wide-angle real-time communication system.'), (20, 20, 11500.00, 25, 'Dolby Vision atmospheric cinematic media machine.'), 
(21, 21, 3900.00, 140, 'Low-latency Bluetooth ergonomic multi-platform pad.'), (22, 22, 5200.00, 75, 'Scratch-resistant polycarbonate spinner check-in.'), 
(23, 23, 1100.00, 180, 'Rich pigment non-toxic quick-drying kit.'), (24, 24, 2100.00, 95, 'High precision metric/inch stainless measurement.'), 
(25, 25, 1250.00, 1000, '1-Year 3-Device premium firewall protection key.'), (26, 26, 6000.00, 15, 'Mint condition variant cover collectable script.'), 
(27, 27, 3400.00, 30, 'Hand-thrown painted earth terracota container.'), (28, 28, 2900.00, 50, 'Low dust ceramic structural direct compound pads.'), 
(29, 29, 7500.00, 40, 'Heavy cast steel selection weight dial structure.'), (30, 30, 14500.00, 20, 'Solid walnut base tapered accent seating item.');

-- 11. COURIER --

INSERT INTO Courier (Name, Contact) VALUES 
('BlueDart', '18002003344'), ('FedEx', '18004633339'), ('DHL Express', '1800111345'), 
('UPS Freight', '18007425877'), ('USPS Priority', '18002758777'), ('DTDC India', '18002123344'), 
('Delhivery', '18001036354'), ('Speed Post', '1800112011'), ('Royal Mail', '03457740740'), 
('Canada Post', '18666076301'), ('Japan Post', '0570046666'), ('AusPost', '131318'), 
('Aramex', '18002001000'), ('SF Express', '95338'), ('La Poste', '3631'), 
('Deutsche Post', '02284333111'), ('Correos', '902197197'), ('Poste Italiane', '803160'), 
('Swiss Post', '0848888888'), ('PostNord', '0771333310'), ('NZ Post', '0800501501'), 
('An Post', '017057000'), ('Correos Mexico', '018007017000'), ('Pos Malaysia', '1300300300'), 
('Thailand Post', '1545'), ('Saudi Post', '920005700'), ('Egypt Post', '16789'), 
('PTT Cargo', '4441788'), ('VNPost', '1900545481'), ('JNE Express', '02129278888');

-- 12. VENDOR COURIER --

INSERT INTO VendorCourier (VendorID, CourierID) VALUES 
(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (10,10),
(11,11), (12,12), (13,13), (14,14), (15,15), (16,16), (17,17), (18,18), (19,19), (20,20),
(21,21), (22,22), (23,23), (24,24), (25,25), (26,26), (27,27), (28,28), (29,29), (30,30);

-- 13. ORDERS --

INSERT INTO Orders (CustomerID, OrderDate, AddressID, VendorCourierID, TrackingID) VALUES 
(1, '2026-07-01', 1, 1, 'TRK-001'), (2, '2026-07-01', 2, 2, 'TRK-002'), (3, '2026-07-02', 3, 3, 'TRK-003'),
(4, '2026-07-02', 4, 4, 'TRK-004'), (5, '2026-07-02', 5, 5, 'TRK-005'), (6, '2026-07-03', 6, 6, 'TRK-006'),
(7, '2026-07-03', 7, 7, 'TRK-007'), (8, '2026-07-03', 8, 8, 'TRK-008'), (9, '2026-07-04', 9, 9, 'TRK-009'),
(10, '2026-07-04', 10, 10, 'TRK-010'), (11, '2026-07-04', 11, 11, 'TRK-011'), (12, '2026-07-04', 12, 12, 'TRK-012'),
(13, '2026-07-05', 13, 13, 'TRK-013'), (14, '2026-07-05', 14, 14, 'TRK-014'), (15, '2026-07-05', 15, 15, 'TRK-015'),
(16, '2026-07-05', 16, 16, 'TRK-016'), (17, '2026-07-05', 17, 17, 'TRK-017'), (18, '2026-07-06', 18, 18, 'TRK-018'),
(19, '2026-07-06', 19, 19, 'TRK-019'), (20, '2026-07-06', 20, 20, 'TRK-020'), (21, '2026-07-06', 21, 21, 'TRK-021'),
(22, '2026-07-06', 22, 22, 'TRK-022'), (23, '2026-07-07', 23, 23, 'TRK-023'), (24, '2026-07-07', 24, 24, 'TRK-024'),
(25, '2026-07-07', 25, 25, 'TRK-025'), (26, '2026-07-07', 26, 26, 'TRK-026'), (27, '2026-07-08', 27, 27, 'TRK-027'),
(28, '2026-07-08', 28, 28, 'TRK-028'), (29, '2026-07-08', 29, 29, 'TRK-029'), (30, '2026-07-08', 30, 30, 'TRK-030');

-- 14. ORDERED PRODUCT --

INSERT INTO OrderedProduct (VendorProductID, OrderID, Quantity) VALUES 
(1,1,1), (2,2,1), (3,3,2), (4,4,1), (5,5,3), (6,6,1), (7,7,1), (8,8,2), (9,9,1), (10,10,5),
(11,11,2), (12,12,1), (13,13,1), (14,14,4), (15,15,1), (16,16,1), (17,17,1), (18,18,6), (19,19,1), (20,20,1),
(21,21,2), (22,22,1), (23,23,3), (24,24,1), (25,25,2), (26,26,1), (27,27,1), (28,28,2), (29,29,1), (30,30,1);

-- 15. REVIEW --

INSERT INTO Review (Rating, Comment, CustomerID, OrderedProductID) VALUES 
(5, 'Keys click smoothly. Love it.', 1, 1), (4, 'Great deep textbook content.', 2, 2), (5, 'Warm and ultra comfortable.', 3, 3),
(4, 'Crispy fries with zero oil.', 4, 4), (5, 'Perfect moisture retention.', 5, 5), (5, 'Completely non-slip surface.', 6, 6),
(4, 'Keeps kids engaged for hours.', 7, 7), (5, 'Night vision is vastly better.', 8, 8), (5, 'Mixes cleanly without lumps.', 9, 9),
(3, 'Tastes fine but a bit bitter.', 10, 10), (4, 'Solid flow, no blotches.', 11, 11), (5, 'My retriever loves sleeping here.', 12, 12),
(5, 'Unbelievable power and battery.', 13, 13), (4, 'Soft and completely scent-free.', 14, 14), (5, 'Elegant shine, elegant design.', 15, 15),
(4, 'Extremely bouncy light runner.', 16, 16), (5, 'Resonates beautifully in halls.', 17, 17), (3, 'One stake unit failed early.', 18, 18),
(5, 'Crystal clear live link app feed.', 19, 19), (5, 'Cinema standard quality colors.', 20, 20), (4, 'Thumb sticks feel tactile.', 21, 21),
(5, 'Survived multi-flight transit easily.', 22, 22), (5, 'Vibrant saturation on boards.', 23, 23), (4, 'Accurate calibration scale.', 24, 24),
(4, 'Lightweight background resource use.', 25, 25), (5, 'A collectors true dream find.', 26, 26), (5, 'Brings artistic rustic vibes.', 27, 27),
(4, 'No squealing noises during braking.', 28, 28), (5, 'Saves massive home gym footprint.', 29, 29), (5, 'Premium luxury walnut framing.', 30, 30);

-- 16. CART --

INSERT INTO Cart (DateCreated, CustomerID) VALUES 
('2026-07-01',1), ('2026-07-01',2), ('2026-07-02',3), ('2026-07-02',4), ('2026-07-02',5),
('2026-07-03',6), ('2026-07-03',7), ('2026-07-03',8), ('2026-07-04',9), ('2026-07-04',10),
('2026-07-04',11), ('2026-07-04',12), ('2026-07-05',13), ('2026-07-05',14), ('2026-07-05',15),
('2026-07-05',16), ('2026-07-05',17), ('2026-07-06',18), ('2026-07-06',19), ('2026-07-06',20),
('2026-07-06',21), ('2026-07-06',22), ('2026-07-07',23), ('2026-07-07',24), ('2026-07-07',25),
('2026-07-07',26), ('2026-07-08',27), ('2026-07-08',28), ('2026-07-08',29), ('2026-07-08',30);

-- 17. CART PRODUCT --

INSERT INTO CartProduct (VendorProductID, Quantity, CartID) VALUES 
(2,2,1), (3,1,2), (4,1,3), (5,2,4), (6,1,5), (7,3,6), (8,1,7), (9,1,8), (10,2,9), (11,4,10),
(12,1,11), (13,1,12), (14,2,13), (15,1,14), (16,2,15), (17,1,16), (18,5,17), (19,1,18), (20,1,19), (21,2,20),
(22,1,21), (23,2,22), (24,1,23), (25,3,24), (26,1,25), (27,1,26), (28,2,27), (29,1,28), (30,1,29), (1,1,30);
