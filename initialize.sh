#!/bin/bash

yum install ruby23 git diffutils yum-utils -y

gem install bundler

cd itamae

bundle install
