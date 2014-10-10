# OMarker(Link.ly)

The online and searchable bookmark app.

by [Ronald Porch](https://github.com/dada5714) and [Philip Q Nguyen](https://github.com/dada5714)

It contains two core functionalities:

- Website scraping
- Fast searching

## Description

Omarker lets users add their favorite links on the app, and quickly retrieve those links through a text search.

Omarker will scrape the targeted website for meta data, and it will be stored in the database for future searches. It scrapes title, meta, and the first paragraph if the meta does not exist.

The search techniques used by Omarker takes advantage of PG's built in search functionalities. This inclues full text searching in the english dictionary, double metaphone searching, and trigram (fuzzy) searching.

## Aesthetics

Omarker uses a modern metro style with pictures taken from scraped websites laid out as bricks on a grid. It also features endless scrolling. Below is a screenshot of the web app:

![Screenshot](http://i.imgur.com/yAUEAqt.png "Screenshot of Omarker")

## Core dependencies

- [MetaInspector](https://github.com/jaimeiniesta/metainspector): Web scraping
- [pg_serach](https://github.com/Casecommons/pg_search): Exposes PG's search capabilities in the Ruby language.
- [Masonry](http://masonry.desandro.com/): JS library for grid layouts
- [Masonry-Rails](https://github.com/kristianmandrup/masonry-rails): Additional libraries for Rails and Masonry
- [will_paginate](https://github.com/mislav/will_paginate): Pagination

## Thanks to

- [Brook Riggio](https://github.com/brookr): Advice on searching
- [Andrea Longhi](http://dev.mikamai.com/post/77171462056/easy-full-text-search-with-postgresql-and-rails): awesome blog post on searching
- [RailsCasts by Ryan Bates](http://railscasts.com): Very helpful videos.
