CSV API
===


Overview
---
This app uses grape to serve data from multiple csv files.
The data is retrieved by an AngularJS app that displays it on a table.

Usage
---

* After cloning this repo you can use both versions of the app as follows:
To use the app in the terminal just type
```
ruby bin/csv_terminal.rb
```


* To use the web app, start the grape service move to the root of the project and type
```
foreman start
```


* To  sort by any column just click on its header.

* To save data to the 'bin/incoming.csv' file that's on the server. The
user just types on the input box and hits submit.

Demo
---
Here is a [DEMO](http://jimbog.github.io/csv_api/)

Details
---

This app is just a system to parse and sort a set of records

It is a 2-part app that works in the terminal and as a web app that takes as input files with a set of in CSV format delimited by different characters such as pipes, commas and spaces, as follows:

* > LastName | FirstName | Gender | FavoriteColor | DateOfBirth

* > LastName, FirstName, Gender, FavoriteColor, DateOfBirth

* > LastName FirstName Gender FavoriteColor DateOfBirth


The delimiters (commas, pipes and spaces) do not appear anywhere in the data values themselves.

This app reads in records from these files and combine them into a single set of records.

Output
---
The apps generates the following three outputs:

Output 1 – sorted by gender (females before males) then by last name ascending.
Output 2 – sorted by birth date, ascending.
Output 3 – sorted by last name, descending.

The dates in the format M/D/YYYY.


### The Grape API 

Has  the following specs

* POST /records - Post a single data line in any of the 3 formats supported by your existing code
* GET /records/gender - returns records sorted by gender
* GET /records/birthdate - returns records sorted by birthdate
* GET /records/name - returns records sorted by name

The records are return in the JSONP format to allow for crossdomain AJAX requests.
