# auto_set

[![Build Status](https://travis-ci.org/felipediesel/auto_set.svg?branch=master)](https://travis-ci.org/felipediesel/auto_set)
[![Coverage Status](https://coveralls.io/repos/felipediesel/auto_set/badge.svg?branch=master)](https://coveralls.io/r/felipediesel/auto_set?branch=master)
[![Code Climate](https://codeclimate.com/github/felipediesel/auto_set/badges/gpa.svg)](https://codeclimate.com/github/felipediesel/auto_set)

auto_set automaticly update a column from a relationship in Rails.

## Installation

You can use auto_set as a gem in Rails 4.

To use the gem version, put the following gem requirement in your `Gemfile`:

    gem "auto_set"

## Usage

Supposing you have 3 models: Project, Group and Task and when you create a task in a groupit need to be related also to project. So, to auto\_set update task.project_id with group.project.id, you do this:

    auto_set :project, :group


The is also another case where you have a code that can be entered by the user and you want to relate it to an id. Let's assume that Group has a column project\_code and you want to set project_id with that project id:

    auto_set :project, from: :code

## Customizing

You can set different type of callback:

    auto_set :column, :parent, before: :create

before can be used in both cases of use and it can be save (default), create or validation.

## Compatibility

Tested with Rails 4.0.13 in Ruby 2.0.0

## License

MIT License. Copyright 2011 29sul Tecnologia da Informação <http://www.29sul.com.br/>
