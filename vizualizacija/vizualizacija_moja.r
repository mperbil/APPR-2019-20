library(ggplot2)
library(ggvis)
library(plotly)
# 3. faza: Vizualizacija podatkov

# Uvozimo zemljevid.
#zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip", "OB",
#                             pot.zemljevida="OB", encoding="Windows-1250")
#levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
#  { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
#zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels=levels(obcine$obcina))
#zemljevid <- fortify(zemljevid)

# IzraĂ„Ĺ¤unamo povpreĂ„Ĺ¤no velikost druÄąÄľine
#povprecja <- druzine %>% group_by(obcina) %>%
#  summarise(povprecje=sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))

######
ggplot(t1) + aes(x=igralec, y=cleanSheet) + geom_bar(stat="identity")
g1 <- ggplot(t1) + aes(igralec=igralec, ekipa=ekipa, x=appearances, y=cleanSheet, color=drzava) + geom_point() + ggtitle("Tekme brez prejetega zadetka") + xlab("Število nastopov") + ylab("Tekme brez prejetega zadetka")+labs(colour= "država")
g11 <- ggplotly(g1)
ggplot(t2) + aes(x=penaltyFaced, y=penaltySave, color=drzava) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Posredovanje pri enajstmetrovkah") + xlab("Ĺ tevilo enajstmetrovk") + ylab("Ĺ tevilo obranjenih enajstmetrovk") # + geom_line(data=t2, aes(x=penaltyFaced, y=penaltySave), color="green")
ggplot(t2) + aes(x=savedShotsFromInsideTheBox, y=goalsConcededInsideTheBox, color=drzava) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Posredovanje pri strelih znotraj kazenskega prostora") + xlab("Obranjeni streli znotraj kazenskega prostora") + ylab("Prejeti zadetki znotraj kazenskega prostora")
ggplot(t2) + aes(x=savedShotsFromOutsideTheBox, y=goalsConcededOutsideTheBox, color=drzava) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Posredovanje pri strelih izven kazenskega prostora") + xlab("Obranjeni streli izven kazenskega prostora") + ylab("Prejeti zadetki izven kazenskega prostora")
ggplot(t3) + aes(x=runsOut, y=successfulRunsOut, color=drzava) + geom_point() + geom_text(aes(label=ifelse(successfulRunsOut>18,as.character(igralec),'')),hjust=0, vjust=0, size=3) + ggtitle("Iztekanja") + xlab("Ĺ tevilo iztekov") + ylab("Ĺ tevilo uspeĹˇnih iztekov")
ggplot(t3) + aes(x=highClaims, y=crossesNotClaimed, color=drzava) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Posredovanje pri predloĹľkih") + xlab("Ĺ tevilo ujetih predloĹľkov") + ylab("Ĺ tevilo napak pri predloĹľkih")
ggplot(t4) + aes(x=ekipa, y=totalPasses, size=accuratePassesPercentage, color=drzava) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Podaje") + xlab("Ekipa") + ylab("Ĺ tevilo podaj")
ggplot(t4) + aes(x=accurateLongBallsPercentage, y=accurateLongBalls, size=accurateLongBallsPercentage, color=drzava) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Dolge Ĺ˝oge") + xlab("Odstotek natanÄŤnosti pri dolgih Ĺľogah") + ylab("Ĺ tevilo dolgih Ĺľog")

t5 <- t1 %>% group_by(drzava) %>% summarise(cleanSheet_drzava=sum(cleanSheet))
ggplot(t5) + aes(x=drzava, y=cleanSheet_drzava, fill=drzava) + geom_bar(stat="identity") + guides(fill=FALSE) + ggtitle("Tekme brez prejetega zadetka, glede na drĹľave") + xlab("") + ylab("Tekme brez prejetega zadetka")

t6 <- t2 %>% group_by(drzava) %>% summarise(penaltySave_drzava=sum(penaltySave))
ggplot(t6) + aes(x=drzava, y=penaltySave_drzava, fill=drzava) + geom_bar(stat="identity") + guides(fill=FALSE) + ggtitle("Obranjena enajstmetrovke, glede na drĹľave") + xlab("") + ylab("Ĺ tevilo obranjenih enajstmetrovk")

t6.2 <- t2 %>% group_by(drzava) %>% summarise(penaltyFaced_drzava=sum(penaltyFaced))
penaltyFaced_drzava <- t6.2[[2]]
t6.3 <- cbind(t6, penaltyFaced_drzava)
t6.3[,2] <- ifelse(t6.3$drzava == 'Germany', t6.3[,2] * (380/340), t6.3[,2])
t6.3[,3] <- ifelse(t6.3$drzava == 'Germany', t6.3[,3] * (380/340), t6.3[,3])
ggplot(t6.3) + aes(x=penaltyFaced_drzava, y=penaltySave_drzava) + geom_point() + geom_text(aes(label=drzava),hjust=0, vjust=0) + ggtitle("Enajstmetrovke, glede na drĹľave") #+ geom_smooth(method = "lm")


