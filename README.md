Bringyoursausage
================

This is the source code for bringyoursausage.

Installation
------------

To run your own instance locally, you will first need ``ruby`` and ``postgresql`` installed.

To [install rails](http://rubyonrails.org/download/), run ``gem install rails``

Then retrieve the source, prepare your database, and run the server : 

    git clone https://github.com/calve/bringyoursausage
    cd bringyoursausage
    rake db:create
    rake db:migrate
    rails server

then open [0.0.0.0:3000](http://0.0.0.0:3000) in your web browser

Contribute
----------

You may want to have a look in ``app/views`` and ``add/assets/stylesheets`` to start customizing your version
