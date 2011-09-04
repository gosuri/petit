# Petit

simple, fast, rack-based url routing server. Links are stored in a yaml
file

## Highlights

* Your own git friendly url-shortner in minutes
* Links are precached, extremly fast routing
* Rack-based. Deploy on heroku in minutes
* No database setup


## Getting Started

### Install the Gem

    gem install petit

### Initialize in the app directory

This will create links.yml and config.ru in the current directory. Won't
overwrite if you already have them.

    petit init

### Add your links to links.yml

Links are in simple YAML format

    foo: http://bar.com   # => will redirect http://yourdomain/foo to http://bar.com

### Deploy

   A config.ru will be generated during the initialization, or simply
place this in your rackup file

    require 'petit'
    run Petit::Router.builder

## Sample

I use Petit for [g3rg.me](http://gr3g.me). Checkout the [source](https://github.com/gosuri/gr3g.me).


## Copying

Copyright (c) 2011 [Greg Osuri](http://gr3g.me/about)

This is Free Software distributed under the terms of the MIT license.
See the file COPYING for information of licensing and distribution.

