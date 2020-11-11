#####################################
# FAAs format 
#####################################
# Parameters
std_conc <- 10 #standard conc.(ppm)
Dil <- 1.25 #dilution
Ext <- 0.005 #extraction Vol.(L)
#####################################
f <- std_conc*Dil*Ext
#####################################

### package ###
library(tidyverse)

# import csv
file_name <- "FAAs_example"
csv_name <- paste0(file_name, ".csv")
rawdata <- read.csv(csv_name)

#colname
names(rawdata)[c(1,2,13)] <- c("label", "n", "DW")

# show std data
std_area <-
  rawdata %>%
  select(1:12) %>%
  filter(label == "STD") %>%
  select(3:12)

boxplot(std_area)


# Calculation std_area mean
std_mean <-
  rawdata %>%
  select(1:12) %>%
  filter(label == "STD") %>%
  gather(key = FAAs, value = area_ratio, Asp:GABA, factor_key = T) %>%
  group_by(FAAs) %>%
  summarise(Mean = mean(area_ratio)) %>%
  spread(key = FAAs, value = Mean)

# show std_mean
print(std_mean)


# Calculation sample_conc(mg/g)
sample <-
  rawdata %>%
  filter(label == "UNK") %>%
  mutate("Asp (mg/g DW)" = (Asp*f) / (std_mean$Asp*DW*0.001)) %>%
  mutate("Glu (mg/g DW)" = (Glu*f) / (std_mean$Glu*DW*0.001)) %>%
  mutate("Asn (mg/g DW)" = (Asn*f) / (std_mean$Asn*DW*0.001)) %>%
  mutate("Ser (mg/g DW)" = (Ser*f) / (std_mean$Ser*DW*0.001)) %>%
  mutate("Gln (mg/g DW)" = (Gln*f) / (std_mean$Gln*DW*0.001)) %>%
  mutate("Arg (mg/g DW)" = (Arg*f) / (std_mean$Arg*DW*0.001)) %>%
  mutate("Ala (mg/g DW)" = (Ala*f) / (std_mean$Ala*DW*0.001)) %>%
  mutate("Thea (mg/g DW)" = (Thea*f) / (std_mean$Thea*DW*0.001)) %>%
  mutate("GABA (mg/g DW)" = (GABA*f) / (std_mean$GABA*DW*0.001))


# Export as CSV
output_name <- paste0(file_name, "_Result", ".csv")
write.csv(sample, output_name, quote=F)
