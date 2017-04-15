#!/bin/bash

yum install ruby23 git diffutils -y

gem install bundler

cd itamae

bundle install
