# Refile::Mongoid

[Mongoid](http://mongoid.org/) extension for [Refile](https://github.com/refile/refile).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mongoid-refile'
```

## Usage

```ruby
class User
  include Mongoid::Document
  include Mongoid::Refile

  attachment :profile_image
end
```

## License

[MIT](/LICENSE.txt)
