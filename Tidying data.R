#############------------Tidyr data---------------#################


install.packages("tidyr")
library(tidyr)


#tidyr makes it easy to tidy your data and easier to work with
#the 4 main func of tidyr are seperate(), unite(), gather(),spread()

teamnames <-data.frame("First.name" =c("Arif","Raviraj","Nandini"),
                       "Last.name" =c("khan", "gardi","Ahire"),
                       "Age" =c("23","23","22"), 
                      "Hometown" =c("mumbai,maharashtra", "panvel,maharashtra","Binghamtan,New york"),
                       stringsAsFactors = FALSE)
teamnames


#---------------seperate()
#splits  single column in to multiple columns
#Hometown column is divided in city and state
#seperate(data,column ,c("new columne"), sep ="," cut when there is a comma)

separate(teamnames,Hometown,c("City","State"), sep = ",")

#----------------unite()----------
#combines elements from different columns into one column

unite(teamnames,"Name",c(First.name, Last.name), sep =" ")

#------------------gather()
#use to stack similar columns

centuries <-data.frame("Player" =c("Sachin_Tendulkar","Rohit_sharma","virat_kohli"),
                       "2009"=c("5","2","0"),"2010" =c("8","3","4"), "2011"=c("3","4","3"),
                       stringsAsFactors = FALSE)

centuries

centuries2 <-gather(centuries, year, centuries,X2009:X2011)
centuries2

#---------------spread()

#back to original form arranged alphabetically
spread(centuries2, year, centuries)

