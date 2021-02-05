# Expenses Tracking Application #

Getting started

To get started with the app, first clone the repository and cd into the directory:

$ git clone https://github.com/alikrugl/Expenses_Application.git
$ cd Expenses_Application

Then install the needed gem
$ bundle install --without production

Next, migrate the database:
```
$ rails db:migrate
```
Finally, run the the app in a local server:

$ rails server
