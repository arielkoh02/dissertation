library(tidyverse)

# Example in R:

# Dummy data 
dummydata<-read.csv("dummydata.csv")
View(dummydata)

# Fit GLM with Gamma family and log link
model <- glm( Phytoplankton.Abudance~Coverage , family = Gamma(link = "log"),data=dummydata)

# Summary of the model
summary(model)

dummydata$predicted<-predict(model,type="response")

# Plot model predictions
dummydataplot<-ggplot(dummydata, aes(x=Coverage,y=Phytoplankton.Abudance))+
  geom_point()+geom_line(aes(y=predicted),colour="slateblue4")+
  theme_classic()+
  theme(axis.title = element_text(size=20), 
        axis.text.x=element_text(size=20), 
        axis.text.y=element_text(size=20))+
  labs(
    x = "FPV Coverage (%)",
    y = "Phytoplankton Abundance"
  )
dummydataplot

ggsave("graphs/dummyplot.png", plot=dummydataplot,width = 14, height = 8, units = "in", dpi = 700)

model2 <- glm( DOM.concentration~Coverage , family = Gamma,data=dummydata)
dummydata$predictedDOM1<-predict(model2,type="response")

dummydataplot3<-ggplot(dummydata, aes(x=Coverage,y=DOM.concentration))+
  geom_point()+geom_line(aes(y=predictedDOM1,colour="slateblue4"))+
  theme_classic()+
  theme(axis.title = element_text(size=20), 
        axis.text.x=element_text(size=20), 
        axis.text.y=element_text(size=20))+
  labs(
    x = "FPV Coverage (%)",
    y = "Phytoplankton Abundance"
  )

dummydataplot3



dummydata$expDOM<-exp(dummydata$DOM.concentration)

model1 <- lm(logDOM~Coverage,data=dummydata)
summary(model1)

ggplot(dummydata,aes(x=Coverage,y=expDOM))+geom_point()

dummydataplot1<-ggplot(dummydata, aes(x=Coverage,y=DOM.concentration))+
  geom_point()+geom_smooth(colour="slateblue4",se=F)+
  theme_classic()+
  theme(axis.title = element_text(size=20), 
        axis.text.x=element_text(size=20), 
        axis.text.y=element_text(size=20))+
  labs(
    x = "FPV Coverage (%)",
    y = "DOM concentration (mg/L)"
  )
dummydataplot1

ggsave("graphs/dummyplot1.png", plot=dummydataplot1,width = 14, height = 8, units = "in", dpi = 700)
