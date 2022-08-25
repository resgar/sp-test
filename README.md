# sp-test

## Requirements
* Ruby >= 3.1.x

## Installation
    $ bundle install

## Usage
    $ ./parser.rb spec/fixtures/files/webserver.log

## Running tests
    $ bundle exec rspec


## Architecture

`Evaluator` converts the input file into the format desired by `Analyzer`.

`Analyzer` talks to `Evaluator` and counts page views.

`Reporter` displays the data processed by `Analyzer`.

Each class performs only one action, so they have only one method in their public interfaces. On the other hand, none of the objects are instantiated inside call methods. Dependencies are either injected into the other class or instantiated in `initializer`. This helps to reduce the coupling between classes. 
