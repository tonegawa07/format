#####################################
# Catechins format 
#####################################
# Parameters
std_conc <- 10 #standard conc.(ppm)
Dil <- 8 #dilution
Ext <- 0.005 #extraction Vol.(L)
#####################################
f <- std_conc*Dil*Ext
#####################################

### package ###
library(tidyverse)

# import csv
file_name <- "Catechins_example"
csv_name <- paste0(file_name, ".csv")
rawdata <- read.csv(csv_name)

#colname
names(rawdata)[c(1,2,3,11)] <- c("label", "n", "C", "DW")

# show std data
std_area <-
  rawdata %>%
  select(1:10) %>%
  filter(label == "STD") %>%
  select(3:10)

boxplot(std_area)


# Calculation std_area mean
std_mean <-
  rawdata %>%
  select(1:10) %>%
  filter(label == "STD") %>%
  gather(key = Catechins, value = area, C:CG, factor_key = T) %>%
  group_by(Catechins) %>%
  summarise(Mean = mean(area)) %>%
  spread(key = Catechins, value = Mean)

# show std_mean
print(std_mean)


# Calculation sample_conc(mg/g)
sample <-
  rawdata %>%
  filter(label == "UNK") %>%
  mutate("C (mg/g DW)" = (C*f) / (std_mean$C*DW*0.001)) %>%
  mutate("EC (mg/g DW)" = (EC*f) / (std_mean$EC*DW*0.001)) %>%
  mutate("GC (mg/g DW)" = (GC*f) / (std_mean$GC*DW*0.001)) %>%
  mutate("EGC (mg/g DW)" = (EGC*f) / (std_mean$EGC*DW*0.001)) %>%
  mutate("EGCG (mg/g DW)" = (EGCG*f) / (std_mean$EGCG*DW*0.001)) %>%
  mutate("Caf. (mg/g DW)" = (Caf.*f) / (std_mean$Caf.*DW*0.001)) %>%
  mutate("ECG (mg/g DW)" = (ECG*f) / (std_mean$ECG*DW*0.001)) %>%
  mutate("CG (mg/g DW)" = (CG*f) / (std_mean$CG*DW*0.001))

# Export as CSV
output_name <- paste0(file_name, "_Result", ".csv")
write.csv(sample, output_name, quote=F)
