
--------- elevator_arrivals

insert into    elevator_arrivals (
    elevator_id, 
    passenger_cnt, 
    waiting_cnt, 
    arrival_dt, 
    departure_dt, 
    floor_nr
  )
values
  (
    1, 
    3, 
    2, 
    '2021-09-02 22:30:40', 
    '2021-09-02 22:30:50', 
    2
  );


insert into    elevator_arrivals (
    elevator_id, 
    passenger_cnt, 
    waiting_cnt, 
    arrival_dt, 
    departure_dt, 
    floor_nr
  )
values
  (
    1, 
    5, 
    0, 
    '2021-09-02 22:31:00', 
    '2021-09-02 22:31:20', 
    3
  );

insert into    elevator_arrivals (
    elevator_id, 
    passenger_cnt, 
    waiting_cnt, 
    arrival_dt, 
    departure_dt, 
    floor_nr
  )
values
  (
    1, 
    4, 
    0, 
    '2021-09-02 22:31:40', 
    '2021-09-02 22:32:00', 
    4
  );

insert into    elevator_arrivals (
    elevator_id, 
    passenger_cnt, 
    waiting_cnt, 
    arrival_dt, 
    departure_dt, 
    floor_nr
  )
values
  (
    1, 
    2, 
    1, 
    '2021-09-02 22:32:30', 
    '2021-09-02 22:33:00', 
    5
  );

insert into    elevator_arrivals (
    elevator_id, 
    passenger_cnt, 
    waiting_cnt, 
    arrival_dt, 
    departure_dt, 
    floor_nr
  )
values
  (
    1, 
    3, 
    4, 
    '2021-09-02 22:33:30', 
    '2021-09-02 22:34:00', 
    6
  );


-- empty run
insert into    elevator_arrivals (
    elevator_id, 
    passenger_cnt, 
    waiting_cnt, 
    arrival_dt, 
    departure_dt, 
    floor_nr
  )
values
  (
    1, 
    0, 
    0, 
    '2021-09-02 22:34:00', 
    '2021-09-02 22:36:00', 
    1
  );

------------ elevator_wait + elevator_journey
-- passenger 1, wait
insert into    elevator_journey (
    elevator_passenger_id, 
    elevator_arrival_id, 
    elevator_passenger_action_id
  )
values
  (
    1, 
    1 , 
    1
  );
insert into    elevator_wait (
    elevator_journey_id, 
    arrival_dt, 
    departure_dt
  )
values
  (
    1, 
    '2021-09-02 22:25:10', 
    '2021-09-02 22:30:40'
  );

-- passenger 1, enter
insert into    elevator_journey (
    elevator_passenger_id, 
    elevator_arrival_id, 
    elevator_passenger_action_id
  )
values
  (
    1, 
    1 , 
    2
  );

-- passenger 1, exit
insert into    elevator_journey (
    elevator_passenger_id, 
    elevator_arrival_id, 
    elevator_passenger_action_id
  )
values
  (
    1, 
    1 , 
    3
  );

-- passenger 2, wait
insert into    elevator_journey (
    elevator_passenger_id, 
    elevator_arrival_id, 
    elevator_passenger_action_id
  )
values
  (
    2, 
    2 , 
    1
  );
  


-- passenger 2, enter
insert into    elevator_journey (
    elevator_passenger_id, 
    elevator_arrival_id, 
    elevator_passenger_action_id
  )
values
  (
    2, 
    2 , 
    2
  );

-- passenger 2, exit
insert into    elevator_journey (
    elevator_passenger_id, 
    elevator_arrival_id, 
    elevator_passenger_action_id
  )
values
  (
    2, 
    4, 
    3
  );
insert into    elevator_wait (
    elevator_journey_id, 
    arrival_dt, 
    departure_dt
  )
values
  (
    4, 
    '2021-09-02 22:29:00', 
    '2021-09-02 22:31:00'
  );


-- passenger 3, wait
insert into    elevator_journey (
    elevator_passenger_id, 
    elevator_arrival_id, 
    elevator_passenger_action_id
  )
values
  (
    3, 
    1, 
    1
  );
  


-- passenger 3, enter
insert into    elevator_journey (
    elevator_passenger_id, 
    elevator_arrival_id, 
    elevator_passenger_action_id
  )
values
  (
    3, 
    1 , 
    2
  );

-- passenger 3, exit
insert into    elevator_journey (
    elevator_passenger_id, 
    elevator_arrival_id, 
    elevator_passenger_action_id
  )
values
  (
    3, 
    5, 
    3
  );
insert into    elevator_wait (
    elevator_journey_id, 
    arrival_dt, 
    departure_dt
  )
values
  (
    7, 
    '2021-09-02 22:34:00', 
    '2021-09-02 22:34:00'
  );