#!/bin/bash

yum install ruby23 diffutils -y

gem install 'bundler'

cd itamae

bundle install --path vendor/bundle
