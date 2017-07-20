# OqTaConteseno
The backend and web version of the [oqtaconteseno-mobile](https://github.com/kdym/oqtaconteseno-mobile) application

## Application
* Ruby on Rails (Ruby v2.3.3, Rails v5.1.1)
* Gems used
    * Twitter Bootstrap
    * Font Awesome
    * Devise with Omniauth for Facebook
    * Geocoder
    * HTTParty

## Features
* Single Facebook login
* Javascript GoogleMaps API

## Features in Development
* Find user location and search for events nearby (map or list)
* Add new event on click at the map position

## Features to be implemented
* Add new event on long click at the map position
* Recursive events (Example: Event that occur every friday; A single event that occur on saturday 11AM to 5PM and repeats on sunday and monday; etc)
* Weather forecast condition for the event
* Send event location to GPS
* Import Facebook events
* Send browser notifications of events to come or events nearby based on user preferences
* Admin Area
