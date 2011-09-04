# Petit

simple, fast, rack-based url routing server. Links are stored in a yaml
file

## Highlights

* Your own url-shortner in minutes
* Links are precached, extremly fast routing
* Rack-based -> Deploy with heroku in minutes
* No Database setup/maintenance


## Getting Started

### Install the Gem

    gem install petit

### Initialize in the app directory

This will create links.yml in the current directory

    petit init

### Add your links to links.yml

Links are in simple YAML format

    foo: http://bar.com   # => will redirect http://yourdomain/foo to http://bar.com

### Deploy

   A config.ru will be generated during the initialization, or simply
place this in your rackup file

    require 'petit'
    run Petit::Router.builder

## Copying

Copyright (c) 2011 [Greg Osuri](http://gregosuri.com/about)

This is Free Software distributed under the terms of the MIT license.
See the file COPYING for information of licensing and distribution.

