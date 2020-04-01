#######--------------------Data preparartion---------------


#---------Types of variable in R

#character
class("true")

#make this evaluate to numeric
class(420)
class(72.5)

#integer
class(69L)

class("robotics")
#factor
class(factor("robotics"))

#logical
class(TRUE)

#--------------------------------------------------------

#------------------common type conversions

#preview students with str()

students <- read.csv("F:\\eckovation.R\\students.csv")
head(students)

str(students)

#here grades is shown as factor, we know it is a character, so will change the data type

#coerce grades to character
students$Grades <-as.character(students$Grades)

#some goes with the father and mother education
#coerce Medu to factor

students$Medu <-as.factor(students$Medu)
students$Medu
#coerce fedu tto factor
students$Fedu <-as.factor(students$Fedu)

#Look at the students once more with str()
str(students)

#----------------------------------------------------------------------

#Visualizing dat for detecting outliers
boxplot(students$traveltime)
boxplot(students$studytime)

hist(students$absence)

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------


#here we use built in dataset in R iris
#the downloaded data may not have headers so you can name them using

#--------------------------------------------------------------------------------

data("iris")

View(iris)

head(iris)

#-----show no of rows and columns

dim(iris) #150 rows and 5 col.

#check NA values using apply and is.naapply() function 

apply(iris,2, function(x) sum(is.na(x)))

#2 for row, creating a func with argument"x"

#-----structure of data
#shows type of variable o of our dataet contain, no of observations
# all the column are number and species is factor since it is categorical

str(iris)
#--------------------------------------------------------------------

#-------------------------------------------------------------------

#select sepal column

#selecting in a diff way, if we dont know the columns, we can index
petal_cols <-iris[,c(3,4)]
head(petal_cols)

#-------------------------------------------------------
#select 1st 4 rows of sepal.length colm
iris[1:4, "Sepal.Length"]
#select 1st 4 rows of of all colmn.
iris[1:4,]

#----------------------------------------------

#--------select virginica with all colmns.
virginica <-iris[iris$Species=="virginica",]
head(virginica)

#------------------------------------------------------------
#-------------------data subset

#taking out similar set of data from large dataset
#basically other way to extract data what we did for virginica

#subset data with versicolor species

versicolor <- subset(iris,Species=="versicolor")

head(versicolor)

#--------conditional subsetting

#we can subset based on a certain condition

cond_subset <-subset(iris,Sepal.Length <= 5 & Petal.Width >=0.1)
#sepal length must be less than equal to 5 and petal width greater than equal to 0.1

head(cond_subset)

#some other con where only species has to be shown 

cond_subset1 <- subset(iris,Sepal.Length <= 5 & Petal.Width>=0.1, select = Species)

head(cond_subset)

#--------------------------------------------------------------
#--------------data ordering-----------

#ascending order

ascending <- iris[order(iris$Petal.Length),]

head(ascending)

#--------descending order------

descending <- iris[order(iris$Petal.Length , decreasing = TRUE),]
head(descending)

#------------------------------------------------------------------
#------------merging dataset------------------

#sometimes data from diff sources has to be clubbed for some analysis
#func = merge()
#needs a common variable , based on which merging can be done

#we will create a common variable first,

#create a new column "id" and assign value 1 to 150

iris_id <-iris
iris_id
iris_id$ID <- 1:150  # creates new column id: 1 to 150

head(iris_id)


#create 2 data subsets with a common variable "id"

sepal_data <- subset(iris_id, select = c("Sepal.Length", "Sepal.Width","ID"))
head(sepal_data)

petal_data <- subset(iris_id, select = c("Petal.Length","Petal.Width" ,"ID"))
head(petal_data)


#merge the 2 subsets

merge_data <- merge(sepal_data,petal_data, by ="ID")
head(merge_data)

#--------------------------------------------------------------------

#------------Adding new row----------------

iris.new <-rbind(iris,c("5.3","3.3","1.3","0.3", "setosa"))

nrow(iris.new)   # now it is 151
tail(iris.new)

#cbind() for adding columnss.

iris.new1 <-cbind(iris,c("6.5","3.4","1.6","0.3","versicolor"))
NCOL(iris.new1)   
tail(iris.new1)
#---------------------------------------------------------------------------
#---------dropping a column-------------
#dropping using index

iris2<- iris_id[, -6]
#here dropped 6th column "ID" by indexing it as negative 6

head(iris2)

#droppig by assigning null

iris2$species <-NULL

head(iris2)      #species get deleted

#use within() to remove attributes

iris4 <- within(iris,rm(Sepal.Length))
#within iris data we removed ,"rm" the sepal length

head(iris4)

#-------------------------------------------------------------------------

#visualizing data for detecting outliers

boxplot(iris$Sepal.Length)
boxplot(iris$Sepal.Width)

hist(iris$Petal.Width)




