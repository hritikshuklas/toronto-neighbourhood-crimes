#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Hritik Shukla
# Date: 22 January 2024 
# Contact: hritik.shukla@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####
# Code snippet taken from:
# https://open.toronto.ca/dataset/toronto-beaches-observations/
# Dataset: Theft from Motor Vehicle

# get package
package <- show_package("neighbourhood-crime-rates")
package

# get all resources for this package
resources <- list_package_resources("neighbourhood-crime-rates")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

#### Save data ####
write_csv(data, "inputs/data/unedited_data.csv") 

         