ggplot(t6.3, aes(x=drzava)) + 
  geom_col(aes(y=penaltyFaced_drzava, fill="Neobranjene enajstmetrovke")) + 
  geom_col(aes(y=penaltySave_drzava, fill="Obranjene enajstmetrovke")) + 
  xlab("") + ylab("Vse enajstmetrovke v ligi") + ggtitle("Enajstmetrovke glede na drĹľave")


t7 <- t2 %>% group_by(drzava) %>% summarise(goalsConcededOutsideTheBox_drzava=sum(goalsConcededOutsideTheBox))
ggplot(t7) + aes(x=drzava, y=goalsConcededOutsideTheBox_drzava, fill=drzava) + geom_bar(stat="identity") + guides(fill=FALSE)

t8 <- t2 %>% group_by(drzava) %>% summarise(goalsConcededInsideTheBox_drzava=sum(goalsConcededInsideTheBox))
ggplot(t8) + aes(x=drzava, y=goalsConcededInsideTheBox_drzava, fill=drzava) + geom_bar(stat="identity") + guides(fill=FALSE)

goalsConcededInsideTheBox_drzava<- t8[[2]]
t9 <- cbind(t7, goalsConcededInsideTheBox_drzava)

t9[,2] <- ifelse(t9$drzava == 'Germany', t9[,2] * (380/340), t9[,2])
t9[,3] <- ifelse(t9$drzava == 'Germany', t9[,3] * (380/340), t9[,3])

ggplot(t9, aes(x=drzava)) + 
  geom_col(aes(y=goalsConcededOutsideTheBox_drzava+goalsConcededInsideTheBox_drzava, fill="Zadetki izven 16m")) + 
  geom_col(aes(y=goalsConcededInsideTheBox_drzava, fill="Zadetki znotraj 16m")) + 
  xlab("") + ylab("Ĺ tevilo vseh zadetkov v ligi") + ggtitle("Prejeti zadetki glede na drĹľave")



# #tortni diagram za ita, za cleansheete 
# bp<- ggplot(podatki_v_ap_cs_ita, aes(x="", y=cleanSheet, fill=igralec))+
#   geom_bar(width = 1, stat = "identity")
# bp
# pie <- bp + coord_polar("y", start=0)
# pie
#za vse
bp<- ggplot(t6, aes(x="", y=penaltySave_drzava, fill=drzava))+
 geom_bar(width = 1, stat = "identity")
bp
pie <- bp + coord_polar("y", start=0)
pie


# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/110m_cultural.zip",
                             "ne_110m_admin_0_countries", encoding="UTF-8")

# a <- data.frame(zemljevid) %>% filter(CONTINENT=="Europe")
#  tm_shape(merge(a,
#                 t2 %>% group_by(drzava) %>% summarise(penaltySave=sum(penaltySave)),
#                 by.x="SOVEREIGNT", by.y="drzava")) +
#    tm_polygons("penaltySave") + ggtitle("Obranjena enajstmetrovke, glede na drĹľave")
# 
# 
# tm_shape(merge(zemljevid,
#                t1 %>% group_by(drzava) %>% summarise(cleanSheet=sum(cleanSheet)),
#                by.x="SOVEREIGNT", by.y="drzava")) +
#   tm_polygons("cleanSheet") + ggtitle("Tekme brez prejetega zadetka, glede na drĹľave")

zemljevid1 <- zemljevid[zemljevid$CONTINENT == "Europe",]
tm_shape(merge(zemljevid1,
               t1 %>% group_by(drzava) %>% summarise(cleanSheet=sum(cleanSheet)),
               by.x="SOVEREIGNT", by.y="drzava"), xlim=c(-15, 35), ylim=c(32, 72)) +
  tm_polygons("cleanSheet") + ggtitle("Tekme brez prejetega zadetka, glede na drĹľave")


tm_shape(merge(zemljevid1,
               t2 %>% group_by(drzava) %>% summarise(penaltySave=sum(penaltySave)),
               by.x="SOVEREIGNT", by.y="drzava"), xlim=c(-15, 35), ylim=c(32, 72)) +
  tm_polygons("penaltySave") + ggtitle("Obranjene enajstmetrovke, glede na drĹľave")


ggplotly(ggplot(t1) + aes(label=igralec, x=appearances, y=cleanSheet, color=drzava, ekipa= ekipa) + geom_point() + ggtitle("Tekme brez prejetega zadetka") + xlab("Ĺ tevilo nastopov") + ylab("Tekme brez prejetega zadetka") + geom_smooth(method = "lm", se=FALSE))

gg <- ggplotly(p)
gg



