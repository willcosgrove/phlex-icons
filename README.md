# Phlex::Icons

Phlex::Icons provides a simple way to add any icon library into your Rails application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'phlex-icons'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phlex-icons

## Usage

To demonstrate the usage, we will go through the setup process and demonstrate rendering icons in your Phlex views. For this example, we will install and use the [heroicons](https://github.com/tailwindlabs/heroicons) icon library.

### Step 1. Create the containing folder for your icon library

After adding the gem, run the `phlex::icons::library` generator to build your first icon library.

    $ bin/rails generate phlex:icons:library heroicons
    create  vendor/icons/heroicons
    create  config/initializers/phlex_icons.rb
    append  config/initializers/phlex_icons.rb

This will create the folder `heroicons` within `vendor/icons` and will be the folder that the icons will be rendered from.

### Step 2. Download and place icons within the new folder

To download the _heroicons_ library, go to [https://github.com/tailwindlabs/heroicons](https://github.com/tailwindlabs/heroicons) and click "Download".'

Once downloaded, open the zip file and find the folder `src/24`. Copy the two folders `outline` and `solid` into the new library folder (vendor/icons/heroicons) in your Rails app.

### Step 3. 






## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/willcosgrove/phlex-icons.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
