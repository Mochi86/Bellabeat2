# Installing and loading necessary packages and .csv files for cleaning data and visualization
install.packages("tidyverse")
install.packages("reshape")
install.packages("here")
install.packages("skimr")
install.packages("janitor")
install.packages("dplyr")


library(lubridate)
library(skimr)
library(janitor)
library(dplyr)
library(ggplot2)
#Bringing the file into R

DailyActivity <- read.csv("DailyActivity.csv")
Sleep <- read.csv("DailySleep.csv")
Weight <- read.csv("Weight.csv")

#Checking out a summary of the data
summary(DailyActivity)
colnames(DailyActivity)

#We want to see how many unique participants are in each section of the data since there seems to be a discrepancy on the initial check
n_distinct(DailyActivity$Id)
n_distinct(Sleep$Id)
n_distinct(Weight$Id)

#What can we use this data to see? 

DailyActivity %>%  
  select(TotalSteps, Calories, LightlyActiveMinutes, FairlyActiveMinutes, VeryActiveMinutes ) %>%
  summary()

Sleep %>%  
  select(TotalMinutesAsleep, TotalTimeInBed) %>%
  summary()

Weight %>%  
  select(WeightPounds, BMI) %>%
  summary()

#Based on these summaries, what can we deduce?
#We can explore things like:
#The relationship between daily steps and sedentary minutes
#The relationship between the average amount of sleep and calories burned per day
#The relationship between total steps and calories burned
#The relationship between active minutes and sleep

#Current Variables: DailyActivity (the raw file), Weight, Sleep

#Let's plot some trends from our deductions:

ggplot(data=DailyActivity) +
  geom_point(aes(x=LightlyActiveMinutes, y=Calories)) + 
  labs(title="Activity Level vs. Calories Burned", subtitle= "Even being just lightly active increases calories burned")

ggplot(data=Sleep) +
  geom_point(aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) +
  labs(title="Time Asleep vs. Time in Bed")

ggplot(data=Weight) +
  geom_line(aes(x=WeightPounds, y=BMI)) +
  labs(title="Weight vs. BMI")

#What do we learn from these graphs?


