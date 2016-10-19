marks<-c(45,20,35,85,20,28,15,25,35,45,50,60,75,74,65,60,55,75,80,55)
cut.points<-cut(marks, breaks=c(0,40,50,60,70,100));cut.points
#ie in marks 45 is btwn (40,50],20 is btwn (0,40] etc and levels show these breaks
levels(cut.points)<-c("E","D","C","B","A") #assign levels a string
table(cut.points)#table with level string and count in marks
