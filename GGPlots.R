# GGplots

# https://uc-r.github.io/barcharts
# https://www.r-bloggers.com/detailed-guide-to-the-bar-chart-in-r-with-ggplot/
# https://www.theanalysisfactor.com/r-11-bar-charts/
# https://www.guru99.com/r-bar-chart-histogram.html
# https://bookdown.org/lyzhang10/lzhang_r_tips_book/how-to-plot-data.html
# https://community.rstudio.com/t/about-creating-multi-variable-bar-chart-using-ggplot/18859    multi chart
# https://bookdown.org/lyzhang10/lzhang_r_tips_book/how-to-plot-data.html
# http://www.sthda.com/english/wiki/ggplot2-barplot-easy-bar-graphs-in-r-software-using-ggplot2

# http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization
# http://www.sthda.com/english/wiki/bar-plots-r-base-graphs
# https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/barplot.html
# http://uc-r.github.io/missing_values      working on missing values  NA
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/row.names.html            rownames
# https://www.guru99.com/r-replace-missing-values.html       rownames
# https://www.datacamp.com/community/tutorials/15-easy-solutions-data-frame-problems-r  rownames



library(tidyverse)
library(dplyr)
library(tibble)
library(datapasta)


mtcars
mtib <- as_tibble(rownames_to_column(mtcars, "cars"))
mtib


pprofessors_clean
sstudent_clean
bar_stud_pros_pus
bar_stud_pros_bind

professors_clean
professors_clean %>% 
  mutate(question = "question")


bar_stud_pros_bind

nrow(bar_stud_pros_bind)
nrow(df_st_pr)

# Brauchbar
bar_stud_pros_bind <- bind_cols(professors_clean, students_clean) %>% 
  select(question, totally_disagree, p_totally_disagree, disagree, p_disagree, totally_agree, p_totally_agree, agree, p_agree) %>% 
  group_by(question)
bar_stud_pros_bind

str(raw_bar_stud_pros_bind)

# #############

raw_bar_stud_pros_bind
raw_bar_stud_pros_bind <- dplyr::bind_cols(pprofessors_clean, students_clean)
# row.names()

bar_stud_pros_bind
bar_stud_pros_bind <- raw_bar_stud_pros_bind %>%  
  select(question, totally_disagree, p_totally_disagree, disagree, p_disagree, totally_agree, p_totally_agree, agree, p_agree)


bar_stud_pros_bind
df_st_pr <- dplyr::data_frame(question = letters[1:32],
                   totally_disagree = runif(32, 1, 505),
                   p_totally_disagree = runif(32, 1, 505),
                   disagree = runif(32, 1, 275),
                   p_disagree = runif(32, 1, 275),
                   totally_agree = runif(32, 1, 280),
                   p_totally_agree = runif(32, 1, 280),
                   agree = runif(32, 1, 290),
                   p_agree = runif(32, 1, 290))

nrow(df_st_pr)
df_st_pr
df_st_pr <- df_st_pr %>% 
  gather(keys, values, totally_disagree:p_agree) %>% 
  row.names()

as_tibble(df_st_pr)

ggplot(df_st_pr, aes(question, values))+
  geom_col(aes(fill=keys))+
  facet_wrap(~ keys)+
  coord_flip()

#################

library(tidyverse)

Df <- tibble(Subject = letters[1:19],
             TQ = runif(19, 1, 505),
             TA = runif(19, 1, 273),
             TC = runif(19, 1, 194))

Df <- Df %>% 
  gather(keys, values, TQ:TC)

ggplot(Df, aes(keys, values)) +
  geom_col(aes(fill = keys)) + 
  facet_wrap(~Subject, ncol = 4)

# ******************
  
df_st_pr <- df_st_pr %>% 
  gather(keys, values, totally_disagree:p_agree)

ggplot(df_st_pr, aes(keys, values))+
  geom_col(aes(fill= keys))+
  facet_wrap(~question, ncol = 4)

##############################









xyplot(totally_disagree ~ p_agree, alpha=0.5, data = bar_stud_pros_pus)
bwplot(totally_disagree ~ p_agree, pch="|", data = bar_stud_pros_pus)
  
  geom_bar(mapping=aes(x=totally_disagree, y=p_totally_disagree))

  mytab <- tally(~ p_totally_disagree + totally_disagree, margins = FALSE, data = bar_stud_pros_pus)
  barplot(mytab)

  
    plotDist('exp', kind = 'histogram'())
favstats(~totally_disagree, data = bar_stud_pros_pus )
  
  
  
  