

/*Analysis per passenger*/

-- waiting time per passenger and their journey:

SELECT 
	p.passenger_desc
	, arrival_dt
	, departure_dt
	FROM public.elevator_wait as W
	join public.elevator_journey as j
		on w.elevator_journey_id = j.elevator_journey_id
	join public.elevator_passenger	as p
		on j.elevator_passenger_id = p.elevator_passenger_id
;

-- Trips of each passenger

SELECT 
	p.passenger_desc
	, a.arrival_dt
	, a.departure_dt
	, a.floor_nr
	, pact.action_desc
	, j.elevator_journey_id
	FROM public.elevator_journey as j
	join public.elevator_arrivals as a
		on j.elevator_arrival_id = a.elevator_arrival_id
	join public.elevator_passenger	as p
		on j.elevator_passenger_id = p.elevator_passenger_id
	join public.elevator_passenger_action as pact
		on j.elevator_passenger_action_id = pact.elevator_passenger_action_id
order by p.passenger_desc, a.arrival_dt
;
