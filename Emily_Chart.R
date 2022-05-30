# The dataset
Final_Dataset <- read.csv("Emily_SmallDataset.csv")

##Loading packages
library("plotly")
library("dplyr")
library("stringr")
library("tidyverse")
library("lintr")
library("RColorBrewer")
library("tidyr")

#the following code is the ANXIETY bucket for the grouped bar plot. 

#anxiety and chronic pain (highest chronic pain)
anx_cp_combined <- data.frame(
  Anxiety = Final_Dataset$ever_had_anxiety,
  Pain_Frequency = Final_Dataset$how_often_had_pain,
  Pain_Limiting_Freq = Final_Dataset$how_often_pain_limits
) 

anx_cp_filtered <- anx_cp_combined %>%
  group_by(Anxiety) %>%
  filter(Pain_Frequency == "4") %>%
  filter(Pain_Limiting_Freq == "4") %>%
  filter(Anxiety == "1")

nrow_anx_cp_filtered <- nrow(anx_cp_filtered)
#should be 423


#anxiety and opioids
anx_OP_combined <- data.frame(
  Anxiety = Final_Dataset$ever_had_anxiety,
  Opioid_Frequency = Final_Dataset$freq_of_opioid_use,
  Opioid_12= Final_Dataset$opioid_use_12_months
) 

anx_OP_filtered <- anx_OP_combined %>%
  group_by(Anxiety) %>%
  filter(Opioid_Frequency == "3") %>%
  filter(Opioid_12 == "1") %>%
  filter(Anxiety == "1")

nrow_anx_OP_filtered <- nrow(anx_OP_filtered)
#should be 224


#anxiety and social functioning
anx_SF_combined <- data.frame(
  Anxiety = Final_Dataset$ever_had_anxiety,
  Soc_Errands_Freq = Final_Dataset$dif_doing_errands,
  Soc_Act_Freq = Final_Dataset$diff_partic_social_act
) 

anx_SF_filtered <- anx_SF_combined %>%
  group_by(Anxiety) %>%
  filter(Soc_Errands_Freq == "4") %>%
  filter(Soc_Act_Freq == "4") %>%
  filter(Anxiety == "1")

nrow_anx_SF_filtered <- nrow(anx_SF_filtered)
#should be 109


#anxiety and hypertension
anx_HY_combined <- data.frame(
  Anxiety = Final_Dataset$ever_had_anxiety,
  Hyp_EverDiagnose = Final_Dataset$ever_had_hypertension,
  Hyp_12mo = Final_Dataset$hypertension_past_12_months
) 

anx_HY_filtered <- anx_HY_combined %>%
  group_by(Anxiety) %>%
  filter(Hyp_EverDiagnose == "1") %>%
  filter(Hyp_12mo == "1") %>%
  filter(Anxiety == "1")

nrow_anx_HY_filtered <- nrow(anx_HY_filtered)
#should be 1532

#the following code is the DEPRESSION bucket for the grouped bar plot. 

#depression and chronic pain (highest chronic pain)
dep_cp_combined <- data.frame(
  Depression = Final_Dataset$ever_had_depression,
  Pain_Frequency = Final_Dataset$how_often_had_pain,
  Pain_Limiting_Freq = Final_Dataset$how_often_pain_limits
) 

dep_cp_filtered <- dep_cp_combined %>%
  group_by(Depression) %>%
  filter(Pain_Frequency == "4") %>%
  filter(Pain_Limiting_Freq == "4") %>%
  filter(Depression == "1")

nrow_dep_cp_filtered <- nrow(dep_cp_filtered)
#should be 463


#depression and opioids
dep_OP_combined <- data.frame(
  Depression = Final_Dataset$ever_had_depression,
  Opioid_Frequency = Final_Dataset$freq_of_opioid_use,
  Opioid_12= Final_Dataset$opioid_use_12_months
) 

dep_OP_filtered <- dep_OP_combined %>%
  group_by(Depression) %>%
  filter(Opioid_Frequency == "3") %>%
  filter(Opioid_12 == "1") %>%
  filter(Depression == "1")

nrow_dep_OP_filtered <- nrow(dep_OP_filtered)
#should be 277


#depression and social functioning
dep_SF_combined <- data.frame(
  Depression = Final_Dataset$ever_had_depression,
  Soc_Errands_Freq = Final_Dataset$dif_doing_errands,
  Soc_Act_Freq = Final_Dataset$diff_partic_social_act
) 

dep_SF_filtered <- dep_SF_combined %>%
  group_by(Depression) %>%
  filter(Soc_Errands_Freq == "4") %>%
  filter(Soc_Act_Freq == "4") %>%
  filter(Depression == "1")

nrow_dep_SF_filtered <- nrow(dep_SF_filtered)
#should be 126


#depression and hypertension
dep_HY_combined <- data.frame(
  Depression = Final_Dataset$ever_had_depression,
  Hyp_EverDiagnose = Final_Dataset$ever_had_hypertension,
  Hyp_12mo = Final_Dataset$hypertension_past_12_months
) 

