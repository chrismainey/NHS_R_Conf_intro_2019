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
# Introduce assign '<-'
write.csv(medpar, "medpar.csv")
medpar <-read.csv("medpar.csv")


# Examples of manipulations

medpar %>% 
  select(provnum, los)

# provnum is char vector, so introduce 'mutate' to turn it into a factor, assign

medpar<-
  medpar %>%
  mutate(provnum = factor(provnum))


# Summarise and group by

medpar %>%
  summarise(MeanLOS = mean(LOS),
            MedianLOS = median(LOS))

# Also try group by, now statistics within provider 
medpar %>%
  group_by(provnum) %>%
  summarise(MeanLOS = mean(LOS),
            MedianLOS = median(LOS))


######### ggplot ###############

# Then on to ggplot2
ggplot(medpar, aes(x=los))+
  geom_histogram()

# Then step thorugh colours etc.
ggplot(medpar, aes(x=los))+
  geom_histogram(fill="blue")

# Bettter, colour + alpha
ggplot(medpar, aes(x=los))+
  geom_histogram(fill="dodgerblue2", alpha=0.75)

# Also use colour
ggplot(medpar, aes(x=los))+
  geom_histogram(fill="dodgerblue2", alpha=0.75, col="black")

# Different bins
ggplot(medpar, aes(x=los))+
  geom_histogram(fill="dodgerblue2", alpha=0.75, col="black", bins=10)


# Add labels, also demonstrate adding a layer
ggplot(medpar, aes(x=los))+
  geom_histogram(fill="dodgerblue2", alpha=0.75, col="black")+
  labs(title = "Distribution of Length of Stay in 'medpar' dataset", y="Count of patients", x="Length of Stay")
