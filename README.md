# Adopt Don't Shop

Website that allows shelters to create profiles and add animals that can be adopted. Users can view different shelters and pets, both adoptable pets or pets pending adoption.

## How to install it

1. Make sure you have [Ruby v. 2.5.5](https://www.ruby-lang.org/en/documentation/installation/) and [Rails v. 5.1.7](http://installrails.com/) installed.
2. [Clone](https://help.github.com/en/articles/cloning-a-repository) this repo.
3. Once you have your local clone; navigate into the project, bundle your gems and create, migrate, and seed your database:
```
cd adopt_dont_shop
bundle install
rails db:create
rails db:migrate
rails db:seed
```
4. Run `rspec` in your terminal to ensure all tests are passing.
5. Run your server in your local environment (your computer). Enter in your terminal `rails s` and then visit `localhost:3000`.
6. To see the production site on Heroku, visit:  https://fathomless-lake-46536.herokuapp.com/

## Features

### Shelters
* Shelters Index page - List of all shelters in the database. With the option to sort shelters by number of adoptable pets or sort in alphabetical order.
* Shelter Show page - Details of a specific shelter.
* Shelter Creation - Fill out a form to create a new shelter.
* Shelter Update - Fill out a form to update any attribute of a shelter.
* Shelter Delete - Delete a specific shelter.

Relationship: A Shelter has many Pets.
| Attributes | Description | Requirement |
| ----- | ----- |-----|
| Name | Shelter name (string) | Required |
| Address | Address where they operate (string) | Required |
| City | City where they operate (string) | Required |
| State | State where they operate (string) | Required |
| Zip | Zipcode where they are located (string) | Required |

### Pets
* Pets Index page - List of all pets in the system. With the option to filter by pet status (adoptable/ pending adoption).
* Pets Show page - Details of a specific pet.
* Pets Update - Fill out a form to update any attribute of a pet.
* Pets Delete - Delete a specific pet.

Relationship: A Pet belongs to a Shelter.
| Attributes | Description | Requirement |
| ----- | ----- |-----|
| Image | Pet image path (string) | Required |
| Name | Product name (string) | Required |
| Description | Product description (text) | Required |
| Approximate age | Age in years (integer) | Required |
| Sex | Sex (enum - integer) | Required |
| Status | Active/ Inactive (enum - integer) | Adoptable by default |

### Shelter Pets
* Shelter Pets Index page - Shows the total pet count and all the pets that belong to a shelter. With the option to filter by pet status (adoptable/ pending adoption). Adoptable pets are displayed first.
* Shelter Pet Creation - Fill out a form to create a new pet related to that shelter.

## Built with
* Rails 5.1.7
* Ruby 2.5.5
* PostgreSQL
* HTML/CSS

## Testing
All test are done with RSpec with a 100% code coverage (calculated with [SimpleCov](https://github.com/colszowka/simplecov))

To run all tests, enter in your terminal:
```
$ cd adopt_dont_shop
$ rspec
```

To run a single test:
```
$ cd adopt_dont_shop
$ rspec spec/models/shelter_spec.rb #(e.g.)
```

To see the test coverage, run tests first then open coverage report:
```
$ rspec
$ open coverage/index.html
```