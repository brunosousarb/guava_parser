Docs


# Prepare environment to build:

## Assure you have bundler installed
gem list | grep bundler

## Install bundler
(sudo) gem install bundler

How install from source code:

# first need to build the gem
gem build guava_parser.gemspec

# install the gem (* is the version)
gem install guava_parser-*.gem



#How to use

require 'guava_parser'

GuavaParser.parse('your guava string')