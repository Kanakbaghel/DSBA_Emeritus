# Getting the file

# Option 1 : 
# 1. Setting up the working directory
# 2. Using data <- read.csv(file_name)

# Option 2 :
# 1. Using environment

head(titanic_2_)

# Checking up on data
str(titanic_2_)

# Checking missing values
is.na(titanic_2_$Age) # returns true and false 
sum(is.na(titanic_2_$Age))

ismissing <- function(x){
  sum(is.na(x))
}
sapply(titanic_2_, ismissing)
titanic_2_$Cabin

sapply(titanic_2_ , function(x) {sum(is.na(x))})

"" == FALSE

# 1. [] : Square brackets -> indexing e.g. titanic_2_[]
# 2. () : Parentheses -> which always follow a function e.g. sum(), sapply(), head()
# 3. {} : Curly brackets -> to identify block of code e.g. in function f(x){block of code}, if (condition) {} loop :[]

# replace empty strings
titanic_2_$Cabin <- sapply(titanic_2_$Cabin, trimws)
titanic_2_[titanic_2_$Cabin == "", 'Cabin'] <- NA

trimws(titanic_2_$Cabin == "")

# Check for duplicates
sum(duplicated(titanic_2_))

# Create a dataframe in R
df <- data.frame(
  name   = c("Kanak", "Sapna", "Meera"),
  age    = c(23, 30, 27),
  sex    = c("F", "M", "F"),
  height = c(160, 175, 168),
  weight = c(55, 70, 60),
  mem    = c("TRUE", "FALSE", "TRUE")   
)

# View the dataframe
print(df)

list(name = "Simran",
     age = 25,
     sex = 'F',
     height = 165,
     weight = 49,
     mem = FALSE)

# add the row to df
df <- rbind(df,list(name = "Simran",
                    age = 25,
                    sex = 'F',
                    height = 165,
                    weight = 49,
                    mem = FALSE))
# to view data
df

duplicated(df)
sum(duplicated(df))

# to get location of duplicated
which(duplicated(df))

# if you want to consider the latest value as original 
duplicated(df, fromLast = TRUE)
which(duplicated(df, fromLast = TRUE))

# now, considering only id column for identifying duplicates
# name and sex 

duplicated(df[c('name','sex')])
which(duplicated(df[c('name','sex')]))

duplicate_rows <- which(duplicated(df[c('name','sex')]))
df[-c(duplicate_rows),]
df

# for dropping rows
df[-4,]

# removing duplicate rows
unique(df)

# adding a column
df$Country <- c('US','U.S.A','India','China')
df

# get the unique values from the column
unique(df$Country)

df$Country <- tolower(df$Country)
df

# to get frequency
table(df$Country)

#transform
df$Country <- sapply(df$Country, 
       function (Country) {ifelse((Country == "us") || (Country == 'u.s.a'),
                'us', Country)})
df
