CREATE TABLE plays (id SERIAL, game_id integer, current_score_h integer, current_score_a integer, secs_left integer, qrt integer, shooter text, shot_type text, shot_outcome integer, shot_dist integer, asstr text, blkr text, foul_type text, fouler text, fouled text, rebounder text, rb_type text, v_player text, v_type text, to_team text, ft_shooter text, ft_outcome integer, to_player text, to_type text, to_cause text, to_causer text, jb_a_player text, jb_h_player text, jb_pos text, description text);

CREATE TABLE players (id SERIAL, csv_id text, name text, three_attempts integer, three_makes integer, lap_attempts integer, layup_makes integer, jumper_attempts integer, jumper_makes integer, hook_attempts integer, hook_makes integer, blocks integer, fouls integer, fouled integer, rbs integer, vs integer, ft_attempts integer, ft_makes integer, tos integer, tos_caused integer);

CREATE TABLE teams (abbreviation text, name text, wins integer, losses integer, h_wins integer, h_losses integer, a_wins integer, a_losses integer, ot_wins integer, ot_losses integer, points integer, rebounds integer, assists integer);

CREATE TABLE games(id SERIAL, type integer, loc text, date text, time text, winner integer, loser integer, home integer, away integer, w_score integer, l_score integer, qrts integer);

CREATE TABLE teams_players(id SERIAL, team_id integer, player_id integer);