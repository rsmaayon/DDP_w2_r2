---
  title: "DDP_W2_R_Leaflet_output"
author: "T Sathiyanarayanan"
date: "27 May 2024"
output: html_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(leaflet)
library(htmlwidgets)
# Create the map object and add the default OpenStreetMap tiles
map <- leaflet() %>% 
  addTiles()

# Define the icon for Benrath Palace
benrathPalaceIcon <- icons(
  iconUrl = "http://www.schloss-benrath.de/fileadmin/_processed_/csm_corps-de-logis-blumen_2e04b2b859.jpg",
  iconWidth = 30*408/255, iconHeight = 30,
  iconAnchorX = 30*408/255/2, iconAnchorY = 30/2
)

# Define the popup content for Benrath Palace
benrathPalacePopup <- c("<a href='http://www.schloss-benrath.de/welcome/?L=1'>Benrath Palace<br><img src='http://www.schloss-benrath.de/fileadmin/_processed_/csm_corps-de-logis-blumen_2e04b2b859.jpg' width='210' height='132' alt='Foto Corps de Logis' title='Foto Corps de Logi'></a>")

# Add the marker with the custom icon and popup to the map
map <- map %>%
  addMarkers(lat = 51.161027, lng = 6.870550, popup = benrathPalacePopup, icon = benrathPalaceIcon)

# Print the map
map

# Save the map as an HTML file with the current date in the filename
current_date <- Sys.Date()
html_filename <- paste0("leaflet_map_", current_date, ".html")
saveWidget(map, file = html_filename)