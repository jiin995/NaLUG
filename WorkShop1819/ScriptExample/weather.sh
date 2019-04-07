#!/bin/bash
#!/bin/bash
#-----------------------------------------------------------------------------
# NaLUG@UniNA
# 
# Restituisce le condizioni meteo secondo openweathermap e wttr.
#
# Richiede che siano installati i seguenti pacchetti :
#	- jq
#	- translate-shell
#	- curl
#-----------------------------------------------------------------------------


if [ $(sudo apt list --installed | grep -i translate | wc  -l) -lt 1 ] || [ $(sudo apt list --installed | grep -i jq | wc  -l) -lt 1 ]
	echo "Bisogna installare i pacchetti necessari"
	sh requirements.sh
fi


#Commando per effettuare le GET 
HTTPGET="curl -A curl -s "

#comando per effettuare la traduzione da inglese a italiano
TRANSLATE="trans en:it -b"

#Informazioni sul luogo reperite tramite il sito ipinfo
COUNTRY = $($HTTPGET "ipinfo.io/country")
REGION = $($HTTPGET "ipinfo.io/region")
CITY = $($HTTPGET "ipinfo.io/city")

echo -e "Nazione selezionata \t: $COUNTRY\n\
Regione selezionata \t: $REGION\n\
Città selezionata \t: $CITY"


#API KEY = 	54b574839db048d61e8be4ef11cabd41
#			b7779f94644c0c77e43c7b151637bbc2
#			1348822aee3c419e9160059a2ba1ff54

WEATHER_URL1= "http://api.openweathermap.org/data/2.5/weather?q=$CITY,$COUNTRY&appid=1348822aee3c419e9160059a2ba1ff54"
WEATHER_URL2= "$COUNTRY.wttr.in"

#Effettuo la richiesta delle informazioni tramite openweathermap
$HTTPGET $WEATHER_URL1 >> weather.json

WEATHER_OPEN=$(jq '.weather[].main' weather.json)
DESCRIPTION=$(jq '.weather[].description' weather.json)

echo -e "Meteo secondo openweathermap :\n\t$($TRANSLATE $WEATHER)\nDescrizione :\t$($TRANSLATE $DESCRIPTION)"

#Meteo secondo wttr
$HTTPGET $WEATHER_URL2
