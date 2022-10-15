'''
convert.py

Doug Pham
October 10, 2022

This program creates separate csv files for the different fields in the athlete_events.csv file
into organize tables to be used in SQL

Since the fields sex, age, height, and weight can change between the different Olympic years,
I created their own csv and table

NOTE - The following fields are ignored in the athlete_events.csv file:

    Year is repeated in Games field but we are asked to sort by year so we will not ignore
    Season (column 10) field is ignored since it is exactly repeated in the Games field
    Sport (column 12) field is ignored since it is exactly repeated in the Event field
'''

import csv

athletes = {}
with open('athlete_events.csv') as original_data_file,\
        open('athletes.csv', 'w') as athletes_file:
    reader = csv.reader(original_data_file)
    writer = csv.writer(athletes_file, lineterminator='\n')
    heading_row = next(reader) # eat up and ignore the heading row of the data file
    for row in reader:
        athlete_id = row[0]
        athlete_name = row[1]
        if athlete_id not in athletes:
            athletes[athlete_id] = athlete_name
            writer.writerow([athlete_id, athlete_name])


events = {}
with open('athlete_events.csv') as original_data_file,\
        open('events.csv', 'w') as events_file:
    reader = csv.reader(original_data_file)
    writer = csv.writer(events_file, lineterminator= '\n')
    heading_row = next(reader) # eat up and ignore the heading row of the data file
    for row in reader:
        event_name = row[13]
        if event_name not in events:
            event_id = len(events) + 1
            events[event_name] = event_id
            writer.writerow([event_id, event_name])

countries = {}
with open('athlete_events.csv') as original_data_file,\
        open('countries.csv', 'w') as countries_file:
    reader = csv.reader(original_data_file)
    writer = csv.writer(countries_file, lineterminator= '\n')
    heading_row = next(reader)
    for row in reader:
        country_noc = row[7]
        if country_noc not in countries:
            country_id = len(countries) + 1
            country_team = row[6]
            countries[country_noc] = country_id
            writer.writerow([country_id, country_team, country_noc])

settings = {}
with open('athlete_events.csv') as original_data_file,\
        open('settings.csv', 'w') as settings_file:
    reader = csv.reader(original_data_file)
    writer = csv.writer(settings_file, lineterminator= '\n')
    heading_row = next(reader)
    for row in reader:
        games = row[8]
        if games not in settings:
            games_id = len(settings) + 1
            games_city = row[11]
            games_year = row [9]
            settings[games] = games_id
            writer.writerow([games_id, games, games_city, games_year])

results = {}
with open ('athlete_events.csv') as original_data_file,\
        open('results.csv', 'w') as results_file:
    reader = csv.reader(original_data_file)
    writer = csv.writer(results_file, lineterminator= '\n')
    heading_row = next(reader)
    for row in reader:
        medal = row[14]
        if medal not in results:
            medal_id = len(results) + 1
            results[medal] = medal_id
            writer.writerow([medal_id, medal])

genders = {}
with open ('athlete_events.csv') as original_data_file,\
        open('genders.csv', 'w') as genders_file:
    reader = csv.reader(original_data_file)
    writer = csv.writer(genders_file, lineterminator= '\n')
    heading_row = next(reader)
    for row in reader:
        sex = row[2]
        if sex not in genders:
            sex_id = len(genders) + 1
            genders[sex] = sex_id
            writer.writerow([sex_id, sex])

ages = {}
with open ('athlete_events.csv') as original_data_file,\
        open('ages.csv', 'w') as ages_file:
    reader = csv.reader(original_data_file)
    writer = csv.writer(ages_file, lineterminator= '\n')
    heading_row = next(reader)
    for row in reader:
        years_old = row[3]
        if years_old not in ages:
            years_old_id = len(ages) + 1
            ages[years_old] = years_old_id
            writer.writerow([years_old_id, years_old])

heights = {}
with open ('athlete_events.csv') as original_data_file,\
        open('heights.csv', 'w') as heights_file:
    reader = csv.reader(original_data_file)
    writer = csv.writer(heights_file, lineterminator= '\n')
    heading_row = next(reader)
    for row in reader:
        units = row[4]
        if units not in heights:
            units_id = len(heights) + 1
            heights[units] = units_id
            writer.writerow([units_id, units])

weights = {}
with open ('athlete_events.csv') as original_data_file,\
        open('weights.csv', 'w') as weights_file:
    reader = csv.reader(original_data_file)
    writer = csv.writer(weights_file, lineterminator= '\n')
    heading_row = next(reader)
    for row in reader:
        kgs = row[4]
        if kgs not in weights:
            kgs_id = len(weights) + 1
            weights[kgs] = kgs_id
            writer.writerow([kgs_id, kgs])

athletes_countries = {}
with open ('athlete_events.csv') as original_data_file,\
        open('athletes_countries.csv', 'w') as athletes_countries_file:
    reader = csv.reader(original_data_file)
    writer = csv.writer(athletes_countries_file, lineterminator= '\n')
    heading_row = next(reader)
    for row in reader:
        name = row[1]
        if name not in athletes_countries:
            id = len(athletes_countries) + 1
            country = row[6]
            medal = row[14]
            event = row[13]
            year = row[9]
            athletes_countries[name] = id
            writer.writerow([id, name, country, event, year, medal])

nocs_medals = {}
with open ('athlete_events.csv') as original_data_file,\
        open('nocs_medals.csv', 'w') as nocs_medals_file:
    reader = csv.reader(original_data_file)
    writer = csv.writer(nocs_medals_file, lineterminator= '\n')
    heading_row = next(reader)
    for row in reader:
        noc = row[7]
        if noc not in nocs_medals:
            id = len(nocs_medals) + 1
            medals = row[14]
            nocs_medals[medals] = id
            writer.writerow([id, noc, medals])