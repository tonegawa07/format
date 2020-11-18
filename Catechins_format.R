#####################################
# Catechins format 
#####################################
# Parameters
std_conc <- 10 #standard conc.(ppm)
Dil <- 8 #dilution
Ext <- 0.005 #extraction Vol.(L)
#####################################
f <- std_conc*Dil*Ext

### package ###
library(tidyverse)

# import csv
#####################################
# file_nameに拡張子なしのファイル名を入力
file_name <- "Catechins_example"
#####################################

csv_name <- paste0(file_name, ".csv")
rawdata <- read.csv(csv_name)

#colname
names(rawdata)[c(1,2,ncol(rawdata))] <- c("label", "n", "DW")

# show std data
std_area <-
  rawdata %>%
  select(1:(ncol(rawdata)-1)) %>%
  filter(label == "STD") %>%
  select(3:(ncol(rawdata)-1))

boxplot(std_area)


# Calculation std_area mean
std_mean <-
  rawdata %>%
  select(1:(ncol(rawdata)-1)) %>%
  filter(label == "STD") %>%
  gather(key = Catechins, value = area, 3:(ncol(rawdata)-1), factor_key = T) %>%
  group_by(Catechins) %>%
  summarise(Mean = mean(area)) %>%
  spread(key = Catechins, value = Mean)

# show std_mean
print(std_mean)


# Calculation sample_conc(mg/g)
sample <-
  rawdata %>%
  filter(label == "UNK")

for (i in 3:(ncol(sample)-1)) {
  item <- colnames(sample[i])
  #print(item)
  col <- paste0(item, "(mg/g DW)")
  #print(col)
  std <- as.numeric(std_mean[item])
  #print(std)
  
  #print(sample[,i])
  sample <-
    sample %>%
    mutate(!!col := (sample[,i]*f) / (std*DW*0.001))
}

# Export as CSV
output_name <- paste0(file_name, "_Result", ".csv")
write.csv(sample, output_name, quote=F, row.names=F)