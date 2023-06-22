# Example preprocessing script.
# view(US_Accidents)

if (file.exists("./data/grouped_accidents.csv")) {

    grouped_accidents <- read.csv("./data/grouped_accidents.csv")

    other_data <- read.csv("./data/data.csv");
    g1 <- merge(grouped_accidents, other_data, by = c("State", "County"))

} else {

library(dplyr)

US_Accidents <- read.csv("./data/US_Accidents.csv");
grouped <- US_Accidents %>% group_by(State, County);
grouped_accidents <- grouped %>% summarise(
                        accident_count=n(),
                        mean_severity=mean(Severity, na.rm=TRUE),
                        mean_distance=mean(Distance.mi., na.rm=TRUE),
                        mean_temperature=mean(Temperature.F., na.rm=TRUE),
                        mean_wind_chill=mean(Wind_Chill.F., na.rm=TRUE),
                        mean_humidity=mean(Humidity..., na.rm=TRUE),
                        mean_pressure=mean(Pressure.in., na.rm=TRUE),
                        mean_visibility=mean(Visibility.mi., na.rm=TRUE),
                        mean_wind_speed=mean(Wind_Speed.mph., na.rm=TRUE),
                        mean_precipitation=mean(Precipitation.in., na.rm=TRUE),
                        r_side_frac=sum(Side=="R")/n(),
                        amenity_frac=sum(Amenity=="True")/n(),
                        bump_frac=sum(Bump=="True")/n(),
                        crossing_frac=sum(Crossing=="True")/n(),
                        give_way_frac=sum(Give_Way=="True")/n(),
                        junction_frac=sum(Junction=="True")/n(),
                        no_exit_frac=sum(No_Exit=="True")/n(),
                        railway_frac=sum(Railway=="True")/n(),
                        roundabout_frac=sum(Roundabout=="True")/n(),
                        station_frac=sum(Station=="True")/n(),
                        stop_frac=sum(Stop=="True")/n(),
                        traffic_calming_frac=sum(Traffic_Calming=="True")/n(),
                        traffic_signal_frac=sum(Traffic_Signal=="True")/n(),
                        turning_loop_frac=sum(Turning_Loop=="True")/n(),
                        day_frac=sum(Sunrise_Sunset=="Day")/n(),
                        .groups = 'drop')

    other_data <- read.csv("./data/data.csv");
    g1 <= merge(grouped_accidents, other_data, by = c("State", "County"))

    write.csv(grouped_accidents, "./data/grouped_accidents.csv", row.names=FALSE)


}
