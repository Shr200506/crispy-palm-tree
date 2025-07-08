create database if not exists retail_db6;
use retail_db6;

create table odi_cricket_data1 (
         player_name varchar(100),
         role varchar(50),
         total_runs int,
         strike_rate varchar(50), -- kept as varchar due to inconsistent formatting
         total_balls_faced int,
         total_wickets_taken int,
         total_runs_conceded int,
         total_overs_bowled int,
         total_matches_played int,
         matches_played_as_batter int,
         matches_played_as_bowler int,
         matches_won int,
         matches_lost int,
         player_of_match_awards int,
         team varchar(100),
         average varchar(50),
         percentage varchar(255)
         );
         
         select*from odi_cricket_data1;
         
         desc table odi_cricket_data1;
         
         -- show variables like 'local_infile';
		
         -- set global local_infile=1;
         
          -- load data infile "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\ODI_data.csv"
          -- into table odi_cricket_data
		-- fields terminated by ','
         -- lines terminated by '\n'
           -- ignore 1 rows;
           drop table odi_cricket_data1;
         
         insert into odi_cricket_data1
         values("V Kohli","Batter",13784,"9.170.381",15031,7,681,671,579,579,0,360,219,41,"India","1.969.1423","477.93");
	     
         
         insert into odi_cricket_data1
         values("KC Sangakkara","Batter",11618,"7.939.0465",14634,0,0,0,510,510,0,237,273,26,"Sri Lanka",0,"442.17");

         insert into odi_cricket_data1
         values("RG Sharma","Batter",10646,"9.035.817",11782,11,538,614,577,577,0,358,219,23,"India","9.678.181","474.25");
         
         insert into odi_cricket_data1
         values("AB de Villiers","Batter",9435,"9.944.139",9488,7,205,201,466,466,0,286,180,26,"South Africa","1.347.857",497.97);


		insert into odi_cricket_data1
        values("SR Tendulkar","Batter",6432,"8.455.370",7607,31,1420,1545,574,574,0,356,218,16,"India","20.748.387",457.53);
        
        insert into odi_cricket_data1
        values("Yuvraj Singh","Batter",6868,"8.545.477.168.097.540",8037,99,3438,4028,579,579,0,360,219,20,"India","6.937.373.737.373.730",460.45);
        
        select*from odi_cricket_data1;
        select player_name,role,
        case
        when role='Batter' then 'Batsman'
        when role='Bowler' then 'Bowler'
        else 'All-Rounder'
        end as player_category
        from odi_cricket_data1;
        
		select player_name,percentage,
        case
        when percentage>=450 then 'Super Player'
        when percentage between 400 and 410 then 'Better  Player'
        else 'Normal Player'
        end as player_ranks
        from odi_cricket_data1;
        
       -- select player_name,total_wickets_taken from odi_cricket_data1 left join total_overs_bowled on odi_cricket_data1.total_wickets_taken=total_overs_bowled.total_wickets_taken ;
	
        
        
        
		select player_name,total_runs,
        case
        when total_runs>=10000 then 'Legend'
        when total_runs between 5000 and 9999 then 'Great Player'
	    when total_runs between 1000 and 4999 then 'Average Player'
        else 'Newcomer'
        end as player_class
        from odi_cricket_data1;

		select player_name,total_wickets_taken,
        case
        when total_wickets_taken>=300 then 'Elite Bowler'
        when total_wickets_taken between 100 and 299 then 'Experienced Bowler'
	    when total_wickets_taken between 50 and 99 then 'Developing Bowler'
        else 'Part-Time Bowler'
        end as bowling_category
        from odi_cricket_data1;
        
		select player_name,matches_won,
        case
        when matches_won>=300 then 'Match Winner'
        when matches_won between 200 and 299 then 'Consistent Performer'
	    when matches_won between 100 and 199 then 'Contributor'
        else 'Less Impactful'
        end as match_impact
        from odi_cricket_data1;
        
        select player_name,matches_lost,
        case
        when matches_lost>=200 then 'Match Lost'
        when matches_lost between 100 and 399 then 'Poor Performer'
        else 'Very Poor'
        end as match_impact
        from odi_cricket_data1;
        
        
        -- Data Cleaning queries:-Convert strike_rate and average to numeric format
        
        update odi_cricket_data1
        set strike_rate=substring_index(strike_rate,".",2);
        update odi_cricket_data1
        set average=substring_index(average,".",2);
        select*from odi_cricket_data1;
        
       -- update odi_cricket_data1 set strike_rate=cast(replace(replace(strike_rate,'.',""),',','.')
       -- as decimal(10,2)),average=cast(replace(replace(average,'.',""),',','.')as
       -- decimal(10,2)) where strike_rate regexp'[^0-9.]' or average regexp'[^0-9.]';
        
        
        
		select player_name,player_of_match_awards,
        case
        when player_of_match_awards>=30 then 'Superstar'
        when player_of_match_awards between 15 and 29 then 'Key Player'
	    when player_of_match_awards between 5 and 14 then 'Occasional Star'
        else 'Rare Winner'
        end as award_category
        from odi_cricket_data1;
        
        -- get top 10 bowlers by wickets
        select player_name,team,total_wickets_taken,total_runs_conceded,total_overs_bowled from odi_cricket_data1 where total_wickets_taken>0 order by total_wickets_taken 
        desc limit 10;
       
       -- Insert a new player record
        
        insert into odi_cricket_data1 (player_name,role,total_runs,strike_rate,total_balls_faced,
        total_wickets_taken,total_runs_conceded,total_overs_bowled,
        total_matches_played,matches_played_as_batter,matches_played_as_bowler,
        matches_won,matches_lost,player_of_match_awards,team,average,percentage
        )
        values('New Player','Batter',5000,85.50,6000,0,0,0,200,200,0,120,80,15,'India',45.5,50.75);
        select*from odi_cricket_data1;
        
        -- update strike rate for a specific player
        update odi_cricket_data1 set strike_rate=90.25 where player_name='V Kohli';
        
        -- delete records of retired players
        delete from odi_cricket_data1 where total_matches_played<50;
        
        -- increase the total runs of a player after a recent match
        update odi_cricket_data1 set total_runs=total_runs+75,total_balls_faced=total_balls_faced+80
        where player_name='RG Sharma';
        
        -- set role 'All-Rounder' for players with both runs and wickets
        update odi_cricket_data1 set role='All-Rounder' where total_runs>1000 and total_wickets_taken>50;
        
        -- reset strike rate and average for players with incorrect values 
        update odi_cricket_data1 set strike_rate=NULL , average=NULL where strike_rate<0 or average<0;
        
        -- remove players who have never won a match
        delete from odi_cricket_data1 where matches_won=0;
        
        -- set the average to 0 for players with zero matches played
        update odi_cricket_data1 set average=0 where total_matches_played=0;
        
        -- increase total wickets taken by 5 for bowlers from a specific team
        update odi_cricket_data1 set total_wickets_taken=total_wickets_taken+5 where role='Bowler' and team='Australia';
        
        
        
        




