# Observed Trends Among Mental Health Disorders and Physical, Social, & Substance-Related Covariates in the United States
### Website, visualizations, and conclusions written and designed by Sam Sievertsen, Zayna Lughod, Kayla Stocker, and Emily Garat for INFO201, Spring 2022

### Abstract
Despite major public outreach, research, and education throughout the last two decades in American society, psychiatric and psychological disorders remain disastrously pervasive and pathological. Hence, we propose analysis of current population rates of the most prevalent clinical disorders: anxiety, depression, and dementia, and examination of relevant co-variates including opioid use, chronic pain, hypertension, and social functioning. Accordingly, we plan to conduct meta, correlation coefficient, regression, and other analysis measures to be presented in various visualizations. This data is vital in understanding population occurrence rates, significant contributing factors, and corresponding treatments.

**Keywords**: Mental Health, Chronic Pain, Opioids, Social Functioning, Hypertension, Comorbidities

### Introduction
We will be looking at mental health disorders (specifically anxiety, depression, and dementia) and how they relate to other issues such as chronic pain, opioid use, social functioning, and hypertension in the general American public. We chose to research these mental health disorders because of their widespread influence in the U.S. today and it is important to have an understanding of their correlations with other health conditions. We also realize that many mental health disorders are greatly impacted by other factors, so we want to understand the extent and why certain factors might matter more than others. Our research questions include:

- How frequently do these disorders occur?
- What is the relationship between the mental health disorders (anxiety, depression, and dementia) and these co-variates?
- Which of the co-variates relates the most to mental health disorders/which relates the least?
- How might we improve these disorders?

### Related Work
Many studies have observed correlations between common mental health disorders and physical illnesses. In [Association of opioid misuse with anxiety and depression: A systematic review of the literature](https://doi.org/10.1016/j.cpr.2021.101978), researchers discuss how opioid abuse can be associated with symptoms of anxiety and depression and make suggestions to address the dearth of research (and raw data) in this field with the goal of identifying more effective, contextually relevant treatments. Also, [Optogenetics and its application in pain and anxiety research](https://doi.org/10.1016/j.neubiorev.2021.06.003) discusses the correlation between mental health and physical illnesses. The researchers describe a possible treatment for chronic pain and anxiety (as the two are often comorbid). Optogenetics is a new treatment that is still being researched, though it is still being developed. As noted in the previous article, a lot of these issues are still being researched as there is a lack of concrete data. Similarly, [A lateralized model of the pain-depression dyad](https://doi.org/10.1016/j.neubiorev.2021.06.003) discusses how depression and chronic pain are closely associated, so much that symptoms may be focused in one area of the body. The researchers argue that the diagnosis of one illness should lead to checks for the other related illness. Finally, [Depression and sleep disorders related to hypertension: A cross-sectional study in Medellín, Colombia](https://doi-org.offcampus.lib.washington.edu/10.1016/j.rcp.2018.05.004) examined a new digital intervention to address hypertension as a possible risk factor for depression. Altogether, this research proves that there is a possible relation between many of these disorders, but we need to examine the data in order to figure out the extent of the connections.

**References**

Andrew H. Rogers, Michael J. Zvolensky, Joseph W. Ditre, Julia D. Buckner, Gordon J.G. Asmundson,
Association of opioid misuse with anxiety and depression: A systematic review of the literature,
Clinical Psychology Review,
Volume 84,
2021,
101978,
ISSN 0272-7358,
https://doi.org/10.1016/j.cpr.2021.101978.

Anne Margarette S. Maallo, Eric A. Moulton, Christine B. Sieberg, Donald B. Giddon, David Borsook, Scott A. Holmes,
A lateralized model of the pain-depression dyad,
Neuroscience & Biobehavioral Reviews,
Volume 127,
2021,
Pages 876-883,
ISSN 0149-7634,
https://doi.org/10.1016/j.neubiorev.2021.06.003.

Flórez-García, V., Rojas-Bernal, L. Á., & Bareño-Silva, J. (2020). Depression and sleep disorders related to hypertension: A cross-sectional study in Medellín, Colombia. Depresión y trastornos del sueño relacionados con hipertensión arterial: un estudio transversal en Medellín, Colombia. Revista Colombiana de psiquiatria (English ed.), 49(2), 109–115. https://doi-org.offcampus.lib.washington.edu/10.1016/j.rcp.2018.05.004.

Sarah Jarrin, David P. Finn,
Optogenetics and its application in pain and anxiety research,
Neuroscience & Biobehavioral Reviews,
Volume 105,
2019,
Pages 200-211,
ISSN 0149-7634,
https://doi.org/10.1016/j.neubiorev.2019.08.007.

### The Dataset
The following data set originates from the 2020 National Health Interview Survey conducted by the Centers for Disease Control and Prevention (CDC). The data is collected via a questionnaire from the National Health Interview Survey (NHIS) and datasets are available for viewing and/or downloading via the Internet. The procedure and methodology in collecting the data are constructed based on The Statistical Design of the Health Household-Interview Survey published by The Public Health and Service Publication. The data was also collected using complex sample design software such as SUDAAN, Stata, SPSS, R, SAS survey procedures. The goal in collecting this census-based information regularly is to evaluate and monitor the general health and wellbeing of the nation. The data assesses a broad range of health topics and provides the information necessary to establish proper health status, health care access, and advancements toward achieving national health objectives. Our dataset contains 31,568 rows of data and 618 columns of data. An ethicality to keep in mind when evaluating this data is that the accessibility of this questionnaire is derived from the Internet, meaning the population completing the survey is most likely restricted to individuals with prior knowledge of and access to online surveying methods. Associations based on this dataset may be skewed due to differential misclassification, as it is a voluntary survey so those who choose to respond may have a slightly different perspective influenced by foundational understanding of the survey’s purpose. There may be contextual factors contributing to individuals’ willingness or unwillingness to respond that could bias the available data.

### Implications
In addressing our analytic research questions, it appears the relationship between mental health disorders and physical symptoms may be due to the fact that those experiencing chronic pain are also likely to be struggling from a mental health illness, as is sometimes the case with opioid use disorders. Anecdotal evidence suggests social functioning is impacted by mental health, so our analysis aims to learn if there are empirical trends to match these experiences. The possible implications of our following data set are assessing how mental illness can manifest into physical-related symptoms that can affect the overall well-being of peoples’ lives. The data that we are accumulating can help policymakers establish more accommodating laws and features for those that suffer from mental health-related illnesses as mental health is just as significant as physical illness and can often both be heavily correlated. This can also establish various innovations towards certain technologies that can support and aid those who struggle with mental health-related illnesses, but our initial goal is to provide the general public with a tool to visualize the challenges many of us face every day. On a personal level, easy-to-read and interpret datasets pertaining to mental health comorbidities will ideally help others to find community and support in their experiences with language and numerical data to help tell their story.

### Limitations & Challenges
Because of the sheer amount of data contained in the dataframe we’re using, specific details may get lost when establishing various points. Since we are using variables on mental health that are interpreted through a master list of all health-related aspects in adults, this can potentially make it difficult to instill accurate and precise data as our main data set merely includes mental health as one variable among many. Using co-variates to assess our main topic on mental health may result in disregarding other important data included in the NHIS. These are not necessarily limitations, but rather things to remain mindful of when we are evaluating various forms of the data we are collecting and emphasizing the importance of utilizing it to the best of our ability. As mentioned above, this dataset contains responses from many populations all over the nation and therefore is also lacking in contextual information to expand upon in our visualizations.
