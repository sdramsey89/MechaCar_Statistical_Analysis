#Deliverable 1
# Import
library(tidyverse)
library("dplyr")
mpgDF <- read.csv(file="Resources/MechaCar_mpg.csv")

reg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpgDF)#create a linear model
summary(reg)

#Deliverable 2
coils <- read.csv(file="Resources/Suspension_Coil.csv")
total_summary <- coils %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
lot_summary <- coils %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

#Deliverable 3
#t-test for entire sample
t.test(coils["PSI"], mu = 1500)
#filtering each lot into its own df for individual t-tests
coils_lot1 <- coils %>% filter (Manufacturing_Lot == "Lot1")
coils_lot2 <- coils %>% filter (Manufacturing_Lot == "Lot2")
coils_lot3 <- coils %>% filter (Manufacturing_Lot == "Lot3")
#t-test for each let
t.test(coils_lot1["PSI"], mu = 1500)
t.test(coils_lot2["PSI"], mu = 1500)
t.test(coils_lot3["PSI"], mu = 1500)



