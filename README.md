# HexletCode

[![CI](https://github.com/Kvaizer/rails-project-63/actions/workflows/ci.yml/badge.svg)](https://github.com/Kvaizer/rails-project-63/actions/workflows/ci.yml)
[![hexlet-check](https://github.com/Kvaizer/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Kvaizer/rails-project-63/actions/workflows/hexlet-check.yml)

HexletCode is a small form generator for Ruby objects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new(job: 'hexlet')

HexletCode.form_for user, url: '/users' do |f|
  f.input :name
  f.input :job, as: :text, rows: 50, cols: 50
  f.submit 'Wow'
end
```

Result:

```html
<form action="/users" method="post"><label for="name">Name</label><input name="name" type="text" value=""><label for="job">Job</label><textarea name="job" cols="50" rows="50">hexlet</textarea><input type="submit" value="Wow"></form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code.
