# _Hike App_

#### _Application for finding Oregon hikes. Built with Ruby, 12 May 2017_

#### _By: **Aubrey Masten, Ben Williams, Kai deRochemont, Kat Gifford, Tyler Stephenson**_

## Description

This project was created at [Epicodus](https://www.epicodus.com/) in 3.5 days for a group project. Built after the fourth week of classes in **Ruby** to demonstrate an understanding of PostgreSQL databases, [Active Record](https://github.com/rails/rails/tree/master/activerecord) and many-to-many database relationships. All back-end behaviors were tested using RSpec and all front-end behaviors using RSpec and Capybara. The front end was built using Sinatra. It allows a user to create search for and access hikes in Oregon based on specific criteria. This project uses information sourced from [OregonHikers.org](http://www.oregonhikers.org/).

## Specifications

* _As a user, I want to be able to see a list of hikes available to me._
* _As a user, I want to be able to see a list of hikes available to me by region._
* _As a user, I want to be able to see a list of hikes available to me by features._
* _As a user, I want to be able to search available hikes by desired features._
* _As a user, I want to be able to search available hikes by desired elevation._
* _As a user, I want to be able to search available hikes by desired difficulty._
* _As a user, I want to be able to search available hikes by desired distance._
* _As a user, I want to be able to have a random hike picker for when I'm indecisive_

## Database Installation

This program depends on a [PostgreSQL](https://www.postgresql.org/) (Postgres) database to store information. Set up the database using the information below before running the program. These instructions were tested using macOS, and require you to have [Homebrew](https://brew.sh/) installed. Once you have done that, you can find [detailed instructions here](https://www.learnhowtoprogram.com/ruby/ruby-database-basics/installing-postgres-7fb0cff7-a0f5-4b61-a0db-8a928b9f67ef). Postgres installation is fairly straightforward on Windows machines, you can find a link to an installer [here](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads#windows).

* Install Homebrew (macOS only)
* Install PostgreSQL
* Start Postgres server
  * macOS: in a shell run the command `postgres`

## Database Setup

This program relies on a specific database naming conventions. The creation of these databases can be done using the rake gem. Once you have the repository on your computer (instructions below), run the command `bundle install` to install all necessary ruby gems. Then, in your shell, run the following commands to get your database up and running.

  * `rake db:create`
  * `rake db:migrate`

All unit and integration tests currently rely on a secondary development database named `hike_app_test`. If you would like to see unit and integration tests running, run this command to get the test database set up.

 * `rake db:test:prepare`

<!-- ## Database Schema

<img src="http://i.imgur.com/jOT8dxK.png" /> -->

## Setup/Installation Requirements

To run this site on your own machine you must have Ruby installed. All gems used in the project are included in the `Gemfile`, and the site was tested using the current bundled `Gemfile.lock`.

* Clone this repository in a shell using the command:
`git clone https://github.com/aubreymasten/shoe_stores`
* Follow Database Installation & Setup instructions above
* In the `hike_app` folder run the command `ruby app.rb`
* The site should be available in your browser at `localhost:4567` (the port number (`4567`) may not be accurate on every device. Check your shell, Sinatra should provide you the correct port.)

## Known Bugs

All development and setup instructions were tested on macOS using Ruby version 2.4.1.

## Support and contact details

_If you have any questions or find any issues with the site, get in touch with our developers by emailing Kat Gifford at Katgiff2007@gmail.com_

## Technologies Used

* _[Ruby](https://www.ruby-lang.org/en/)_
* _[Active Record](https://github.com/rails/rails/tree/master/activerecord)_
* _[Postgres](https://www.postgresql.org/)_
* _[RSpec](http://rspec.info/)_
* _[Sinatra](http://www.sinatrarb.com/)_
* _[Capybara](https://teamcapybara.github.io/capybara/)_
* _[Weather Underground API](https://www.wunderground.com/)_
* _[Google Maps API](https://developers.google.com/maps/)_


## License

MIT License

Copyright (c) 2017 Aubrey Masten, Ben Williams, Kai deRochemont, Kat Gifford & Tyler Stephenson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