dep_HY_filtered <- dep_HY_combined %>%
  group_by(Depression) %>%
  filter(Hyp_EverDiagnose == "1") %>%
  filter(Hyp_12mo == "1") %>%
  filter(Depression == "1")

nrow_dep_HY_filtered <- nrow(dep_HY_filtered)
#should be 1739

#the following code is the DEMENTIA bucket for the grouped bar plot. 

#dementia and chronic pain (highest chronic pain) 
dem_cp_combined <- data.frame(
  Dementia = Final_Dataset$ever_had_dementia,
  Pain_Frequency = Final_Dataset$how_often_had_pain,
  Pain_Limiting_Freq = Final_Dataset$how_often_pain_limits
) 

dem_cp_filtered <- dem_cp_combined %>%
  group_by(Dementia) %>%
  filter(Pain_Frequency == "4") %>%
  filter(Pain_Limiting_Freq == "4") %>%
  filter(Dementia == "1")

nrow_dem_cp_filtered <- nrow(dem_cp_filtered)
#should be 37


#dementia and opioids
dem_OP_combined <- data.frame(
  Dementia = Final_Dataset$ever_had_dementia,
  Opioid_Frequency = Final_Dataset$freq_of_opioid_use,
  Opioid_12 = Final_Dataset$opioid_use_12_months
) 

dem_OP_filtered <- dem_OP_combined %>%
  group_by(Dementia) %>%
  filter(Opioid_Frequency == "3") %>%
  filter(Opioid_12 == "1") %>%
  filter(Dementia == "1")

nrow_dem_OP_filtered <- nrow(dem_OP_filtered)
#should be 15


#dementia and social functioning
dem_SF_combined <- data.frame(
  Dementia = Final_Dataset$ever_had_dementia,
  Soc_Errands_Freq = Final_Dataset$dif_doing_errands,
  Soc_Act_Freq = Final_Dataset$diff_partic_social_act
) 

dem_SF_filtered <- dem_SF_combined %>%
  group_by(Dementia) %>%
  filter(Soc_Errands_Freq == "4") %>%
  filter(Soc_Act_Freq == "4") %>%
  filter(Dementia == "1")

nrow_dem_SF_filtered <- nrow(dem_SF_filtered)
#should be 82


#dementia and hypertension
dem_HY_combined <- data.frame(
  Dementia = Final_Dataset$ever_had_dementia,
  Hyp_EverDiagnose = Final_Dataset$ever_had_hypertension,
  Hyp_12mo = Final_Dataset$hypertension_past_12_months
) 

dem_HY_filtered <- dem_HY_combined %>%
  group_by(Dementia) %>%
  filter(Hyp_EverDiagnose == "1") %>%
  filter(Hyp_12mo == "1") %>%
  filter(Dementia == "1")

nrow_dem_HY_filtered <- nrow(dem_HY_filtered)
#should be 151


#Creating the Vectors for the Plot to pull from
Mental_Dis <- c("Anxiety", "Depression", "Dementia")
Num_Of_Respondents <- c(nrow_anx_cp_filtered,
                        nrow_anx_OP_filtered,
                        nrow_anx_SF_filtered,
                        nrow_anx_HY_filtered,
                        nrow_dep_cp_filtered,
                        nrow_dep_OP_filtered,
                        nrow_dep_SF_filtered,
                        nrow_dep_HY_filtered,
                        nrow_dem_cp_filtered,
                        nrow_dem_OP_filtered,
                        nrow_dem_SF_filtered,
                        nrow_dem_HY_filtered)
Covariates <- c("Frequent Chronic Pain", 
                "Frequent Opioid Use", 
                "High Difficulty Functioning Socially",
                "Hypertension")


just_cp <- c(nrow_anx_cp_filtered,
             nrow_dep_cp_filtered,
             nrow_dem_cp_filtered)

just_op <- c(nrow_anx_OP_filtered,
             nrow_dep_OP_filtered,
             nrow_dem_OP_filtered)

just_sf <- c(nrow_anx_SF_filtered,
             nrow_dep_SF_filtered,
             nrow_dem_SF_filtered)

just_hy <- c(nrow_anx_HY_filtered,
             nrow_dep_HY_filtered,
             nrow_dem_HY_filtered)

disorder_names <- c("Anxiety", "Depression", "Dementia")

just_comorbids <- data.frame(
                    disorder_names,
                    just_cp,
                    just_op,
                    just_sf,
                    just_hy)

#Plotly code
plot_ly(just_comorbids, x = ~disorder_names, y = ~just_cp, type = 'bar', name = 'Chronic Pain') %>% 
  add_trace(y = ~just_op, name = 'Opioid Use') %>% 
  add_trace(y = ~just_sf, name = 'Social Functioning') %>% 
  add_trace(y = ~just_hy, name = 'Hypertension') %>% 
  layout(title = "Frequency of Mental Health Comorbidities in the 2020 NHIS",
          yaxis = list(title = 'Number of Respondents'),
          xaxis = list(title = 'Mental Disorder'))
