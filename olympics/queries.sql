"""

queries.sql
Doug Pham
October 13, 2022


List all the NOCs (National Olympic Committees), in alphabetical order by abbreviation. 
These entities, by the way, are mostly equivalent to countries. But in some cases, you 
might find that a portion of a country participated in a particular games (e.g. one guy 
from Newfoundland in 1904) or some other oddball situation.
"""
SELECT countries.noc
FROM countries
ORDER BY countries.noc;


--List the names of all the athletes from Jamaica. If your database design allows it, 
--sort the athletes by last name.


SELECT DISTINCT athletes.name 
FROM athletes, athletes_countries 
WHERE athletes.id = athletes_countries.athlete_id 
AND athletes_countries.country = 'Jamaica';




--List all the medals won by Greg Louganis, sorted by year. Include whatever fields in 
--this output that you think appropriate.

SELECT events.event, event_results.medal, event_results.year
FROM athletes, event_results, events
WHERE event_results.athlete_id = athletes.id
AND athletes.name = 'Gregory Efthimios "Greg" Louganis'
AND event_results.event_id = events.id
AND event_results.medal = 'Gold'
ORDER BY event_results.year;



--List all the NOCs and the number of gold medals they have won, in decreasing order
--of the number of gold medals

SELECT countries.noc, COUNT(results.medal)
FROM countries, nocs_medals, results
WHERE countries.id = nocs_medals.noc_id
AND results.id = nocs_medals.medal_id
AND results.medal = 'Gold'
GROUP BY countries.noc
ORDER BY COUNT(results.medal) DESC;
