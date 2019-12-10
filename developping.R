# 4 developping

# https://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.html
# https://datacarpentry.org/R-ecology-lesson/04-visualization-ggplot2.html
# https://community.rstudio.com/t/how-to-apply-a-plotting-function-to-a-list-of-dataframes-and-a-character-vector/26033
# https://cengel.github.io/R-data-wrangling/data-visualization-with-ggplot2.html


## Part 2
### Obtain side-by-side bar charts comparing the distribution of answers of the students versus the professors for each question.
```{r}

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


pprofessors_clean <-professors_clean %>% 
  select(question, p_totally_disagree = totally_disagree, p_disagree = disagree, p_agree = agree, p_totally_agree = totally_agree )

sstudent_clean <- student_clean %>% 
  select(totally_disagree, disagree, agree, totally_agree)
# sstudent_clean

# Etwas stimmt nicht, 1024 rows anstelle von 32
studs_pros <- merge(pprofessors_clean , sstudent_clean)
view(studs_pros)
# plot(studs_pros)

# Brauchbar
bar_stud_pros_bind <- bind_cols(pprofessors_clean, sstudent_clean) %>% 
  select(question, totally_disagree,p_totally_disagree, disagree, p_disagree, totally_agree, p_totally_agree, agree, p_agree) %>% 
  group_by(question)

bar_stud_pros_pus <- bind_cols(pprofessors_clean, sstudent_clean) %>% 
  select(totally_disagree,p_totally_disagree, disagree, p_disagree, totally_agree, p_totally_agree, agree, p_agree)
bar_stud_pros_pus

pairs(bar_stud_pros_bind)
ggpairs(bar_stud_pros_pus)

# view(bar_stud_pros)
# plot(bar_stud_pros)

# ohne question
bar_stud_pros <- bind_cols(pprofessors_clean, sstudent_clean) %>% 
  select(totally_disagree,p_totally_disagree, disagree, p_disagree, totally_agree, p_totally_agree, agree, p_agree)
# group_by(question)
# bar_stud_pros
# plot(bar_stud_pros)


# bar_stud_pros_vec <- c(bar_stud_pros)

# dd <- bar_stud_pros_vec
ggplot(data = bar_stud_pros_vec )+
  geom_bar(mapping = aes(x = bar_stud_pros_vec, y = question_col))

dd_bar_stud_pros <- bar_stud_pros_bind
pp <- ggplot(dd_bar_stud_pros , aes(x = totally_disagree, y = question))
pp


bar_stud_pros_vec %>%
  ggplot(aes(x=df, y=question_col))+
  geom_point()+
  facet_grid(rows = vars(df),
             cols = vars(totally_disagree))

ggplot(data = bar_stud_pros , mapping = aes(x = , y = weight)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato")


# https://statisticsglobe.com/ggplot2-histogram-in-r-geom_histogram-function
# https://statisticsglobe.com/histogram-in-base-r-hist-function
# https://statisticsglobe.com/r-pairs-plot-example/
# pairs plots

sp_totally_disagree <- select(bar_stud_pros_bind, totally_disagree , p_totally_disagree)
sp_totally_disagree

bar_stud_pros %>% 
  ggplot(aes(x=totally_disagree, y=question_col))+
  geom_bar()+
  facet_wrap(~totally_disagree)

bar_stud_pros_bind
ggplot(aes(x=df))+
  geom_col (mapping = aes(color=p_totally_disagree),alpha=0.3)
geom_point(data=filter(question_col, shape=1, size=4, stroke=2, color="red" ))

df <- data.frame(bar_stud_pros)
df

bar_stud_pros_num <- as.list.numeric_version(bar_stud_pros)   
hist(bar_stud_pros_num)

pairs(data)
ggpairs(data)  




question_x <- student_clean
question_colls <- select(student_clean, question)
view(question_x)
view(question_colls)

rlang::last_error()
rlang::last_trace()

ncol(bar_stud_pros)
rownames(bar_stud_pros)
glimpse(bar_stud_pros)
bar_stud_pros
glimpse(question_col)
rownames(bar_stud_pros_bind)
colnames(bar_stud_pros_bind)
qbar <- as_tibble(rownames_to_column(bar_stud_pros, "question")) 
qbar
ncol(qbar)
nrow(qbar)
bar_stud_pros_bind

students_clean
students


# student_clean
# Funktioniert !!! 
#totally_agrs <- c(filter(select(student_clean, totally_agree, disagree)))
# totally_agrs
# totally_agrss <- select(student_clean, totally_agree, disagree)
# totally_agrss


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