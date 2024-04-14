CREATE TABLE flights_db.airlines  (
	carrier varchar(10) NOT NULL,
	name varchar(100) NULL,
	CONSTRAINT airlines_pk PRIMARY KEY (carrier)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
	
	
CREATE TABLE flights_db.airport (
	faa varchar(10) NOT NULL,
	name varchar(100) NULL,
	lat FLOAT NULL,
	lon FLOAT NULL,
	alt INT NULL,
	tz INT NULL,
	dst varchar(20) NULL,
	tzone varchar(50) NULL,
	CONSTRAINT airport_pk PRIMARY KEY (faa)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE flights_db.planes (
	tailnum varchar(20) NOT NULL,
	year int NULL,
	type varchar (50) NULL,
	manufacturer varchar(50) NULL,
	model varchar(50) NULL,
	engines int NULL,
	seats int NULL,
	speed varchar(10) NULL,
	engine varchar(20) NULL,

	CONSTRAINT planes_pk PRIMARY KEY (tailnum)
)

ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE flights_db.weather (
	origin varchar (10) NULL,
	year int NULL,
	month int NULL,
	day int NULL,
	hour int NULL,
	temp varchar (30) NULL,
	dewp varchar (30) NULL,
	humid varchar (30) NULL,
	wind_dir varchar (30) NULL,
	wind_speed varchar (30) NULL,
	wind_gust varchar (30) NULL,
	precip float NULL,
	pressure varchar (30) NULL,
	visib int NULL,
	time_hour varchar (30) NULL

	)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE flights_db.weather ADD CONSTRAINT weather_pk PRIMARY KEY (`year`,`month`,`day`,`hour`,origin);


CREATE TABLE flights_db.flights	 (
	year int NULL,
	month int NULL,
	day int NULL,
	dep_time varchar (30) NULL,
	sched_dep_time varchar (30) NULL,
	dep_delay varchar (30) NULL,
	arr_time varchar (30) NULL,
	sched_arr_time varchar (30) NULL,
	arr_delay varchar (30) NULL,
	carrier varchar (10) NULL,
	flight int NULL,
	tailnum varchar (20) NULL,
	origin varchar (10) NULL,
	dest varchar (10) NULL,
	air_time varchar (30) NULL,
	distance varchar (30) NULL,
	hour int NULL,
	minute int NULL,
	time_hour varchar (30) NULL
)


ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE flights_db.flights ADD CONSTRAINT flights_pk PRIMARY KEY (`year`,`month`,`day`,`hour`,flight);


LLAVES FORANEAS

ALTER TABLE flights_db.flights ADD CONSTRAINT flights_airport_FK FOREIGN KEY (origin) REFERENCES flights_db.airport(faa);
ALTER TABLE flights_db.flights ADD CONSTRAINT flights_planes_FK FOREIGN KEY (tailnum) REFERENCES flights_db.planes(tailnum);
ALTER TABLE flights_db.flights ADD CONSTRAINT flights_airlines_FK FOREIGN KEY (carrier) REFERENCES flights_db.airlines(carrier);
ALTER TABLE flights_db.flights ADD CONSTRAINT flights_weather_FK FOREIGN KEY (`year`,`month`,`day`,`hour`,origin) REFERENCES flights_db.weather(`year`,`month`,`day`,`hour`,origin);

