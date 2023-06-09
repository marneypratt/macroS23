
# this code will make a dot plot with median and all points included
# make sure you have loaded the ggbeeswarm package to use geom_quasirandom()
# alternatively, you can use geom_jitter() instead


ggplot(
  data = ___,   #put the data frame name here
  aes(x = ___, y = ___,                 #1st factor = x, continuous variable = y,
      fill = ___, color = ___)) +       #2nd factor = fill & color
  geom_quasirandom( 
    shape=21, size=2, alpha = 0.5, width=0.1, #play with these values as needed
    dodge.width = 0.6) + #adjust the dodge width as needed
  stat_summary(fun = median, 
               fun.min = median, 
               fun.max = median, #change median to mean if desired
               geom = "crossbar", na.rm = TRUE,
               width = 0.5, size = 0.5, #play with these values as needed
               color = "black",
               position=position_dodge(width=0.6), #match this width to dodge.width above
               show.legend = FALSE) + 
  ylab("___") +
  xlab("___") +
  coord_cartesian(expand=TRUE) +
  theme_classic(base_size=16) +
  theme(legend.position = "top") + #change the position of the key as needed
  facet_wrap(vars(___))   #3rd factor here


#see the resources below for some additional options to make a nice plot 
# https://www.datanovia.com/en/lessons/ggplot-dot-plot/
# https://ggplot2.tidyverse.org/index.html