INSERT INTO amupark.park VALUES
('AcroparkNY','info@acroparkny.com', 'Via Gradenigo, Padova'),
('AquaFun','public@aquafun.com', 'Corso Milano, Vicenza'),
('RideAdventures','customerservice@rideadventures.com', 'Via Parco della Vittoria, Monopoli');


INSERT INTO amupark.account VALUES 
('guglielmo.faggioli@parkville.com', md5('myPassword'), 'Guglielmo', 'Faggioli', 'admin'),
('John@acroparkny.com', md5('JonhPassword'), 'John', 'Smith', 'maintainer'),
('Paul@acroparkny.com', md5('PaulPassword'), 'Paul', 'Black', 'builder');

INSERT INTO amupark.model VALUES 
('DropTower', 'DropTower Model, 2010, 8 seats, Max load 2000 Kg, link: www.amusementRides.com/rides/DropTower'),
('Coaster', 'Coaster Model, 2002, 10 double seats (max 20 people), Max load 5000 Kg, link: www.amusementRides.com/rides/Coaster'),
('Carousel', 'Marry-Go-Round (max 50 people), Max load 5000 Kg, link: www.amusementRides.com/rides/Carousel'),
('PendulumRide', 'Pendulum Ride 50 double seats, Max load 5000 Kg, link: www.amusementRides.com/rides/PenulumRide'),
('WaterRide', 'Coaster Model, 2002, 10 double seats (max 20 people), Max load 5000 Kg, link: www.amusementRides.com/rides/Coaster');

INSERT INTO amupark.ride(description, parkid, modelid) VALUES
('Kids Drop tower in Acropark - Installed in 2010', 'AcroparkNY', 'DropTower'),
('Adults Roller coaster in RideAdventures - Installed in 2015', 'RideAdventures', 'Coaster'),
('Adults Drop tower in AquaFun - Installed in 2015', 'AquaFun', 'DropTower'),
('Kids Roller coaster in AquaFun - Installed in 2018', 'AquaFun', 'Coaster'),

('Kids Pendulum Ride in Acropark - Installed in 2020', 'AcroparkNY', 'PendulumRide'),
('Adults Roller coaster in RideAdventures - Installed in 2019', 'RideAdventures', 'Coaster'),
('Adults Carousel in AquaFun - Installed in 2021', 'AquaFun', 'Carousel'),
('Kids Water Ride in AquaFun - Installed in 2018', 'AquaFun', 'WaterRide'),

('Kids Water Ride in Acropark - Installed in 2010', 'AcroparkNY', 'WaterRide'),
('Adults Pendulum Ride in RideAdventures - Installed in 2015', 'RideAdventures', 'PendulumRide'),
('Adults Drop tower in AquaFun - Installed in 2015', 'AquaFun', 'DropTower'),
('Kids Carousel in AquaFun - Installed in 2018', 'AquaFun', 'Carousel');

INSERT INTO amupark.device(name, description, type, rideid) VALUES
('dyn1', 'brakets - drop tower', 'dynamometer', 1),
('bar1', 'brakets - drop tower', 'barometer', 1),
('cap1', 'front row - coaster', 'capacitor', 2),
('cap2', 'back row - coaster', 'capacitor', 2),
('termo1', 'upper - drop tower', 'termometer', 3),
('bar1', 'lower - drop tower', 'barometer', 3),
('hygro1', 'front row - coaster', 'hygrometer', 4),
('cap1', 'back row - coaster', 'dynamometer', 4);
