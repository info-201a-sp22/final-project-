**Research question**: Which comorbidities appear most commonly among respondents who report experiencing a mental disorder?

While a lack of temporal data inhibits conclusions of causality, we can use this visualization to get a general idea of which physical, social, and substance-related comorbidities appear more commonly than others among people experiencing anxiety, dementia, or depression. For example, by selecting Depression and hovering over the red bar, you'll notice that nearly 1800 of those who reported ever experiencing depression also had been told they had Hypertension in the past 12 months. This information provides a foundation for future research questions: for example, it is widely understood that hypertension and anxiety are related, but the relationship between hypertension and depression appears less often in the literature. What social, biological, and socioeconomic factors might contribute to this trend?

Notably, a plot demonstrating proportions may provide more applicable information and the distribution of comorbidities may even be different. This plot uses counts for two reasons: (1) because its designer is still a novice at creating interactive charts in R, and (2) because even frequencies in the context of this dataset can provide a clear basic indication of which comorbidities appear most often among respondents with anxiety, depression, and dementia.

### Here is how we defined our variables based off the NHIS questionnaire.

**Anxiety**:

Ever Had Anxiety Disorder: 1 (Yes)

**Depression**:

Ever Had Depression: 1 (Yes)

**Dementia**:

Ever Had Dementia: 1 (Yes)

**High Chronic Pain**:

How Often Had Pain: 4 (Every Day) **AND**

How Often Pain Limits Life/Work: 4 (Every Day)

**High Opioid Use**:

Frequency of Opioid Use: 3 (Every Day) **AND**

Opioid Use - Past 12 Months: 1 (Yes)

**Difficulty with Social Functioning**:

Difficulty Doing Errands Alone: 4 (Cannot do at all) **AND**

Difficulty Participating in Social Activities: 4 (Cannot do at all)

**Hypertension**:

Ever Been Told You Had Hypertension: 1 (Yes) **AND**

Hypertension - Past 12 Months: 1 (Yes)
