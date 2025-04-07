select AVG(numberOfweeks) as 'Week Average'
from
shelter.LocationSeasonal
where seasonId = :seasonId
and genderId = :genderId