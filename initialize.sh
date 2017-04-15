#!/bin/bash

yum install ruby23 -y

gem install bundler

cd itamae

bundle install
