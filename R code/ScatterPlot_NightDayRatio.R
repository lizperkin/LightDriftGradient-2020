##Drift graphs for light gradient
#Create following figures:
#1 - Drift v. light (VIIRS 2018)
#2 - Drift v. temp

#Dependencies----
library(readxl)
library(openxlsx)
library(tidyverse)
library(plyr)
library(dplyr)
library(tidyr)
library(purrr)
library(ggplot2)
library(car)
library(ggpubr)

#load data file
drift<-read_xlsx("raw data/LightGradientDrift.xlsx",
              sheet = "NightDayRatio")

#convert date
drift$Date <- as.Date(drift$Date,"%Y-%m-%d")
drift$Month <- format(drift$Date, "%B")

#subset months
jul<-subset(drift, Month == "July")
aug<-subset(drift, Month == "August")

#Light levels----------------------------------------------------------------

rad <- ggplot(drift, 
               aes(x=VIIRS2018, y=NightDayRatio, fill=Month)) + 
  geom_point(size=4, 
             shape=21)+
             #colour=black)+
             #aes(colour = month))+
  scale_colour_viridis_d(begin=0.05,end=0.5,
    aesthetics = "fill")+
  theme(#legend.position="none", 
        axis.title.y = element_text(size=14), #face = "bold"), 
        axis.title.x = element_text(size=14), #face= "bold"), 
        axis.text=element_text(size=12),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"))+
  ylab("Night:Day Drift Ratio")+
  xlab(expression(paste("Radiance 10"^{-9}, "W/cm"^{2},"*sr")))
  #geom_hline(yintercept = 0.12, linetype= "dotted")+
  #geom_text(aes(label= "CCME WQG = \n0.12 mg/L", x=3.5, y=0.12), color = "#0d0c0c", size= 2)

rad
ggsave("figures/LightDrift_19Dec20.png", width = 5.2, height = 4)

#July only
rad.j <- ggplot(jul, 
              aes(x=VIIRS2018, y=NightDayRatio, fill=Temp)) + 
  geom_point(size=4, 
             shape=21)+
  scale_colour_viridis_c(begin=0.0,end=1,
                         aesthetics = "fill")+
  theme(axis.title.y = element_text(size=14),
    axis.title.x = element_text(size=14), 
    axis.text=element_text(size=12),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(), 
    panel.background = element_blank(), 
    axis.line = element_line(colour = "black"))+
  ylab("Night:Day Drift Ratio")+
  xlab(expression(paste("Radiance 10"^{-9}, "W/cm"^{2},"*sr")))

rad.j
ggsave("figures/JulyLightDrift_19Dec20.png", width = 5.2, height = 4)

#August only
rad.a <- ggplot(aug, 
                aes(x=VIIRS2018, y=NightDayRatio, fill=Temp)) + 
  geom_point(size=4, 
             shape=21)+
  scale_colour_viridis_c(begin=0.0,end=1,
                         aesthetics = "fill")+
  theme(axis.title.y = element_text(size=14),
        axis.title.x = element_text(size=14), 
        axis.text=element_text(size=12),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"))+
  ylab("Night:Day Drift Ratio")+
  xlab(expression(paste("Radiance 10"^{-9}, "W/cm"^{2},"*sr")))

rad.a
ggsave("figures/AugLightDrift_19Dec20.png", width = 5.2, height = 4)
#Stream temp----------------------------------------------------------------

temp <- ggplot(drift, 
              aes(x=Temp, y=NightDayRatio, fill=Month)) + 
  geom_point(size=4, 
             shape=21)+
  #colour=black)+
  #aes(colour = month))+
  scale_colour_viridis_d(begin=0.05,end=0.5,
                         aesthetics = "fill")+
  theme(#legend.position="none", 
    axis.title.y = element_text(size=14), #face = "bold"), 
    axis.title.x = element_text(size=14), #face= "bold"), 
    axis.text=element_text(size=12),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(), 
    panel.background = element_blank(), 
    axis.line = element_line(colour = "black"))+
  ylab("Night:Day Drift Ratio")+
  xlab(expression(paste("Water Temperature (",degree,"C)")))

temp
ggsave("figures/TempDrift_19Dec20.png", width = 5.2, height = 4)

#July only
temp.j <- ggplot(jul, 
               aes(x=Temp, y=NightDayRatio, fill=VIIRS2018)) + 
  geom_point(size=4, 
             shape=21)+
  #colour=black)+
  #aes(colour = month))+
  scale_colour_viridis_c(begin=0.0,end=1,
                         aesthetics = "fill")+
  theme(#legend.position="none", 
    axis.title.y = element_text(size=14), #face = "bold"), 
    axis.title.x = element_text(size=14), #face= "bold"), 
    axis.text=element_text(size=12),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(), 
    panel.background = element_blank(), 
    axis.line = element_line(colour = "black"))+
  ylab("Night:Day Drift Ratio")+
  xlab(expression(paste("Water Temperature (",degree,"C)")))

temp.j
ggsave("figures/JulTempDrift_19Dec20.png", width = 5.2, height = 4)

#August only
temp.a <- ggplot(aug, 
                 aes(x=Temp, y=NightDayRatio, fill=VIIRS2018)) + 
  geom_point(size=4, 
             shape=21)+
  #colour=black)+
  #aes(colour = month))+
  scale_colour_viridis_c(begin=0.0,end=1,
                         aesthetics = "fill")+
  theme(#legend.position="none", 
    axis.title.y = element_text(size=14), #face = "bold"), 
    axis.title.x = element_text(size=14), #face= "bold"), 
    axis.text=element_text(size=12),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(), 
    panel.background = element_blank(), 
    axis.line = element_line(colour = "black"))+
  ylab("Night:Day Drift Ratio")+
  xlab(expression(paste("Water Temperature (",degree,"C)")))

temp.a
ggsave("figures/AugTempDrift_19Dec20.png", width = 5.2, height = 4)

#Light & Temp-----------------------------------------------------------------
rad.t <- ggplot(drift, 
              aes(x=VIIRS2018, y=NightDayRatio, fill=Temp)) + 
  geom_point(size=4, 
             shape=21)+
  #colour=black)+
  #aes(colour = month))+
  scale_colour_viridis_c(begin=0.0,end=1,
                         aesthetics = "fill")+
  theme(#legend.position="none", 
    axis.title.y = element_text(size=14), #face = "bold"), 
    axis.title.x = element_text(size=14), #face= "bold"), 
    axis.text=element_text(size=12),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(), 
    panel.background = element_blank(), 
    axis.line = element_line(colour = "black"))+
  ylab("Night:Day Drift Ratio")+
  xlab(expression(paste("Radiance 10"^{-9}, "W/cm"^{2},"*sr")))

rad.t
ggsave("figures/LightTempDrift_19Dec20.png", width = 5.2, height = 4)


#Combining & saving plots--------------------------------------------------
ggarrange(rad,temp,
          ncol=2, nrow=1)
ggsave("figures/LightTempDrift.png", width = 10.5, height = 8)

#Quick & Dirty Plots----------------------------------------------------------

plot(NightDayRatio~VIIRS2018,pch=16,axes=FALSE,xlab="",ylab="",data=drift)
axis(1)
axis(2,las=1)
box(bty="l")
mtext(text="Radiance",side=1,line=2.5)#need to add units
mtext(text="Night:Day Drift Ratio",side=2,line=2.5)


plot(NightDayRatio~Temp,pch=16,axes=FALSE,xlab="",ylab="",data=drift)
axis(1)
axis(2,las=1)
box(bty="l")
mtext(text=expression(paste("Water Temperature [",degree,"C]")),side=1,line=2.5)
mtext(text="Night:Day Drift Ratio",side=2,line=2.5)
