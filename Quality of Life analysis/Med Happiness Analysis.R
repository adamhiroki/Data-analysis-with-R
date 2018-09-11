#In this analysis, we want to see the greatest impact on Med School Quality of Life
#between 4 measures of Quality of Life
#We also want to see what is the overall proportion of variance
#explained by the predictors in the model?

library(SDSFoundations)
res <- TempskiResilience

#Subset into the Basic Sciences
bas <- res[res$Group == "Basic Sciences",]

Question One
#Intial Correlations
vars <- c("WHOQOL.PH", "WHOQOL.PSY","WHOQOL.SOC","WHOQOL.ENV","MS.QoL")
cor(bas[,vars])

#RQ1 Model
ov_mod <- lm(MS.QoL ~ WHOQOL.PH + WHOQOL.PSY + WHOQOL.SOC + WHOQOL.ENV, data=bas)
summary(ov_mod)
confint(ov_mod)

#Diagnostics
plot(ov_mod, which=1)
cutoff <- 4/(ov_mod$df) 
plot(ov_mod, which=4, cook.levels=cutoff)

library(car)
vif(ov_mod)
plot(ov_mod, which=1)
cutoff <- 4/(ov_mod$df) 
plot(ov_mod, which=4, cook.levels=cutoff)

#Put model into context
lmBeta(ov_mod) 
round(pCorr(ov_mod), 4) 

#From our analysis,
#The model showed a significant overall effect (F(4,4454)=50.91,p<0.05)
#The four predictor variables accounted for 30.97% of the variance
#in the outcome of Med School Quality of Life.
#The best predictor of Med School Quality of Life was the Psychological
#QoL scale(t(454)=4.452,p<0.05)
#As Psychological QoL scale increases one unit,
#Med School Quality of Life increased by 0.0265 (Standardized beta=0.2723)
#Although significant, the best predictor in the model,
#Psychological QoL could only uniquely account for 3.0%
#of the variance in the outcome.