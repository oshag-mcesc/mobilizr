load_labs()
# lab 2a
histogram(~Social_Websites_Hours | Preferred_Status, data=census, breaks=seq(0,24,length.out=8))
mean(~Ageyears, data=census)
MAD(~Ageyears, data = census)
# lab 2b
bwplot(~height | gender, data = cdc)

# lab 3b
colnames(lungs)<- c("age", "lung_cap", "height", "gender", "smoker")
lungs<- lungs %>%
  mutate(gender = recode(gender, "1" = "Male", "0" = "Female"),
         smoker = recode(smoker, "1" = "Yes", "0" = "No"))
histogram(~lung_cap|smoker, lungs)

# lab 3c
bargraph(~grade, data = cdc)

#
cdc<- mobilizr::cdc
sf<- sample(1:nrow(cdc)*0.5, nrow(cdc)*0.1)
cdc$height[sf]<- NA


bargraph(~height, cdc)

mean(cdc$height)

