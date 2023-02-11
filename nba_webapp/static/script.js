/*
 * books.js
 * Jeff Ondich, 27 April 2016
 * Updated, 5 November 2020
 *
 * A little bit of Javascript showing one small example of AJAX
 * within the "books and authors" sample for Carleton CS257.
 *
 * This example uses a very simple-minded approach to Javascript
 * program structure. We'll talk more about this after you get
 * a feel for some Javascript basics.
 */

window.onload = initialize;

function initialize() {

    var show = document.getElementById("basketball_image");
    //show.style.visibility="visible";
    var show_caption = document.getElementById("welcome");
    //show_caption.style.visibility="visible";

    var search_players_go = document.getElementById('player_search_bar_go');
    search_players_go.onclick = SearchPlayers;

    var instant_compare = document.getElementById('instant_compare');
    instant_compare.onclick = InstantCompare;

    console.log('hello??');

    var sort_selector = document.getElementById('sort_by_selector');
    console.log(sort_selector);
    //sort_selector.onchange = onSortSelectionChanged;


    var players_by_assists = document.getElementById('players_by_assists');
    var players_by_blocks = document.getElementById('players_by_blocks');
    var players_by_fouls = document.getElementById('players_by_fouls');
    var players_by_turnovers_caused = document.getElementById('players_by_turnovers_caused');
    var players_by_fts = document.getElementById('players_by_fts');
    var players_by_violations = document.getElementById('players_by_violations');
    var players_by_threes = document.getElementById('players_by_threes');
    console.log(players_by_violations)
    console.log(players_by_threes)
    players_by_assists.onclick = Assists;
    players_by_blocks.onclick = Blocks;
    players_by_fouls.onclick = Fouls;
    players_by_turnovers_caused.onclick = TOsCaused;
    players_by_fts.onclick = FTs;
    players_by_violations.onclick = Violations;
    players_by_threes.onclick = Threes;

    console.log('thing')
    console.log(loadTeamSelector)
    loadTeamSelector();
    // gameCategory();



    let element = document.getElementById('team_selector');
    if (element) {
        element.onchange = onTeamSelectionChanged;

    }


    // Returns the base URL of the API, onto which endpoint components can be appended.
    function getAPIBaseURL() {
        var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
        return baseURL;
    }
    function Blocks() {
        var url = getAPIBaseURL() + '/players/search?sort=blocks';
        playerQuery('Blocks', url, 'blocks');
    }
    function Assists() {
        console.log('sort by assists clicked...');
        var url = getAPIBaseURL() + '/players/search?sort=assists';
        playerQuery('Assists', url, 'assists');
    }
    function FTs() {
        var url = getAPIBaseURL() + '/players/search?sort=blocks';
        playerQuery('Free Throw %', url, 'ft_makes', 'ft_attempts');
    }
    function Threes() {
        console.log("thre query start");
        var url = getAPIBaseURL() + '/players/search?sort=threes';
        playerQuery('Three %', url, 'three_makes', 'three_attempts');
    }
    function Fouls() {
        var url = getAPIBaseURL() + '/players/search?sort=fouls';
        playerQuery('Fouls', url, 'fouls');
    }
    function Violations() {
        console.log("violations called");
        var url = getAPIBaseURL() + '/players/search?sort=vs';
        playerQuery('Violations', url, 'vs');
    }
    function TOsCaused() {
        var url = getAPIBaseURL() + '/players/search?sort=tos_caused';
        playerQuery('Turnovers Caused', url, 'tos_caused');
    }
    function CompareGo() {
        console.log("compare --");
        checkboxes = document.getElementsByClassName('compare_box');
        console.log(checkboxes.length);
        compare_ids = [];
        for (k = 0; k < checkboxes.length; k++) {
            if (checkboxes[k].checked) {
                //console.log(k);
                //console.log(checkboxes[k].id);
                compare_ids.push(parseInt(checkboxes[k].id.replace('CBID_', '')));
            }
        }
        console.log(compare_ids);
        if (compare_ids.length > 5) {
            //too many elements
            window.alert('The maximum number of players to compare is 5. You provided ' + compare_ids.length);
            compare_ids.length = 5;
        }
        console.log(compare_ids);
        if (compare_ids.length == 0) {
            window.alert('Please select players to compare');
            return;
        }
        console.log('querying...');
        comparePlayers(compare_ids);
    }
    function InstantCompare() {
        search_input = document.getElementById("search");
        console.log(search_input.value);
        url = getAPIBaseURL() + '/players/search?q=' + search_input.value;
        fetch(url, { method: 'get' })
            .then((response) => response.json())


            .then(function (playerResults) {

                ids = [];
                for (var k = 0; k < playerResults.length; k++) {
                    ids.push(playerResults[k]['id']);
                }
                console.log(ids);
                if (ids.length > 5) {
                    //too many elements
                    window.alert('Query returned more than 5 results (' + ids.length + '). Results will be limited to first 5 results.');
                    ids.length = 5;
                }
                comparePlayers(ids);
                ids.length = 0;
            })
            .catch(function (error) {
                console.log(error);
            });

    }

    function SearchPlayers() {
        search_input = document.getElementById("search");
        console.log(search_input.value);
        url = getAPIBaseURL() + '/players/search?q=' + search_input.value;
        fetch(url, { method: 'get' })
            .then((response) => response.json())


            .then(function (playerResults) {

                console.log('resonce found');
                console.log(playerResults.length);
                tableBody = "<tr><td><h1>Team</h1></td><td><h1>Player</h1></td><td>Compare</td></tr>";

                //tableBody += '<td>=' + rank + ' | ' + k + '</td>';
                for (k = 0; k < playerResults.length; k++) {
                    tableBody += '<td>' + playerResults[k]['team'] + '</td>';

                    tableBody += '<td><a onclick="comparePlayers([' + playerResults[k]['id'] + "],'"
                        + playerResults[k]['name'] + ' ' + playerResults[k]['name'] + "')\">"
                        + playerResults[k]['name'] + '</a></td>';


                    tableBody += '<td><center><input type=checkbox id=CBID_' + playerResults[k].id + ' class="compare_box"></td ></center ></tr > ';
                }

                writeTable(tableBody);
                writeCompareBar();

            })
            .catch(function (error) {
                console.log(error);
            });

    }

    function writeTable(tableBody) {
        var resultsTableElement = document.getElementById('results_table');
        if (resultsTableElement) {
            //console.log(tableBody);
            resultsTableElement.innerHTML = tableBody;
        }
        writeCompareBar(true);

    }

    function writeCompareBar(blank = false) {
        var ulElement = document.getElementById('compare_list');
        if (ulElement) {
            if (blank) {
                ulElement.innerHTML = '';
            }
            else {
                ulElement.innerHTML = '<li><a id="compare_bar">Compare Selected Players</a></li>';
                compare_bar = document.getElementById('compare_bar');
                compare_bar.onclick = CompareGo;
            }

        }


    }


    function playerQuery(title, url, sort_by_arg, sort_by_arg2 = false) {

        console.log('pq nm 1: ' + sort_by_arg + ' 2 ' + sort_by_arg2);

        playerQueryMain(title, url, sort_by_arg, sort_by_arg2);


        var compare_bar = document.getElementById('compare_bar');
        compare_bar.onclick = CompareGo;

    }

    function playerQueryMain(title, url, sort_by_arg, sort_by_arg2) {
        fetch(url, { method: 'get' })

            .then((response) => response.json())


            .then(function (playerList) {

                console.log('resonce found' + sort_by_arg + ' 2:' + sort_by_arg2);
                console.log(playerList.length);
                data = [];
                tableBody = "<tr><td><h1>Rank</h1></td><td><h1>Team</h1></td><td><h1>Player</h1></td>";
                for (k = 0; k < playerList.length; k++) {
                    if (sort_by_arg2) {
                        console.log('2 sorting args...');
                        data.push(playerList[k][sort_by_arg] / playerList[k][sort_by_arg2]);
                    }
                    else {
                        data.push(playerList[k][sort_by_arg]);
                    }
                }
                if (sort_by_arg2) {
                    tableBody += '<td><h1 class = \"capitalize\">' + sort_by_arg.replace('_makes', ' %') + '</h1></td><td>Makes</td><td>Attempts</td><td>Compare</td></tr>';
                }
                else {
                    tableBody += '<td><h1 class = \"capitalize\">' + title + '</h1></td><td>Compare</td></tr>';
                }

                rank = 1;
                for (var k = 0; k < data.length; k++) {
                    tableBody += '<tr>';



                    if (k > 0) {
                        if (data[k] < data[k - 1]) {
                            rank = 1;
                        }
                        else {
                            rank++;
                        }
                    }
                    else {
                        rank = 1;
                    }
                    if (rank <= 1) {
                        if (k == data.length - 1) {
                            tableBody += '<td>' + (k - rank + 2) + '</td>';
                        }
                        else {
                            if (data[k] == data[k + 1]) {
                                tableBody += '<td>=' + (k - rank + 2) + '</td>';
                            }
                            else {

                                tableBody += '<td>' + (k - rank + 2) + '</td>';
                            }
                        }
                    }
                    else {
                        //tableBody += '<td>=' + (k - rank + 2) + '</td>';
                        tableBody += '<td></td>';
                    }
                    //tableBody += '<td>=' + rank + ' | ' + k + '</td>';
                    tableBody += '<td>' + playerList[k]['team'] + '</td>';

                    tableBody += '<td><a onclick="comparePlayers([' + playerList[k]['id'] + "],'"
                        + playerList[k]['name'] + ' ' + playerList[k]['name'] + "')\">"
                        + playerList[k]['name'] + '</a></td>';

                    if (sort_by_arg2) {
                        pct = ((data[k] * 100) + "").substring(0, 5) + "%";
                        tableBody += '<td>' + pct + '</td>';
                        tableBody += '<td>' + playerList[k][sort_by_arg] + '</td>';
                        tableBody += '<td>' + playerList[k][sort_by_arg2] + '</td>';
                    }
                    else {
                        tableBody += '<td>' + data[k] + '</td>';
                    }


                    tableBody += '<td><center><input type=checkbox id=CBID_' + playerList[k].id + ' class="compare_box"></td ></center ></tr > ';
                }
                //tableBody += '<ul class="vertical-navbar"><li><a id="compare_bar">(broken compare)</a></li></ul>';
                writeTable(tableBody);
                writeCompareBar();
            })
            .catch(function (error) {
                console.log(error);
            });
    }


    function comparePlayers(playerIDs) {
        // Very similar pattern to onAuthorsButtonClicked, so I'm not
        // repeating those comments here. Read through this code
        // and see if it makes sense to you.
        var url = getAPIBaseURL() + '/players/details/' + playerIDs;

        fetch(url, { method: 'get' })

            .then((response) => response.json())

            .then(function (playersList) {

                var tableBody = '<tr><th>Name</th>';
                for (var k = 0; k < playersList.length; k++) {
                    tableBody += "<th>" + playersList[k]['name'] + "</th>";
                }

                tableBody += '<tr><td>Team</td>';
                for (var k = 0; k < playersList.length; k++) {
                    tableBody += "<td>" + playersList[k]['team'] + "</td>";
                }

                tableBody += '<tr><td>Assists</td>' + basic_stat_row_gen(playersList, "assists");

                tableBody += '<tr><td>Blocks</td>' + basic_stat_row_gen(playersList, "blocks");

                tableBody += '<tr><td>Fouls</td>' + basic_stat_row_gen(playersList, "fouls", true);

                //broken rows commented out
                //tableBody += '<tr><td>Fouled</td>' + basic_stat_row_gen(playersList, "fouled");

                //tableBody += '<tr><td>Rebounds</td>' + basic_stat_row_gen(playersList, "rbs");

                tableBody += '<tr><td>Violations</td>' + basic_stat_row_gen(playersList, "vs", true);

                //tableBody += '<tr><td>Turnovers</td>' + basic_stat_row_gen(playersList, "tos", true);

                tableBody += '<tr><td>Turnovers Caused</td>' + basic_stat_row_gen(playersList, "tos_caused");


                tableBody += "</tr><tr><td>3 point % </td>";
                tableBody += pct_gen(playersList, "three");

                tableBody += "</tr><tr><td>Layup % </td>";
                tableBody += pct_gen(playersList, "layup");

                tableBody += "</tr><tr><td>Jump % </td>";
                tableBody += pct_gen(playersList, "jumper");

                //currently broken: (see to do)
                // tableBody += "</tr><tr><td>hook % </td>";
                // tableBody += pct_gen(playersList, "hook");

                // tableBody += "</tr><tr><td>dunk % </td>";
                // tableBody += pct_gen(playersList, "dunk");            

                //tableBody += "</tr><tr><td>free throw % </td>";
                //tableBody += pct_gen(playersList, "ft");


                writeTable(tableBody);

                //Bar();
            })

            .catch(function (error) {
                console.log(error);
            });
    }



    function basic_stat_row_gen(playersList, stat, reverse = false) {
        output = "";
        stat_list = [];
        for (k = 0; k < playersList.length; k++) {
            stat_list.push(playersList[k][stat])
        }
        if (reverse) {
            console.log("reverse" + stat);
            min_arr = max(stat_list);
            max_arr = min(stat_list);
        }
        else {
            max_arr = max(stat_list);
            min_arr = min(stat_list);
        }
        for (var k = 0; k < playersList.length; k++) {
            if (max_arr.includes(k) && playersList.length > 1) {
                output += "<td class = \"winner\">" + stat_list[k] + "</td>";
            }
            else if ((min_arr.includes(k) || stat[k] == 0) && playersList.length > 1) {
                console.log(min_arr);
                output += "<td class = \"loser\">" + stat_list[k] + "</td>";
            }
            else {
                output += "<td>" + stat_list[k] + "</td>";
            }
        }
        return output;
    }

    function pct_gen(playersList, type) {
        attempts = type + "_attempts";
        makes = type + "_makes";
        tableBody = "";
        var pcts = [];
        var pcts_strings = [];
        for (var k = 0; k < playersList.length; k++) {

            var pct;

            if (playersList[k][attempts] > 0) {
                var pct = playersList[k][makes] / playersList[k][attempts] * 100;
                //cts.push(parseInt(pct));
                pcts.push(pct);
                pct = pct + "";
                pct = pct.substring(0, 5) + "%";
                pct.replace(' ', '');
                //pct = "" + playersList[k]['makes'] + "/" + playersList[k]['attempts'] + " (" + pct + ")";
                pct = pct + " (" + playersList[k][makes] + "/" + playersList[k][attempts] + ")";
            }
            else {
                pcts.push(0);
                pct = "" + playersList[k][makes] + "/" + playersList[k][attempts];
            }
            pcts_strings.push(pct);


        }
        max_arr = max(pcts);
        min_arr = min(pcts);
        for (var k = 0; k < playersList.length; k++) {
            if (max_arr.includes(k) && playersList.length > 1) {
                tableBody += "<td class = \"winner\">" + pcts_strings[k] + "</td>";
            }
            else if ((min_arr.includes(k) || pcts[k] == 0) && playersList.length > 1) {
                console.log(min_arr);
                tableBody += "<td class = \"loser\">" + pcts_strings[k] + "</td>";
            }
            else {
                tableBody += "<td>" + pcts_strings[k] + "</td>";
            }
            //tableBody += "<td>" + Math.max(pcts) + ' | ' + pcts[k] + "</td>";
            //console.log(Math.max(float_array));
            //console.log(pcts);
            //console.log(max(pcts));
            //console.log(float_array);
        }
        return tableBody;

    }



    function max(array) {
        var current_max = -1;
        var max_pos = [];
        var i = 0;
        while (i < array.length) {
            if (array[i] > current_max) {
                max_pos = [i];
                current_max = array[i];
            }
            else if (array[i] == current_max) {
                max_pos.push(i);
            }
            i++;
        }
        return max_pos;
    }
    function min(array) {
        var current_min = Infinity;
        var min_pos = [];
        var i = 0;
        while (i < array.length) {
            if (array[i] == 0) {
                min_pos.push(i);
            }
            else if (array[i] < current_min) {
                console.log("reset min");
                min_pos = [];
                min_pos.push(i);
                current_min = array[i];
            }
            else if (array[i] == current_min) {
                console.log("min equal");
                min_pos.push(i);
            }
            i++;
        }
        return min_pos;
    }


    // function gameCategory() {
    //     let body = '';
    //     body += '<option id="players_by_assists"> Assists </option>\n' +
    //                 '<option id="players_by_blocks"> Blocks </option>\n' +
    //                 '<option id="players_by_fouls"> Fouls </option>\n' +
    //                 '<option id="players_by_turnovers_caused"> Turnover Caused </option>\n' +
    //                 '<option id="players_by_violations"> Violations </option>\n' +
    //                 '<option id="players_by_fts"> Free Throws </option>\n' +
    //                 '<option id="players_by_threes"> 3s </option>\n';
        

    //     let selector = document.getElementById('category_selector');
    //     if (selector) {
    //         console.log(body);
    //         selector.innerHTML = body;
    //     }
    // }

    function loadTeamSelector() {
        console.log('Testing')
        let url = getAPIBaseURL() + '/teams/';

        // Send the request to the books API /authors/ endpoint
        fetch(url, { method: 'get' })

            // When the results come back, transform them from a JSON string into
            // a Javascript object (in this case, a list of author dictionaries).
            .then((response) => response.json())

            // Once you have your list of author dictionaries, use it to build
            // an HTML table displaying the author names and lifespan.
            .then(function (teams) {
                // Add the <option> elements to the <select> element
                let selectorBody = '';
                for (let k = 0; k < teams.length; k++) {
                    let team = teams[k];
                    selectorBody += '<option value="' + team['abbreviation'] + '">'
                        + team['abbreviation'] + ': ' + team['name']
                        + '</option>\n'

                }
                let selector = document.getElementById('team_selector');
                if (selector) {
                    console.log(selectorBody);
                    selector.innerHTML = selectorBody;
                }
            })
            .catch(function (error) {
                console.log(error);
            });
    }

    function onSortSelectionChanged() {
        console.log('hello?');
        console.log("id = " + this.value);
    }

    function categoryGameChanged() {

        var players_by_assists = document.getElementById('players_by_assists');
        var players_by_blocks = document.getElementById('players_by_blocks');
        var players_by_fouls = document.getElementById('players_by_fouls');
        var players_by_threes = document.getElementById('players_by_threes');
        var players_by_violations = document.getElementById('players_by_violations');
        var players_by_turnovers_caused = document.getElementById('players_by_turnovers_caused');
        var players_by_fts = document.getElementById('players_by_fts');

        players_by_assists.onchange = Assists;
        players_by_blocks.onchange = Blocks;
        players_by_fts.onchange = FTs;
        players_by_threes.onchange = Threes;
        players_by_fouls.onchange = Fouls;
        players_by_violations.onchange = Violations;
        players_by_turnovers_caused.onchange = TOsCaused;

    //     // '<option id="players_by_assists"> Assists </option>\n' +
    //     //             '<option id="players_by_blocks"> Blocks </option>\n' +
    //     //             '<option id="players_by_fouls"> Fouls </option>\n' +
    //     //             '<option id="players_by_turnovers_caused"> Turnover Caused </option>\n' +
    //     //             '<option id="players_by_violations"> Violations </option>\n' +
    //     //             '<option id="players_by_fts"> Free Throws </option>\n' +
    //     //             '<option id="players_by_threes"> 3s </option>\n';
    }

    function onTeamSelectionChanged() {

        initialize();

        var hide = document.getElementById("basketball_image");
        try {
            hide.style.visibility="hidden";
            var caption = document.getElementById("welcome");
            caption.style.visibility="hidden";
          } 
          catch (error) {
            console.error(error);

          }
        

        let teamID = this.value;
        let url = getAPIBaseURL() + '/teams/team_stat/' + teamID;

        fetch(url, { method: 'get' })

            .then((response) => response.json())

            .then(function (teams) {
                let tableBody = '';
                for (let k = 0; k < teams.length; k++) {
                    let team = teams[k];
                    tableBody += '<tr> <td align="center" colspan="8"> 2019-20 Team Stats <td> <tr>\n'
                        + '<tr>'
                        + '<td> Name </td>'
                        + '<td> Overall Record </td>'
                        + '<td> Home Record </td>'
                        + '<td> Away Record </td>'
                        + '<td> OT Record </td>'
                        + '<td> Points Per Game</td>'
                        + '<td> Rebound Per Game</td>'
                        + '<td> Assists Per Game</td>'
                        + '</tr>\n' +
                        '<tr>'
                        + '<td>' + team['name'] + '</td>'
                        + '<td>' + team['total_wins'] + ' - ' + team['total_losses'] + '</td>'
                        + '<td>' + team['h_wins'] + ' - ' + team['h_losses'] + '</td>'
                        + '<td>' + team['a_wins'] + ' - ' + team['a_losses'] + '</td>'
                        + '<td>' + team['ot_wins'] + ' - ' + team['ot_losses'] + '</td>'
                        + '<td>' + team['points_per_game'] + '</td>'
                        + '<td>' + team['rebounds_per_game'] + '</td>'
                        + '<td>' + team['assists_per_game'] + '</td>'
                        + '</tr>\n';

                }
                let teamsTable = document.getElementById('results_table');
                console.log(teamsTable);
                if (teamsTable) {
                    teamsTable.innerHTML = tableBody;
                }
            })

            .catch(function (error) {
                console.log(error);
            });
    }
}
