#!/bin/bash

HTTPGET="curl -A curl -s "
TRANSLATE="trans en:it -b"
COUNTRY=$($HTTPGET "ipinfo.io/country")
#REGION=$($HTTPGET "ipinfo.io/region")
#CITY=$($HTTPGET "ipinfo.io/city")

echo -e "Nazione selezionata \t: $COUNTRY\n\
Regione selezionata \t: $REGION\n\
Città selezionata \t: $CITY"

WEATHER_URL=
#"http://api.openweathermap.org/data/2.5/weather?q=$CITY,$COUNTRY&appid=1348822aee3c419e9160059a2ba1ff54"

WEATHER=$($HTTPGET $WEATHER_URL | jq '.weather[].main')
DESCRIPTION=$($HTTPGET $WEATHER_URL | jq '.weather[].description')

echo -e "Meteo :\t$($TRANSLATE $WEATHER)\nDescrizione :\t$($TRANSLATE $DESCRIPTION)"
