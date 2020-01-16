# 4 developping

# https://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.html
# https://datacarpentry.org/R-ecology-lesson/04-visualization-ggplot2.html
# https://community.rstudio.com/t/how-to-apply-a-plotting-function-to-a-list-of-dataframes-and-a-character-vector/26033
# https://cengel.github.io/R-data-wrangling/data-visualization-with-ggplot2.html


## Part 2
### Obtain side-by-side bar charts comparing the distribution of answers of the students versus the professors for each question.


library(ggplot2)
library(gridExtra)
library(plotly)
library(tibble)
library(cowsay)
library(dplyr)
library(tidyverse)
library(GGally)
library(mosaic)

# Loading required package: lattice
# Loading required package: ggformula
# Loading required package: ggstance



# https://statisticsglobe.com/ggplot2-histogram-in-r-geom_histogram-function
# https://statisticsglobe.com/histogram-in-base-r-hist-function
# https://statisticsglobe.com/r-pairs-plot-example/
# pairs plots


# https://achilleaskostoulas.com/2013/02/13/on-likert-scales-ordinal-data-and-mean-values/
# https://measuringu.com/mean-ordinal/
# https://rcompanion.org/handbook/E_01.html
# https://ourcodingclub.github.io/2018/01/29/qualitative.html
# https://www.princeton.edu/~otorres/sessions/s2r.pdf
# https://data.library.virginia.edu/using-and-interpreting-cronbachs-alpha/
# https://learningstatisticswithr.com/lsr-0.6.pdf
# https://learningstatisticswithr.com/book/datahandling.html
# http://guianaplants.stir.ac.uk/seminar/resources/R_in_a_Nutshell_Second_Edition.pdf
# https://cran.r-project.org/web/packages/umx/umx.pdf


# Part 4
### Obtain a stacked horizontal bar plot with {ggplot2} that gives the percentage of employees that are 
# Ph.D. students, postdocs and professors for each research group. Use a custom theme.

### We have not covered stacked horizontal bar plot, so you will have to study the documentation, and/or some blog posts. 
### There is also a great book about {ggplot2} recipes that I recommend you check out: The hitchhiker's guide to ggplot2. 
### The book is pay-as-you-want, so select Package "The book" and choose a number from 0 and 30 dollars.
## (Regarding part 4, you can consider that each student is in a different research group.)

#############################

all_survey <- survey_clean %>% 
  select(number_of_employees)
total_survey <- all_survey %>% 
  summarise(number_of_employees = sum(number_of_employees))

paste(("How many survey participants were there?"),total_survey)


# etwas  ist falsch
most_parti <- survey_clean %>% 
  select(university, number_of_employees)

arrange(most_parti,university, number_of_employees) %>% 
  top_n(3)


sort_uni <- arrange(most_parti,university, number_of_employees) 
sort_uni

sort_uni %>%  
  group_by(university, number_of_employees)

sorted_gropuped <- sort_uni %>%  
  group_by(university, number_of_employees)  

  bbbb <- sorted_gropuped %>% 
    as_tibble(bbbb)  
    summarise(number_of_employees)
bbbb 
  summarise(bbbb, number_of_employees = sum(number_of_employees))
    
delft <- sort_uni %>% 
  filter(university == ("Delft University of Technology"),(number_of_employees )) %>% 
    summarise(number_of_employees = sum(number_of_employees))
delft
    
eindhov <- sort_uni %>% 
  filter(university == ("Eindhoven University of Technology")) %>% 
  summarise(number_of_employees = sum(number_of_employees))

erasm <-sort_uni %>% 
  filter(university == ("Erasmus University Rotterdam")) %>% 
summarise(number_of_employees = sum(number_of_employees))

leiden <- sort_uni %>% 
  filter(university == ("Leiden University")) %>% 
summarise(number_of_employees = sum(number_of_employees))

groning <- sort_uni %>%  
  filter(university == ("University of Groningen")) %>% 
summarise(number_of_employees = sum(number_of_employees))


delft
eindhov
erasm
leiden
groning

result_top3 <- bind_rows(delft,eindhov,erasm,leiden,groning) %>% 
  arrange(desc(number_of_employees,university)) %>% 
  top_n(3)

inspect(result_top3)
favstats(~number_of_employees, data = sort_uni)

#####################
str(most_parti)
most_parti
sort_uni
most_parti %>% 
sort(university)



survey_parts
survey_parts <- survey_clean %>% 
select(university, position, number_of_employees)
as.vector(survey_parts)
sort(survey_parts)

  survey_parts

  str(survey_parts)

.....help("group_by")
# Versuch university zu summieren
###############################

survey_grouped <- survey_clean %>% 
  group_by(university) %>% 
  unique() %>% 
  ungroup() %>% 
  pull()
survey_grouped


numb_of_pariticipants
numb_of_pariticipants <- survey_clean %>% 
  mutate(numb_of_particip = number_of_employees + number_of_ph_d_students + number_of_postdocs + number_of_professors) %>% 
  as_tibble() %>% 
  unique()

survey_participants_ppp
survey_participants_ppp <- numb_of_pariticipants %>% 
 select(university,numb_of_particip, number_of_ph_d_students, number_of_postdocs, number_of_professors)

nop <- select(survey_participants_ppp, numb_of_particip) %>% 
as.data.frame(nop)
nop_p <- (100 / nop)
nop_p

phd <- select(survey_participants_ppp, number_of_ph_d_students) %>% 
as.data.frame(phd)
phd_p <- round(nost * nop_p)


####

posd <- select(survey_participants_ppp, number_of_postdocs) %>% 
as.data.frame(posd)
posd_p <- round(posd * nop_p)
posd_p

###

nopr <- select(survey_participants_ppp, number_of_professors) %>% 
  as.data.frame(nopr)
nopr_p <- round(nopr * nop_p)


##   result

survey_participants_ppp_p
survey_participants_ppp_p <-dplyr::bind_cols(nop, phd_p, posd_p, nopr_p)








library(plotly)
p1 <- plot_ly(survey_participants_ppp, x=number_of_ph_d_students) %>% 
  add_histogram()


library(tidyverse)
survey_clean %>% 
  filter(position == ("PhD Student")) %>% 
  group_by(university)

survey_clean %>%
  arrange(university) %>% 
  filter(position == ("PhD Student"))
summarise(university = sum(number_of_employees))


