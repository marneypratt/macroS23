
# make sure the 'tidyverse' package is installed and loaded 
# macros and master.taxa data files must be imported before you 
# can run the code below

sensitive.density <- macros %>% 
  
  #join taxa info
  left_join(., master.taxa) %>%
  
  #filter for sensitive macros 
  dplyr::filter(tolerance <= 3) %>%
  mutate(tol.category = "Sensitive") %>% 
  
  # Sum for each sampleID  
  # density of filtered macroinvertebrates
  # change group_by function to remove or add grouping variables as needed 
  group_by(date, sampleID, season, location, year, benthicArea, tol.category) %>% 
  dplyr::summarise (density = sum(invDens, na.rm = TRUE)) 


