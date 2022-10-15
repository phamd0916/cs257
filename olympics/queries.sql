'''

queries.sql
Doug Pham
October 13, 2022


'''

'''
List all the NOCs (National Olympic Committees), in alphabetical order by abbreviation. 
These entities, by the way, are mostly equivalent to countries. But in some cases, you 
might find that a portion of a country participated in a particular games (e.g. one guy 
from Newfoundland in 1904) or some other oddball situation.
'''
SELECT countries.noc
FROM countries
ORDER BY countries.noc;


'''
List the names of all the athletes from Jamaica. If your database design allows it, 
sort the athletes by last name.
'''
SELECT DISTINCT athletes_countries.name, athletes_countries.country
FROM athletes_countries
WHERE athletes_countries.country = 'Jamaica';



'''
List all the medals won by Greg Louganis, sorted by year. Include whatever fields in 
this output that you think appropriate.
'''
SELECT athletes_countries.name, athletes_countries.event athletes_countries.medal, athletes_countries.year
FROM athletes_countries
WHERE athletes_countries.name = 'Gregory Efthimios "Greg" Louganis'
ORDER BY athletes_countries.year;



'''
List all the NOCs and the number of gold medals they have won, in decreasing order
of the number of gold medals
'''
SELECT nocs_medals.noc, COUNT(nocs_medals.medals)
FROM nocs_medals
WHERE nocs_medals.medals = 'Gold'
GROUP BY nocs_medals.noc
ORDER BY COUNT(nocs_medals.medals) DESC;
