/* Averages analysis*/

-- average waiting time for lift to arrive

SELECT 
	avg(extract(epoch FROM(departure_dt - arrival_dt))) as average_wait_seconds
	FROM public.elevator_wait as W


-- average travelled floors

SELECT 
	round(avg( abs(E.floor_nr - S.floor_nr)), 2) as average_floors_travelled
FROM
		(
		SELECT
			j.elevator_passenger_id
			, a.floor_nr
			FROM public.elevator_journey as j
			join public.elevator_arrivals as a
				on j.elevator_arrival_id = a.elevator_arrival_id
			join public.elevator_passenger_action as pact
				on j.elevator_passenger_action_id = pact.elevator_passenger_action_id
			where pact.action_desc = 'enter'
		)	as S
join 
		(
		SELECT
			j.elevator_passenger_id
			, a.floor_nr
			FROM public.elevator_journey as j
			join public.elevator_arrivals as a
				on j.elevator_arrival_id = a.elevator_arrival_id
			join public.elevator_passenger_action as pact
				on j.elevator_passenger_action_id = pact.elevator_passenger_action_id
			where pact.action_desc = 'exit'
		)	as E	
on S.elevator_passenger_id = E.elevator_passenger_id


-- average elevator travel time between stops
select
	ELEVATOR_ID,
	avg(extract(epoch FROM(next_arr - DEPARTURE_DT))) as average_time_bew_stops
	from
	(
		SELECT ELEVATOR_ARRIVAL_ID,
			ELEVATOR_ID,
			DEPARTURE_DT,
			lead(ARRIVAL_DT) OVER (partition by ELEVATOR_ID order by ELEVATOR_ARRIVAL_ID) as next_arr
		FROM PUBLIC.ELEVATOR_ARRIVALS
	) as src
	group by ELEVATOR_ID


