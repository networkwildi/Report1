library(readr)
library(tibble)
library(tidyselect)
library(tidyr)
library(dplyr)
library(stringr)
library(janitor)
library(ggplot2)
library(datapasta)
library(ggrepel)


# https://ggplot2.tidyverse.org/

# Small (0 to 10)
# Medium (11 to 20)
# Large (21 to 100)
# Extra large (over 100)

medium %>% 
  select(number_of_employees) 
  rename(medium, medium = number_of_employees)
medium

rlang::last_error()


rownames_to_column(sog) %>% 
  geom_bar(mapping = aes(x=number_of_employees, y=sizes)+
    geom_bar(stat ="identity")+
      geom_text(aes(label=number_of_employees))

    ggplot(data = sog, mapping = aes(x= sizes, y= number_of_employees))+
    
      geom_point(size=4, shape=13, color="green", alpha=0.4)
  
      sog %>% 
      ggplot(mapping = aes(x=sizes, y=number_of_employees))+
        geom_boxplot()+
        labs(title = "Number of employees")+
        theme_get()
      
      mpg
      
      s <- ggplot(mpg, aes(fl, fill = drv))
      s + geom_bar(position = "dodge")  
      
      # column_to_rownames(
        sog %>%
          ggplot(aes(x=sizes, y=number_of_employees, fill = "Sizes"))+
        geom_bar(aes(y = stat (count / max(count))))+
          facet_grid(rows = vars(number_of_employees))
    
        sog_ord <- sog %>% 
          select(sizes, number_of_employees) %>% 
            mutate(employees = number_of_employees)
          
        sog_ord
        sog_rows <-rownames_to_column(sog_ord)
        sog_rows  
        sog
        
        sog %>% group_by(number_of_employees)
        
        
                      emg_n
            
            help(mapping)
            help(cex)
            