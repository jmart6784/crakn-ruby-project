# CRäKN Introduction Project

This is an evaluation project for a Ruby position at CRäKN.  In the Projects section of this README you will find a description of each task.  Edit the files in folders to meet the requirements.  If at any point you feel stuck, feel free to stop and we can discuss your progress up to that point.  <ins>Completion of this project is not a requirement.</ins>  This just for CRäKN to have a starting point to discuss how you approach projects.

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](https://git-scm.com/)
* [Ruby](https://www.ruby-lang.org/)
* [Bundler](https://bundler.io/)

## Installation

* `git clone https://github.com/CRaKN/crakn-ruby-project` this repository
* `cd crakn-ruby-project`
* `bundle install`

## What to do When You are Done

Once you are complete with your project please do one of the following:

#### Commit the Project to Github
* Push to a public git repo
* Send the link to [techinterviews@crakn.net](mailto:techinterviews@crakn.net)

#### Zip and Email

* Zip the entire project
* Email the zip file to [techinterviews@crakn.net](mailto:techinterviews@crakn.net)

# Projects

## 1. Calculate Age

### Problem
Calculating the age of a person can be harder than you think.  You can't just subtract the years of two dates from eachother.  We need you to write a method that accepts two arguments - a birth date and a death date - and outputs the age of the person by are the time of the death date.

### Where to Begin
Start by researching age algorithms.  There are a few different approaches.  Edit `calculate_age.rb` and write the solution in the `age_at_death` method.

You can test your code at any time by running `bundle exec rspec spec/1_calculate_age` from terminal within this directory.

Be prepared to explain why you took the approach you did.

### Requirements
* You may not install any additional dependencies
* Method must accept two arguments and output the age of the person
* You may not alter the tests already in the test file.  Feel free to add additional tests.
* `bundle exec rspec spec/1_calculate_age` must pass

## 2. Match Person

### Problem

Currently we have a array of names and need to return any that match some criteria - in this case: First Name, Middle Name, and Last Name.  It gets a little more complicated than that though. We aren't always given all three values, so we want to find all that match the values given.

Example:  If we are only given a first name of Tyler, then the method should return an array of people with the first name Tyler.

### Where to Begin
Take a look at the spec file `spec/2_match_person/person_matcher_spec.rb` to see how we are calling the method.  Then open `lib/2_match_person/person_matcher.rb` and begin your `find_match` method.

Remeber that the method should always return an array.  If there are no matches, the array should be empty.

You can test your code at any time by running `bundle exec rspec spec/2_match_person/person_matcher_spec.rb` from terminal within this directory.

### Requirements
* You may not install any additional dependencies
* Method must accept keyword arguments
* You may not alter the tests already in the test file.  Feel free to add additional tests.
* `bundle exec rspec spec/2_match_person` must pass

## 3. Missing Tests

### Problem
It looks like someone wrote some code and a test. . . but it really isn't testing much.  We would like you to add some more tests around the functionality of `lib/3_forgot_tests/journal.rb`.

Feel free to add any specs you would like.

### Where to Begin
Look at `lib/3_forgot_tests/journal.rb` and `spec/3_forgot_tests/journal_spec.rb`.  See what is already being tested and what isn't.

You can test your code at any time by running `bundle exec rspec spec/3_forgot_tests/journal_spec.rb` from terminal within this directory.

### Requirements
* You may not install any additional dependencies
* Method must accept keyword arguments
* You may not alter the code already in the source file.
* You must add at least 1 additional test to the spec file.
* `bundle exec rspec spec/3_forgot_tests` must pass