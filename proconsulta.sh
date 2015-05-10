#!/bin/bash

bundle install
rake db:migrate
rspec
rails s