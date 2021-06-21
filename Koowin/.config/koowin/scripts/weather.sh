#!/bin/bash

api_key=5f11c4775331b6339fdf7964491e7b6e
city_id=2521215
url="api.openweathermap.org/data/2.5/weather?id=${city_id}&appid=${api_key}&cnt=5&units=metric&lang=en"
curl ${url} -s -o ~/.cache/weather.json