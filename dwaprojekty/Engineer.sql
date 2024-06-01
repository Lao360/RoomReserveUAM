Create database engineer
go

Use engineer
go

CREATE TABLE Proffesor (
  id int PRIMARY KEY,
  name varchar(255),
  title varchar(255)
);

CREATE TABLE Room (
  id int NOT NULL PRIMARY KEY,
  room_nr varchar(255) NOT NULL,
  projectorc bit NOT NULL,
  building_id int NOT NULL
);

CREATE TABLE Class (
  id int NOT NULL PRIMARY KEY,
  class_name varchar(255) NOT NULL,
  describ text,
  room_id int NOT NULL,
  proffesor_id int NOT NULL,
  starts datetime,
  ends datetime
);

CREATE TABLE Building (
  id int NOT NULL PRIMARY KEY,
  adress varchar(255),
  designation varchar(255),
  describ text
);

CREATE TABLE Class_Room (
  class_id integer NOT NULL,
  room_id integer NOT NULL,
  PRIMARY KEY (class_id, room_id),
  Foreign key (room_id) References Room(id),
  Foreign key (class_id) References Class(id)
);


ALTER TABLE Class ADD FOREIGN KEY (proffesor_id) REFERENCES Proffesor (id);

ALTER TABLE Room ADD FOREIGN KEY (Building_id) REFERENCES Building (id);
