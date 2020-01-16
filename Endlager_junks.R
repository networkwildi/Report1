# Part 2
### Obtain a horizontal bar graph of the number of survey participants for the different .positions given in the column Position.
### (Thanks for flagging the needed clarification in Part 2, I have updated the definition of the groups (1-10, 11-20…).)

survey_pos_parts  <- (survey_clean %>% select(position, number_of_ph_d_students,number_of_postdocs,  number_of_professors)) %>% as_tibble(survey_pos_parts)
str(survey_pos_parts)
as_data_frame(survey_pos_parts)


survey_positions <- (survey_clean %>%  select(position, number_of_employees)) %>% 
  tibble::as_tibble(survey_positions)
str(survey_positions)

survey_parts <- (survey_clean %>%  select(number_of_employees,number_of_ph_d_students,number_of_postdocs,  number_of_professors)) %>% 
  as.tibble(survey_parts) 
str(survey_parts)

survey_pos_parts  <- (survey_clean %>% select(position, number_of_ph_d_students,number_of_postdocs,  number_of_professors)) %>% as_tibble(survey_pos_parts)
str(survey_pos_parts)
as_data_frame(survey_pos_parts)

###   Data

survey_position %>% 
  ggplot(aes(x=position, y=number_of_employees))+
  geom_bar(stat = "identity")+
  facet_grid()+
  coord_flip()+
  labs(title = "participants for the different positions")

###
survey_clean %>% 
  group_by(position) %>% 
  ggplot(aes(x=number_of_employees, y=position))+
  geom_point(mapping = aes(color=university), alpha=0.3)
# geom_point(data=filter(survey_clean, territory=="Large",
#                     sizes=="Small"),
#        shape=1, size=4, stroke=2, color="blue")


# #############################


