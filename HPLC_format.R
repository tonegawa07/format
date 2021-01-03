#####################################
# HPLC_format 
#####################################
cal_hplc = function(std_conc, Dil, Ext_vol, file_name){
  # Parameters
  #std_conc : std濃度
  #Dil : 希釈倍率
  #Ext_vol : 抽出時溶媒量(mL)
  
  f <- std_conc*Dil*(Ext_vol/1000)
  
  ### package ###
  library(tidyverse)
  
  rawdata=
    read.csv(paste0(file_name, ".csv")) %>%
    dplyr::mutate_all(~gsub(.,pattern="-----",replacement = NA)) %>%
    dplyr::mutate_all(~gsub(.,pattern=",",replacement = ""))
  
  for (i in 2:ncol(rawdata)) {
    rawdata[,i]<-as.numeric(rawdata[,i])
  }
  
  #rawdata[is.na(rawdata)]=0
  
  # colname
  names(rawdata)[c(1,ncol(rawdata))] <- c("ID", "DW")
  
  # show std data
  std_area <-
    rawdata %>%
    select(1:(ncol(rawdata)-1)) %>%
    filter(grepl("STD", ID)) %>%
    #filter(label == "STD") %>%
    select(2:(ncol(rawdata)-1))
  
  boxplot(std_area)
  
  
  # Calculation std_area mean
  std_mean <-
    rawdata %>%
    select(1:(ncol(rawdata)-1)) %>%
    filter(grepl("STD", ID)) %>%
    #filter(label == "STD") %>%
    gather(key = key, value = value, 2:(ncol(rawdata)-1), factor_key = T) %>%
    group_by(key) %>%
    summarise(Mean = mean(value)) %>%
    spread(key = key, value = Mean)
  
  # show std_mean
  print(std_mean)
  
  
  # Calculation sample_conc(mg/g)
  sample <-
    rawdata %>%
    filter(grepl("UNK", ID))
    #filter(label == "UNK")
  
  for (i in 2:(ncol(sample)-1)) {
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
}

cal_hplc(std_conc = 10, Dil = 8, Ext_vol = 5, file_name = "Catechins_example")
cal_hplc(std_conc = 10, Dil = 1.25, Ext_vol = 5, file_name = "FAAs_example")
