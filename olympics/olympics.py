#!/usr/bin/env python3
"""
olympics.py
Doug Pham
10/18/22

Program that runs in command line and uses psycopg2 to connect 
to Postgresql database to query olympics.py data with implemented 
functions
"""

import sys
import psycopg2
import config

def get_connection():
    try:
        return psycopg2.connect(database=config.database,
                                user=config.user,
                                password=config.password)
    except Exception as e:
        print(e, file=sys.stderr)
        exit()

#Function to get all athletes from a inputted noc
def get_athletes(noc):
    athletes = []
    try:
        # Execute the query
        connection = get_connection()
        cursor = connection.cursor()

        # Create a "cursor", which is an object with which you can iterate
        # over query results.
        query = '''SELECT DISTINCT athletes.name 
                FROM athletes, athletes_countries, countries 
                WHERE athletes.id = athletes_countries.athlete_id
                AND countries.id = athletes_countries.noc_id
                AND countries.noc = %s;'''

        cursor.execute(query, (noc,))

        # Iterate over the query results to produce the list of author names.
        for row in cursor:
            name = row[0]
            athletes.append(f'{name}')

    except Exception as e:
        print(e, file=sys.stderr)

    connection.close()
    return athletes

#Function to get number of gold medals each noc has won
def get_noc():
    nocs = []
    try:
        connection = get_connection()
        cursor = connection.cursor()

        query = '''SELECT countries.noc, COUNT(results.medal)
                FROM countries, nocs_medals, results
                WHERE countries.id = nocs_medals.noc_id
                AND results.id = nocs_medals.medal_id
                AND results.medal = 'Gold'
                GROUP BY countries.noc;
                '''
        cursor.execute(query)

        for row in cursor:
            country = row[0]
            num = row[1]
            nocs.append(f'{country} {num}')

    except Exception as e:
        print(e, file=sys.stderr)

    connection.close()
    return nocs

#Function to get number of gold medals each noc has won in decreasing order
def get_sorted_noc():
    nocs = []
    try:

        connection = get_connection()
        cursor = connection.cursor()

        query = '''SELECT countries.noc, COUNT(results.medal)
                FROM countries, nocs_medals, results
                WHERE countries.id = nocs_medals.noc_id
                AND results.id = nocs_medals.medal_id
                AND results.medal = 'Gold'
                GROUP BY countries.noc
                ORDER BY COUNT(results.medal) DESC;
                '''
        cursor.execute(query)

        for row in cursor:
            country = row[0]
            num = row[1]
            nocs.append(f'{country} {num}')

    except Exception as e:
        print(e, file=sys.stderr)

    connection.close()
    return nocs

#Function to get all events a specified athlete participated in, in an inputted year
def get_athlete_event(year, name):
    event_year = []
    try:
        # Create a "cursor", which is an object with which you can iterate
        # over query results.
        connection = get_connection()
        cursor = connection.cursor()

        # Execute the query
        query = '''SELECT athletes.name, events.event
                FROM athletes, event_results, events
                WHERE athletes.id = event_results.athlete_id
                AND event_results.event_id = events.id
                AND event_results.year = %s
                AND athletes.name = %s;
                '''
        cursor.execute(query, (year, name, ))

        for row in cursor:
            name = row[0]
            event = row[1]
            event_year.append(f'{name} {event}')

    except Exception as e:
        print(e, file=sys.stderr)

    connection.close()
    return event_year


#Reads command line and runs appropriate functions otherwise prints error statement if input is invalid
def main():
    if (len(sys.argv) < 2):
        print("Insufficient amount of arguments, type '--help' to see usage.txt file")

    elif (len(sys.argv) > 4):
        print("Too many arguments provided, type '--help' to see usage.txt")

    elif sys.argv[1] == "--help":
        if (len(sys.argv) > 2):
            print("Too many arguments provided, type '--help' to see usage.txt")
        else:
            file = open("usage.txt", "r")
            print(file.read())

    elif sys.argv[1] == "athlete":
        if len(sys.argv) == 3:
            noc = sys.argv[2]
            athletes = get_athletes(noc)
            for athlete in athletes:
                print(athlete)
        else:
            print("Invalid input, type '--help' to see usage.txt")
        

    elif sys.argv[1] == "noc_gold":
        if (len(sys.argv) > 3):
            print("Too many arguments provided, type '--help' to see usage.txt")
        elif (len(sys.argv) == 2):
            #print out non-sorted nocs (may remove)
            nocs = get_noc()
            for noc in nocs:
                print(noc)
        elif sys.argv[2] == "--sort":
            nocs = get_sorted_noc()
            for noc in nocs:
                print(noc)
        else:
            print("Incorrect format, type '--help' to see usage.txt file")
    
    elif sys.argv[1] == "event":
        if len(sys.argv) == 4:
            year = sys.argv[2]
            name = sys.argv[3]
            event_year = get_athlete_event(year, name)
            for event in event_year:
                print(event)
        else:
            print("Invalid input, type '--help' to see usage.txt file")

    else:
        print("Incorrect format, type '--help' to see usage.txt file")



if __name__ == '__main__':
    main()
