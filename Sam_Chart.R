library(hrbrthemes) 
library(viridis) 
library(dplyr) 
library(tidyverse) 
library(ggplot2) 
library(stringr) 
library(plotly)
library(markdown)
library(shiny)
options(scipen = 999)

NIHS2020 <- read.csv("https://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2020/adultinc20csv.zip", stringsAsFactors = FALSE) 

Final_Dataset <- data.frame(NIHS2020$DEMENEV_A, NIHS2020$ANXEV_A, NIHS2020$DEPEV_A, NIHS2020$PAIFRQ3M_A, NIHS2020$PAIWKLM3M_A, NIHS2020$OPD12M_A, NIHS2020$OPDFREQ_A, NIHS2020$SOCERRNDS_A, NIHS2020$SOCSCLPAR_A, NIHS2020$HYPEV_A, NIHS2020$HYP12M_A) 

names(Final_Dataset)[names(Final_Dataset) == "NIHS2020.DEMENEV_A"] <- "ever_had_dementia" 

names(Final_Dataset)[names(Final_Dataset) == "NIHS2020.ANXEV_A"] <- "ever_had_anxiety" 

names(Final_Dataset)[names(Final_Dataset) == "NIHS2020.DEPEV_A"] <- "ever_had_depression"

names(Final_Dataset)[names(Final_Dataset) == "NIHS2020.PAIFRQ3M_A"] <- "how_often_had_pain" 

names(Final_Dataset)[names(Final_Dataset) == "NIHS2020.PAIWKLM3M_A"] <- "how_often_pain_limits" 

names(Final_Dataset)[names(Final_Dataset) == "NIHS2020.OPD12M_A"] <- "opioid_use_12_months" 

names(Final_Dataset)[names(Final_Dataset) == "NIHS2020.OPDFREQ_A"] <- "freq_of_opioid_use"

names(Final_Dataset)[names(Final_Dataset) == "NIHS2020.SOCERRNDS_A"] <- "dif_doing_errands" 

names(Final_Dataset)[names(Final_Dataset) == "NIHS2020.SOCSCLPAR_A"] <- "diff_partic_social_act" 

names(Final_Dataset)[names(Final_Dataset) == "NIHS2020.HYPEV_A"] <- "ever_had_hypertension" 

names(Final_Dataset)[names(Final_Dataset) == "NIHS2020.HYP12M_A"] <- "hypertension_past_12_months"

write.csv(Final_Dataset)  

adult19 <- read.csv("https://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2019/adult19csv.zip", stringsAsFactors = FALSE) 

dataset_2019 <- data.frame(adult19$DEMENEV_A, adult19$ANXEV_A, adult19$DEPEV_A, adult19$PAIFRQ3M_A, adult19$PAIWKLM3M_A, adult19$OPD12M_A, adult19$OPDFREQ_A, adult19$SOCERRNDS_A, adult19$SOCSCLPAR_A, adult19$HYPEV_A, adult19$HYP12M_A) 

names(dataset_2019)[names(dataset_2019) == "adult19.DEMENEV_A"] <- "ever_had_dementia" 

names(dataset_2019)[names(dataset_2019) == "adult19.ANXEV_A"] <- "ever_had_anxiety" 

names(dataset_2019)[names(dataset_2019) == "adult19.DEPEV_A"] <- "ever_had_depression"

names(dataset_2019)[names(dataset_2019) == "adult19.PAIFRQ3M_A"] <- "how_often_had_pain" 

names(dataset_2019)[names(dataset_2019) == "adult19.PAIWKLM3M_A"] <- "how_often_pain_limits" 

names(dataset_2019)[names(dataset_2019) == "adult19.OPD12M_A"] <- "opioid_use_12_months" 

names(dataset_2019)[names(dataset_2019) == "adult19.OPDFREQ_A"] <- "freq_of_opioid_use"

names(dataset_2019)[names(dataset_2019) == "adult19.SOCERRNDS_A"] <- "dif_doing_errands" 

names(dataset_2019)[names(dataset_2019) == "adult19.SOCSCLPAR_A"] <- "diff_partic_social_act" 

names(dataset_2019)[names(dataset_2019) == "adult19.HYPEV_A"] <- "ever_had_hypertension" 

names(dataset_2019)[names(dataset_2019) == "adult19.HYP12M_A"] <- "hypertension_past_12_months" 

adult18 <- read.csv("https://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2018/samadultcsv.zip", stringsAsFactors = FALSE) 

dataset_2018 <- data.frame(adult18$COGCAUS2, adult18$AFLHCA17) 

names(dataset_2018)[names(dataset_2018) == "adult18.COGCAUS2"] <- "ever_had_dementia" 

names(dataset_2018)[names(dataset_2018) == "adult18.AFLHCA17"] <- "had_anxiety_or_depression" 

adult17 <- read.csv("https://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2017/samadultcsv.zip", stringsAsFactors = FALSE) 

dataset_2017 <- data.frame(adult17$AFLHCA17) 

names(dataset_2017)[names(dataset_2017) == "adult17.AFLHCA17"] <- "had_anxiety_or_depression" 

adult16 <- read.csv("https://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2016/samadultcsv.zip", stringsAsFactors = FALSE) 

dataset_2016 <- data.frame(adult16$AFLHCA17) 

names(dataset_2016)[names(dataset_2016) == "adult16.AFLHCA17"] <- "had_anxiety_or_depression" 

Exploratory_Analysis <- data.frame(Final_dataset$ever_had_depression, Final_dataset$ever_had_anxiety, Final_dataset$ever_had_dementia, dataset_2019$ever_had_depression, dataset_2019$ever_had_anxiety, dataset_2019$ever_had_dementia, dataset_2018$had_anxiety_or_depression, dataset_2018$ever_had_dementia, dataset_2017$had_anxiety_or_depression, dataset_2016$had_anxiety_or_depression)

write.csv(Exploratory_Analysis)                                    
read.csv(Exploratory_Analysis)

Exploratory_Analysis <-Exploratory_Analysis %>% 
  group_by(Year) %>% 
  mutate(Clinical_anxiety = Anxiety / Not_anxiety)
  
Exploratory_Analysis <-Exploratory_Analysis %>% 
  group_by(Year) %>% 
  mutate(Clinical_depression = Depression / Not_depression) 

Exploratory_Analysis <-Exploratory_Analysis %>% 
  group_by(Year) %>% 
  mutate(Clinical_dementia = Dementia / Not_dementia)

chart3 <- read.csv("chart3.csv")

#Server
output$plot3 <- renderPlotly({
  
  filtered_main <- chart3 %>% 
    filter(input$year_selection[1]<=year & input$year_selection[2]>=year)
  
  chart3 %>%
    ggplot( aes(x=Year, y=Rate, group=Disorder, color=Disorder)) +
    geom_line() +
    scale_color_viridis(discrete = TRUE) +
    ggtitle("US Mental Health Disorder Prevalence") +
    theme_ipsum() +
    ylab("Population Occurrence Rate") 
  
  return(interactive_plot)
})


#ui
chart3_slider <- sliderinput(inputId = "year_selection", 
                             label = h3("Choose Year") ,
                             min = min(chart3$year) , 
                             max = max(chart3$year) ,
                             sep = "", 
                             value = 2020
                             )
#Then configure side panel widgets 
