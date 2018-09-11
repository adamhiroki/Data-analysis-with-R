#In this analysis, we want to confirm the claim that Beck Depression Inventory score
# is a significant predictor of Overall Quality of Life among students enrolled in the Clinical Sciences program?
# and for students enrolled in the clinical science program,
#examine the effect of DREEM: Social Self Perception, DREEM:Academic Self Perception,
#Resilience, BDI, and Age on Med School of Life?

library(SDSFoundations)
res <- TempskiResilience

#Subset into the Clinical Sciences
clin <- res[res$Group == "Clinical Sciences",]

Question One
#Intial Correlations
vars <- c("QoL", "BDI")
cor(clin[,vars])

#RQ1 Model
ov_mod <- lm(QoL ~ BDI, data=clin)
summary(ov_mod)
confint(ov_mod)

#Diagnostics
plot(ov_mod, which=1)
cutoff <- 4/(ov_mod$df) 
plot(ov_mod, which=4, cook.levels=cutoff)

#Question Two
#Initial correlations
vars <- c("MS.QoL", "DREEM.S.SP", "DREEM.A.SP", "Resilience", "BDI", "Age")
cor(clin[,vars], use="pairwise.complete.obs")

#Test the initial correlations
library(psych)
corr.test(clin[,vars], use="pairwise.complete.obs")

#RQ2 Model
ms_mod <- lm(MS.QoL ~ DREEM.S.SP + DREEM.A.SP + Resilience + BDI + Age, data=clin)
summary(ms_mod)
confint(ms_mod)

#Diagnostics
library(car)
vif(ms_mod)
plot(ms_mod, which=1)
cutoff <- 4/(ms_mod$df) 
plot(ms_mod, which=4, cook.levels=cutoff)

#Put model into context
lmBeta(ms_mod) 
round(pCorr(ms_mod), 4) 

#From our analysis, we investigated the claimed effect of Beck Depression Inventory score on Overall Quality of Life
#There was a negative correlation between Beck Depression Inventory score and Overall Quality of Life
#The corresponding model showed a significant simple slope for Beck Depression inventory
#(t(489(=-8.935,p<0.05))) Indicating that as the Beck Depression Inventory score increases,
#the overall quality of life score decreases
#For the multiple linear regression examined the impact of DREEM: Social Self Perception, 
#DREEM:Academic Self Perception, Resilience, BDI, and Age on MEd School Quality of Life.
#Overall, the model was significant (F(5,485)=48.59,p<0.05) and could account for 33.37% of the variance
#in the outcome(Adjusted R^2=32.69%)
#The best predictor of Med School Quality of Life was DREEM:Social Self Perception
#which could account for a unique proportion of variance in the outcome of 8.23%.