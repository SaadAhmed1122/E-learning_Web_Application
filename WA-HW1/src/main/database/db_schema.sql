CREATE DATABASE tutordb OWNER parkadmin ENCODING = 'UTF8';

-- Connect to the new db
\c tutordb

CREATE SCHEMA amupark;


CREATE TYPE amupark.roles AS ENUM (
'base',
'maintainer',
'builder',
'admin'
);

CREATE TYPE amupark.eventcategories AS ENUM (
'ordinary_maintenance',
'extraordinary_maintenance',
'hardware_upgrade',
'other'
);

CREATE TYPE amupark.devicetypes AS ENUM (
'hygrometer',
'termometer',
'barometer',
'dynamometer',
'capacitor',
'other'
);


CREATE TYPE amupark.sessiontypes AS ENUM (
'testing', 
'monitoring',
'maintainance',
'other'
);


CREATE TABLE amupark.account (
email VARCHAR(64) PRIMARY KEY,
password TEXT NOT NULL,
first_name VARCHAR(64) NOT NULL,
last_name VARCHAR(66) NOT NULL,
role amupark.roles DEFAULT 'base' NOT NULL
);

CREATE TABLE amupark.park (
name VARCHAR(50) PRIMARY KEY,
email VARCHAR(64) NOT NULL,
address VARCHAR(250) NOT NULL
);

CREATE TABLE amupark.model (
name VARCHAR(64) PRIMARY KEY,
description TEXT
);

CREATE TABLE amupark.ride (
rideid SERIAL PRIMARY KEY, 
description TEXT,
parkid VARCHAR(64) NOT NULL,
modelid VARCHAR(64) NOT NULL,
FOREIGN KEY(parkid) REFERENCES amupark.park(name) ON DELETE CASCADE,
FOREIGN KEY(modelid) REFERENCES amupark.model(name) ON DELETE CASCADE
);



CREATE TABLE amupark.device (
deviceid SERIAL PRIMARY KEY,
name VARCHAR(64) NOT NULL,
description TEXT,
type amupark.devicetypes NOT NULL,
rideid INTEGER NOT NULL,
FOREIGN KEY(rideid) REFERENCES amupark.ride(rideid) ON DELETE CASCADE
);


CREATE TABLE amupark.event (
eventid SERIAL PRIMARY KEY,
type amupark.eventcategories NOT NULL,
description TEXT,
rideid INTEGER NOT NULL,
userid VARCHAR(64) NOT NULL, 
date_performed DATE NOT NULL,
planned BOOLEAN,
FOREIGN KEY(userid) REFERENCES amupark.account(email) ON DELETE CASCADE,
FOREIGN KEY(rideid) REFERENCES amupark.ride(rideid) ON DELETE CASCADE
);


CREATE TABLE amupark.session(
sessionid SERIAL PRIMARY KEY,
added_by VARCHAR(64) NOT NULL,
rideid INTEGER NOT NULL,
start_time TIMESTAMP WITH TIME ZONE,
end_time TIMESTAMP WITH TIME ZONE,
type amupark.sessiontypes NOT NULL, 
notes TEXT,
date_added DATE,
FOREIGN KEY(added_by) REFERENCES amupark.account(email) ON DELETE CASCADE,
FOREIGN KEY(rideid) REFERENCES amupark.ride(rideid) ON DELETE CASCADE
);


CREATE TABLE amupark.measurement (
id SERIAL PRIMARY KEY, 
data_array DOUBLE PRECISION[],
start_time TIMESTAMP WITH TIME ZONE,
end_time TIMESTAMP WITH TIME ZONE,
cycle SMALLINT,
sessionid INTEGER NOT NULL,
deviceid INTEGER NOT NULL,
FOREIGN KEY(sessionid) REFERENCES amupark.session(sessionid) ON DELETE CASCADE,
FOREIGN KEY(deviceid) REFERENCES amupark.device(deviceid) ON DELETE CASCADE
);
