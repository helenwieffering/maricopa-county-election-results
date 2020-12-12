

votes_by_precinct_2020 <- read_tsv( "ArizonaExportByPrecinct_110320.txt" ) %>% clean_names( )

votes_by_precinct_2016 <- read_tsv( "11-08-2016 Final Precinct Report NOV 2016.txt" ) %>% clean_names( )

precincts_20 <- votes_by_precinct_2020 %>% distinct(
  precinct_id,
  precinct_order,
  precinct_name
) %>% 
  mutate( 
    precinct_name_clean = str_remove( precinct_name, "\\d{4}\\s" )
  )

precincts_16 <- votes_by_precinct_2016 %>% distinct(
  precinct_id,
  precinct_order,
  precinct_name
) %>% 
  mutate( 
    precinct_name_clean = str_remove( precinct_name, "\\d{4}\\s" )
  )

test_join_id <- precincts_20 %>% 
  anti_join( precincts_16,
             by = c( "precinct_id" = "precinct_id" ) )

test_join_order <- precincts_20 %>% 
  anti_join( precincts_16,
             by = c( "precinct_order" = "precinct_order" ) )

test_join_name <- precincts_20 %>% 
  anti_join( precincts_16,
             by = c( "precinct_name_clean" = "precinct_name_clean" ) )







