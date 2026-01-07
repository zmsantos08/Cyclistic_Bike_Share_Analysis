# Creating the new staged table
CREATE OR REPLACE TABLE `capstone-483020.divyy_tripdata.divyy_2025_staged` AS
SELECT *
FROM `capstone-483020.divyy_tripdata.divyy_2025_raw`;

# Creating the new cleaned table, data is already in the right format
CREATE OR REPLACE TABLE `capstone-483020.divyy_tripdata.divyy_2025_cleaned` AS
SELECT *
FROM `capstone-483020.divyy_tripdata.divyy_2025_staged`;

# Adding ride_length column
ALTER TABLE `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
ADD COLUMN ride_length FLOAT64;

# Populating ride_length column
UPDATE `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
SET ride_length = CAST(TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS FLOAT64) / 60
WHERE TRUE;

# Adding ride_length_group column
ALTER TABLE `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
ADD COLUMN ride_length_group STRING;

UPDATE `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
SET ride_length_group = 
    CASE 
        WHEN ride_length < 6 THEN "Short Commute"
        WHEN ride_length >= 6 AND ride_length < 30 THEN "Standard Trip"
        WHEN ride_length >= 30 AND ride_length < 120 THEN "Extended Ride"
        ELSE "Day Trip"
    END
WHERE TRUE;

# Adding day_of_week column
ALTER TABLE `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
ADD COLUMN day_of_week INT64;

# Populating day_of_week column
UPDATE `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
SET day_of_week = EXTRACT(DAYOFWEEK FROM started_at)
WHERE TRUE;

# Adding hour_of_day column
ALTER TABLE `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
ADD COLUMN hour_of_day INT64;

# Populating hour_of_day column
UPDATE `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
SET hour_of_day = EXTRACT(HOUR FROM started_at)
WHERE TRUE;
   

# Exploring ride_id duplicates
SELECT 
    ride_id, 
    COUNT(*) as duplicate_count
FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
GROUP BY ride_id
HAVING COUNT(*) > 1;

# Exploring null values
SELECT 
    COUNTIF(ride_id IS NULL) AS null_ride_ids,
    COUNTIF(rideable_type IS NULL) AS null_rideable_type,
    COUNTIF(started_at IS NULL) AS null_started_at,
    COUNTIF(ended_at IS NULL) AS null_ended_at,
    COUNTIF(start_station_name IS NULL) AS null_start_station_name,
    COUNTIF(start_station_id IS NULL) AS null_start_station_id,
    COUNTIF(end_station_name IS NULL) AS null_end_station_name,
    COUNTIF(end_station_id IS NULL) AS null_end_station_id,
    COUNTIF(start_lat IS NULL) AS null_start_lat,
    COUNTIF(start_lng IS NULL) AS null_start_lng,
    COUNTIF(end_lat IS NULL) AS null_end_lat,
    COUNTIF(end_lng IS NULL) AS null_end_lng,
    COUNTIF(member_casual IS NULL) AS null_member_casual
    
 FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`;

# Exploring the date fields
SELECT 
  MIN(started_at) as min_started, 
  MAX(started_at) as max_started, 
  MIN(ended_at) as min_ended, 
  MAX(ended_at) as max_ended

FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`;

# Exploring the rideable_type field
SELECT 
  rideable_type,
  COUNT(*) as num_trips
  
FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
GROUP BY rideable_type;

# Exploring the member_casual field
SELECT 
  member_casual,
  COUNT(*) as num_trips

FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
GROUP BY member_casual;

# Exploring ride_length
SELECT 
    MIN(ride_length) as min_ride_length,
    AVG(ride_length) as avg_ride_length,
    MAX(ride_length) as min_ride_length
FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`;

# Exploring ride_length negative values
SELECT 
started_at,
ended_at,
ride_length
FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
WHERE ride_length < 0;

# Adding 1 hour back to the 29 trips with negative ride_length
UPDATE `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
SET ended_at = TIMESTAMP_ADD(ended_at, INTERVAL 1 HOUR)
WHERE ended_at < started_at;

# Re-run ride_length script to update values
UPDATE `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
SET ride_length = TIMESTAMP_DIFF(ended_at, started_at, SECOND)/60
WHERE TRUE;

# Exploring ride_length oddly short trips
SELECT *
FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
WHERE ride_length < 1;

# Creating a cleaned table where ride_length > 1:00 minute
DELETE FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
WHERE ride_length < 1;

# Checking the new ride_length MIN, AVG, MAX
SELECT 

MIN(ride_length) as min_ride_length,
AVG(ride_length) as avg_ride_length,
MAX(ride_length) as max_ride_length

FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`;

# Exploring ride_length extremely high values

SELECT *
FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
WHERE ride_length >= 480 AND end_station_name IS NULL;

# Removing ride_length trips over 6 hours and empty end_station_name 

DELETE FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
WHERE ride_length >= 480 AND end_station_name IS NULL;

# Exploring ride_length_group
SELECT 
    ride_length_group, 
    COUNT(*) AS total_rides,
    MIN(ride_length) AS min_in_group,
    MAX(ride_length) AS max_in_group
FROM `capstone-483020.divyy_tripdata.divyy_2025_cleaned`
GROUP BY ride_length_group
ORDER BY min_in_group;






