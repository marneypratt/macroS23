
# make sure the 'tidyverse' package is installed and loaded 
# macros and master.taxa data files must be imported before you 
# can run the code below

moderate.density <- macros %>% 
  
  #join taxa info
  left_join(., master.taxa) %>%
  
  #filter for moderately sensitive macros
  dplyr::filter(tolerance > 3, tolerance < 7) %>%
  mutate(tol.category = "Moderate") %>% 
  
  # Sum for each sampleID  
  # density of filtered macroinvertebrates
  # change group_by function to remove or add grouping variables as needed 
  group_by(date, sampleID, season, location, year, benthicArea, tol.category) %>% 
  dplyr::summarise (density = sum(invDens, na.rm = TRUE)) 


