/*
drop table elevator_wait;
drop table elevator_journey;
drop TABLE elevator_arrivals;

drop table elevator_passenger_action;

DROP TABLE elevator;
DROP TABLE elevator_passenger;
*/


-- ************************************** elevator
CREATE TABLE elevator
(
 elevator_id   SERIAL PRIMARY KEY,
 elevator_name varchar(50) NOT NULL,
 elevator_desc text NOT NULL
 
);



-- ************************************** elevator_passenger


CREATE TABLE elevator_passenger
(
 elevator_passenger_id SERIAL PRIMARY KEY,
 passenger_desc        varchar(50) NOT NULL
);



-- ************************************** elevator_passenger_action

CREATE TABLE elevator_passenger_action
(
 elevator_passenger_action_id SERIAL PRIMARY KEY,
 action_desc                  varchar(50) NOT NULL
);



-- ************************************** elevator_arrivals


CREATE TABLE elevator_arrivals
(
 elevator_arrival_id SERIAL PRIMARY KEY ,
 elevator_id         integer NOT NULL,
 passenger_cnt       integer NOT NULL,
 waiting_cnt         integer NOT NULL,
 arrival_dt          timestamp NOT NULL,
 departure_dt        timestamp NOT NULL,
 floor_nr            integer NOT NULL
);

ALTER TABLE elevator_arrivals 
    ADD CONSTRAINT FK_elevator_arrivals_elevator_id 
    FOREIGN KEY  ( elevator_id ) 
    REFERENCES elevator ( elevator_id );



-- ************************************** elevator_journey

CREATE TABLE elevator_journey
(
 elevator_journey_id          SERIAL PRIMARY KEY,
 elevator_passenger_id        integer NOT NULL,
 elevator_arrival_id          integer NULL,
 elevator_passenger_action_id integer NOT NULL
);



ALTER TABLE elevator_journey ADD CONSTRAINT FK_elevator_journey_elevator_arrival_id FOREIGN KEY ( elevator_arrival_id ) REFERENCES elevator_arrivals ( elevator_arrival_id );
ALTER TABLE elevator_journey ADD CONSTRAINT FK_elevator_journey_elevator_passenger_id FOREIGN KEY ( elevator_passenger_id ) REFERENCES elevator_passenger ( elevator_passenger_id );
ALTER TABLE elevator_journey ADD CONSTRAINT FK_elevator_journey_elevator_passenger_action_id FOREIGN KEY ( elevator_passenger_action_id ) REFERENCES elevator_passenger_action ( elevator_passenger_action_id );



CREATE INDEX idx_elevator_journey_elevator_arrival_id ON elevator_journey
(
 elevator_arrival_id
);

CREATE INDEX idx_elevator_journey_elevator_passenger_id ON elevator_journey
(
 elevator_passenger_id
);

CREATE INDEX idx_elevator_journey_elevator_passenger_action_id ON elevator_journey
(
 elevator_passenger_action_id
);



-- ************************************** elevator_wait

CREATE TABLE elevator_wait
(
 elevator_wait_id    serial PRIMARY KEY,
 elevator_journey_id integer NOT NULL,
 arrival_dt          timestamp NOT NULL,
 departure_dt        timestamp NOT NULL,
 
 CONSTRAINT FK_elevator_wait_elevator_journey_id FOREIGN KEY ( elevator_journey_id ) REFERENCES elevator_journey ( elevator_journey_id )
);

CREATE INDEX idx_elevator_wait_elevator_journey_id ON elevator_wait
(
 elevator_journey_id
);








