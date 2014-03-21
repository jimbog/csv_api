CSV API
===
Description
---
This app uses grape to serve data from multiple csv files.
The data is retrieved by an AngularJS app that displays it on a table.

Usage
---
To use the app in the terminal just run 'ruby bin/csv_terminal.rb'

To use the web app, start the grape service move to the root of the project and type
'foreman start'

The table is sortable. To sort by any column just click on the header.

To save data to the 'bin/incoming.csv' file that's on the server. The
user just types on the input box and hits submit.

Demo
---
Here is a [DEMO](http://jimbog.github.io/csv_api/)
