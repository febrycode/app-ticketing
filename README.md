# App Ticketing

Simple App for Ticketing System use Ruby on Rails

## Setup

First, install [Ruby on Rails](https://gorails.com/setup/ubuntu/16.04)

Then run the following commands under the `app-ticketing` dir.

```
app-ticketing $ ruby -v # confirm Ruby present
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin17]
app-ticketing $ rails -v # confirm Rails present
Rails 5.2.1
app-ticketing $ bundle install # install dependencies
...
...
Bundle complete! 16 Gemfile dependencies, 68 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
app-ticketing $ 

```

## Usage

1. Clone the repository or download and extract it.
2. Start by doing 
```
app-ticketing $ rails s
```
3. To run spec test by doing
```
app-ticketing $ bundle exec rspec spec/