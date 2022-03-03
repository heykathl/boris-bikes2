# Boris Bikes
=============
To promote sustainable travel, TfL has introduced a program to deliver a rental bike system.

## Motivation
The purpose of this program is to emulate all docking stations, bikes and infrastructure. This will provide the community with easy access to sustainable travel, contributing to the sustainability objectives implemented by the Mayor of London.

## Installation
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`

## Features
-Displays available bikes in a docking station
-Can release and dock bikes
-Reporting whether a bike is working or not
-Ensuring that bikes can be docked at a docking station where there is available capacity

## Tests
There are a series of tests which can be run with the following (from the directory):
```
rspec
```
To run tests from specific class files, this can be done by:
```
rspec spec/<filename>.rb
```