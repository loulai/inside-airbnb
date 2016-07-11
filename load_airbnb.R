library(dplyr)
library(readr)

# define a function to turn strings into datetimes
parse_datetime <- function(s, format="%Y-%m-%d %H:%M:%S") {
  as.POSIXct(as.character(s), format=format)
}

########################################
# load and clean trip data
########################################

# load each month of the trip data into one big data frame
csvs <- Sys.glob('reviews.csv')
reviews <- data.frame()
for (csv in csvs) {
  print(csv)
  #tmp <- read_csv(csv, na='\\N')
  
  # the date format changed to something ugly in 2014-09 which read_csv doesn't recognize as a datetime,
  # so manually convert the date from a string to a datetime
  #if (typeof(tmp$starttime) == "character")
 #  tmp <- mutate(tmp,
   #               starttime=parse_datetime(starttime, "%m/%d/%Y %H:%M:%S"),
    #              stoptime=parse_datetime(stoptime, "%m/%d/%Y %H:%M:%S"))
  
  #trips_2015 <- rbind(trips_2015, tmp)
}

# replace spaces in column names with underscores
names(reviews) <- gsub(' ', '_', names(reviews))

# recode gender as a factor 0->"Unknown", 1->"Male", 2->"Female"
#trips_2015 <- mutate(trips_2015, gender=factor(gender, levels=c(0,1,2), labels=c("Unknown","Male","Female")))

########################################
# load and clean weather data
########################################

save(reviews, file='reviews.RData')

