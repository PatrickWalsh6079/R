library(ggplot2)
library(maps)
library(ggmap)
library(mapproj)


#1. Add a comment for each line of code, explaining what that line of code does. 
us <- map_data("state")

map <- ggplot(us)  # Cast us dataset into variable called 'map'
map <- map + aes(x=long, y=lat, group=group) + geom_polygon()   # Setup aes() and type of plot for map
map <- map + expand_limits(x=us$long, y=us$lat)  # Specify the expand_limits() of the map by long and lat
map <- map + coord_map() + ggtitle("USA Map")  # Make map scale when window is resized
map




#2. The map you just created fills in the area of each county in black while outlining it with a thin white line. 
# Use the fill= and color= commands inside the call to geom_polygon( ) to reverse the color scheme
map <- ggplot(us)
map <- map + aes(x=long, y=lat, group=group) + geom_polygon(fill = "white", color = "black" ) 
map <- map + expand_limits(x=us$long, y=us$lat)
map <- map + coord_map() + ggtitle("USA Map")
map


#3. Just as in step 2, the map created below fills in the area of each county in black
#   while outlining it with a thin white line. 
ny_counties <- map_data("county","new york")
ggplot(ny_counties) +
  aes(long,lat, group=group) +
  geom_polygon()



#3a.Use the fill= and color= commands inside the call to geom_polygon( ) to reverse the color scheme. 
ny_counties <- map_data("county","new york")
ggplot(ny_counties) +
  aes(long,lat, group=group) +
  geom_polygon(fill = "white", color = "black")
 
#4. Run head(ny_counties) to verify how the county outline data looks. 
 head(ny_counties)

#5. Make a copy of your code from step 3 and add the following subcommand to your ggplot( ) 
#   call (don't forget to put a plus sign after the geom_polygon( ) statement to tell R 
#   that you are continuing to build the command): 
#   coord_map(projection = "mercator")
 ny_counties <- map_data("county","new york")
 ggplot(ny_counties) +
   aes(long,lat, group=group) +
   geom_polygon(fill = "white", color = "black") +
   coord_map(projection = "mercator")

#   In what way is the map different from the previous map. 
#   Be prepared to explain what a Mercator projection is.
# Adding the projection = "mercator" line within the coord_map() parameter made the
# grid lines wider.


#6. Grab a copy of the nyData.csv data set from: https://intro-datascience.s3.us-east-2.amazonaws.com/nyData.csv 
# Read that data set into R with read_csv(). The next step assumes that you have named the resulting data frame “nyData.” 
nyData <- read.csv("https://intro-datascience.s3.us-east-2.amazonaws.com/nyData.csv")


#7. Next, merge your ny_counties data from the first breakout group with your new nyData data frame, with this code: 
mergeNY <- merge(ny_counties,nyData, all.x=TRUE,by.x="subregion",by.y="county") 
 
#8. Run head(mergeNY) to verify how the merged data looks. 
head(mergeNY) 

#9. Now drive the fill color inside each county by adding the fill aesthetic inside of your geom_polygon( ) 
# subcommand (fill based on the pop2000).
# Convert pop2000 vector to numeric so that data is displayed as contiuous rather than categorical:
mergeNY$pop2000 <- gsub(",", "", mergeNY$pop2000)
mergeNY$pop2000 <- as.numeric(mergeNY$pop2000)
glimpse(mergeNY)

ggplot(mergeNY) +
  aes(long,lat, group=group) +
  geom_polygon(aes(fill = pop2000), color = "black") +
  coord_map(projection = "mercator")


#10. Extra (not required): 
#a. Read in the following JSON datasets: 
# 'https://gbfs.citibikenyc.com/gbfs/en/station_information.json' 
# 'https://gbfs.citibikenyc.com/gbfs/en/station_status.json' 
library(RCurl)   # For access to Internet data
library(jsonlite) # For decoding JSON
library(tidyverse)

station_link <- 'https://gbfs.citibikenyc.com/gbfs/en/station_status.json'
apiOutput <- getURL(station_link) # Grab the data
apiData <- fromJSON(apiOutput) # Parse the data
stationStatus <- apiData$data$stations
cols <- c('num_bikes_disabled','num_docks_disabled', 'station_id',
          'num_ebikes_available', 'num_bikes_available', 'num_docks_available')
stationStatus = stationStatus[,cols]

bikeURL <- 'https://gbfs.citibikenyc.com/gbfs/en/station_information.json'

apiOutput <- getURL(bikeURL) # Grab the data
apiData <- fromJSON(apiOutput) # Parse the data
stationInfo <- apiData$data$stations
stationInfo = stationInfo[,c('station_id','capacity', 'lon', 'lat', 'name')]

#b. Merge the datasets, based on 'station_id' 
leftJoin <- left_join(stationStatus, stationInfo, by='station_id')

#c. Clean the merged dataset to only include useful information 
# For this work, you only need lat, lon and the number of bikes available 
leftJoin <- leftJoin %>% select(lat, lon, num_bikes_available)
head(leftJoin)

