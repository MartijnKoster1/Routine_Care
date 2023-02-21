library(ggdag)
library(dagitty) 

dag1 <- dagify(
  hlsU ~ sex + age + oU, # + other unobseverd variables that accumulate in this one (like smoking)
  cntct ~ hlsU, #healthy life style is unobserved, contact is a proxy
  vacc ~ cntct + age, # if you have not seen your GP in the last 12 months, you are not vaccinated
  pulm ~ hlsU, # rokerslong door niet gezonde levenstijl
  DM ~ age + cntct + hlsU, # diabetes door niet gezonden levenstijl, geen contact met de docter, en leeftijd
  cvd ~ age + cntct + pulm + DM + hlsU, # hart en vaatziektes door leeftijd, geen contact met docter, rokerslong, diabetes en niet gezonde levenstijl
  hosp ~ cvd + pulm + DM + cntct + vacc, # hosp door alle enge ziektes en geen griepvaccine. 
  exposure = "vacc", # The treatment
  outcome = "hosp" # The effect of treatment
  # optional: give co-ordinates of the variables in the plot
) 
ggdag_status(dag1) + theme_dag()