# 4. faza: Analiza podatkov

ggplot(t1) + aes(x=appearances, y=cleanSheet, color=drzava) + geom_point()+ geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Tekme brez prejetega zadetka") + xlab("Število nastopov") + ylab("Tekme brez prejetega zadetka") + geom_smooth(method = "lm", se=FALSE)
ggplot(t2) + aes(x=penaltyFaced, y=penaltySave, color=drzava) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Posredovanje pri enajstmetrovkah") + xlab("Število enajstmetrovk") + ylab("Število obranjenih enajstmetrovk") + geom_smooth(method = "lm", se=FALSE)
ggplot(t3) + aes(x=runsOut, y=successfulRunsOut, color=drzava) + geom_point() + geom_text(aes(label=ifelse(successfulRunsOut>18,as.character(igralec),'')),hjust=0, vjust=0, size=3) + ggtitle("Iztekanja") + xlab("Število iztekov") + ylab("Število uspešnih iztekov") + geom_smooth(method = "lm", se=FALSE)
ggplot(t2) + aes(x=savedShotsFromInsideTheBox, y=goalsConcededInsideTheBox, color=drzava) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Posredovanje pri strelih znotraj kazenskega prostora") + xlab("Obranjeni streli znotraj kazenskega prostora") + ylab("Prejeti zadetki znotraj kazenskega prostora") + geom_smooth(method = "lm", se=FALSE)
ggplot(t2) + aes(x=savedShotsFromOutsideTheBox, y=goalsConcededOutsideTheBox, color=drzava) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Posredovanje pri strelih izven kazenskega prostora") + xlab("Obranjeni streli izven kazenskega prostora") + ylab("Prejeti zadetki izven kazenskega prostora") + geom_smooth(method = "lm", se=FALSE)
ggplot(t3) + aes(x=highClaims, y=crossesNotClaimed, color=drzava) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Posredovanje pri predložkih") + xlab("Število ujetih predložkov") + ylab("Število napak pri predložkih") + geom_smooth(method = "lm", se=FALSE)
ggplot(t4) + aes(x=totalPasses, y=accuratePassesPercentage, color=drzava) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Podaje") + xlab("Število podaj") + ylab("Natan�nost podaj") + geom_smooth(method = "lm", se=FALSE)
ggplot(t4) + aes(x=accurateLongBalls, y=accurateLongBallsPercentage, size=accurateLongBallsPercentage, color=drzava) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + ggtitle("Dolge Žoge") + xlab("Število dolgih žog") + ylab("Odstotek natančnosti pri dolgih žogah") + geom_smooth(method = "lm", se=FALSE)


# t1 %>% 
#   filter(drzava == "France")
# u1 <- t1 %>% group_by(appearances) %>% summarise(cleanSheet=sum(cleanSheet))
# 
# 
# 
# t1.norm <- t1 %>% select(-igralec) %>% scale()
# rownames(t1.norm) <- t1$igralec
# k <- kmeans(t1.norm, 5)
# 
# 
# podatki <- t1 %>% transmute(igralec, cleanSheet, appearances) #%>%
#   #left_join(drzava, by="igralec")
# row.names(podatki) <- podatki$igralec
# podatki$igralec <- NULL
# 
# 
#  
# # Število skupin
# n <- 5
# skupine <- hclust(dist(scale(podatki))) %>% cutree(n)
