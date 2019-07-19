lapply(c('ggplot2', 'COUNT', 'dplyr'), require, character.only=TRUE)

#Load the example package
data(medpar)

# quick summary
summary(medpar)
head(medpar)
View(medpar)

#details on the dataset:
?medpar

# We could write this to a CSV, and provide it, then they can import it with 'read.csv'
write.csv(medpar, "medpar.csv")
medpar <-read.csv("medpar.csv")


# Examples of manipulations

medpar %>% 
  select()
