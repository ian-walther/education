# README

## Purpose
The purpose of this application is to allow the user to enter a search query of a college name. 
The application will show all matching colleges in Google Maps.

## Running Application
In order to run the application, clone the repo, install the appropriate Ruby version using RVM or rbenv, and run a `bundle install` and `yarn install`.

## Testing
In order to run the tests for the application, run `bundle exec rspec`

## Usage
Upon loading the page, the user will be greeted with a page consisting of a search box and a Google Maps view that is viewing the geographical center of the US.
The browser will auto-focus on the search box, and the user can use the Enter key to submit the input.
The application will return a list of search results within the Google Maps display.

## Running In Production

On an instance that already has docker installed, run `docker-compose build && docker-compose up -d` to start the application.

##Notes About Implementation
Given the simplicity of the application, most of the implementation is purely academic.
I intentionally implemented the College Scorecard integration using the backend for the purposes of demonstrating how I would implement a backend service object and to show how I would test a service object.
This could have been done in a more performant way by having the call to the College Scorecard API be done through the browser. 
Furthermore, controller tests have been omitted because of the trivial functionality that they would be testing in the case of this app.
Similarly, acceptance tests have been omitted because the vast majority of the functionality of the app relies on integrations.

Bootstrap was used as the front end component library for purposes of simplicty; if the app were to be implemented with a Javascript framework, things would be quite different.
Furthermore, JQuery was used heavily in the application because it was in scope due to Bootstrap's dependency on it.
If the application were to become more complex, a Javascript library such as Angular or React would make more sense.
